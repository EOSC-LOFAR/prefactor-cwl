.PHONY: clean run
SHELL=bash

all: run

.virtualenv/:
	virtualenv -p python2 .virtualenv
 
.virtualenv/bin/cwltool: .virtualenv/
	.virtualenv/bin/pip install -r requirements.txt

.virtualenv/bin/cwltoil: .virtualenv/
	.virtualenv/bin/pip install -r requirements.txt

data/L591513_SB000_uv_delta_t_4.MS/:
	cd data && tar Jxvf L591513_SB000_uv_delta_t_4.MS.tar.xz

data/L570745_SB000_uv_first10.MS/:
	cd data && tar Jxvf L570745_uv_first10.MS.tar.xz

run: data/L570745_SB000_uv_first10.MS/ .virtualenv/bin/cwltool
	$(eval RUN=runs/run_$(shell date --iso-8601=seconds --utc))
	mkdir -p $(RUN)
	.virtualenv/bin/cwltool --pack prefactor.cwl > $(RUN)/packed.cwl
	cp jobs/job_20sb.yaml $(RUN)/job.yaml
	.virtualenv/bin/cwltool \
		--cachedir cache \
		--outdir $(RUN)/results \
		prefactor.cwl \
	    jobs/job_20sb.yaml > >(tee $(RUN)/output) 2> >(tee $(RUN)/log >&2)

toil: data/L570745_SB000_uv_first10.MS/ .virtualenv/bin/cwltoil
	$(eval RUN=runs/run_$(shell date +%F-%H-%M-%S))
	mkdir -p $(RUN)/results
	.virtualenv/bin/cwltool --pack prefactor.cwl > $(RUN)/packed.cwl
	cp jobs/job_2sb.yaml $(RUN)/job.yaml
	.virtualenv/bin/toil-cwl-runner --logFile $(RUN)/log \
		--outdir $(RUN)/results --jobStore file:///$(CURDIR)/$(RUN)/jobStore \
		prefactor.cwl jobs/job_2sb.yaml | tee $(RUN)/output
