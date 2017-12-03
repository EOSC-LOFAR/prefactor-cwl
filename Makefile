.PHONY: clean run
SHELL=bash
ARCHIVE=ftp://ftp.astron.nl/outgoing/EOSC/datasets/

TINY=L591513_SB000_uv_delta_t_4.MS
PULSAR=GBT_Lband_PSR.fil
SMALL=L570745_SB000_uv_first10.MS

all: run

.virtualenv/:
	virtualenv -p python2 .virtualenv
 
.virtualenv/bin/cwltool: .virtualenv/
	.virtualenv/bin/pip install -r requirements.txt

.virtualenv/bin/cwltoil: .virtualenv/
	.virtualenv/bin/pip install -r requirements.txt

data/$(PULSAR):
	cd data && wget $(ARCHIVE)$(PULSAR)

data/$(TINY)/:
	cd data && wget $(ARCHIVE)$(TINY).tar.xz && tar Jxvf $(TINY).tar.xz

data/$(SMALL)/:
	cd data && wget $(ARCHIVE)$(SMALL).tar.xz && tar Jxvf $(SMALL).tar.xz

run: data/$(SMALL)/ .virtualenv/bin/cwltool
	$(eval RUN=runs/run_$(shell date +%F-%H-%M-%S))
	mkdir -p $(RUN)
	.virtualenv/bin/cwltool --pack prefactor.cwl > $(RUN)/packed.cwl
	cp jobs/job_20sb.yaml $(RUN)/job.yaml
	.virtualenv/bin/cwltool \
		--cachedir cache \
		--outdir $(RUN)/results \
		prefactor.cwl \
	    jobs/job_20sb.yaml > >(tee $(RUN)/output) 2> >(tee $(RUN)/log >&2)

toil: data/$(SMALL)/ .virtualenv/bin/cwltoil
	$(eval RUN=runs/run_$(shell date +%F-%H-%M-%S))
	mkdir -p $(RUN)/results
	.virtualenv/bin/cwltool --pack prefactor.cwl > $(RUN)/packed.cwl
	cp jobs/job_20sb.yaml $(RUN)/job.yaml
	.virtualenv/bin/toil-cwl-runner --logFile $(RUN)/log \
		--outdir $(RUN)/results --jobStore file:///$(CURDIR)/$(RUN)/jobStore \
		prefactor.cwl jobs/job_2sb.yaml | tee $(RUN)/output

docker:
	docker build . -t kernsuite/prefactor
