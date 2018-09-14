.PHONY: clean run small docker
all: run
SHELL=bash
RUN := $(PWD)/runs/run_$(shell date +%F-%H-%M-%S)
ARCHIVE=ftp://ftp.astron.nl/outgoing/EOSC/datasets/
TINY=L591513_SB000_uv_delta_t_4.MS
PULSAR=GBT_Lband_PSR.fil
SMALL=L570745_SB000_uv_first10.MS

# archive name is different from file name
SMALL_ARCHIVE=L570745_uv_first10.MS.tar.xz


.virtualenv/:
	virtualenv -p python2 .virtualenv
 
.virtualenv/bin/cwltool: .virtualenv/
	.virtualenv/bin/pip install -r requirements.txt

.virtualenv/bin/cwltoil: .virtualenv/
	.virtualenv/bin/pip install -r requirements.txt

.virtualenv/bin/udocker: .virtualenv/
	curl https://raw.githubusercontent.com/indigo-dc/udocker/master/udocker.py > .virtualenv/bin/udocker
	chmod u+rx .virtualenv/bin/udocker
	.virtualenv/bin/udocker install

data/$(PULSAR):
	cd data && wget $(ARCHIVE)$(PULSAR)

data/$(TINY)/:
	cd data && wget $(ARCHIVE)$(TINY).tar.xz && tar Jxvf $(TINY).tar.xz

tiny: data/$(TINY)/
	echo "data/$(TINY)/ is downloaded"

data/$(SMALL_ARCHIVE): 
	cd data && wget $(ARCHIVE)$(SMALL_ARCHIVE)

data/$(SMALL)/: data/$(SMALL_ARCHIVE)
	cd data && tar Jxvf $(SMALL_ARCHIVE)

small: data/$(SMALL)/
	echo "data/$(SMALL)/ is downloaded"

run-udocker: .virtualenv/bin/udocker .virtualenv/bin/cwltool
	mkdir -p $(RUN)
	.virtualenv/bin/cwltool \
		--user-space-docker-cmd `pwd`/.virtualenv/bin/udocker \
		--cachedir cache \
		--outdir $(RUN)/results \
		prefactor.cwl \
		jobs/job_20sb.yaml > >(tee $(RUN)/output) 2> >(tee $(RUN)/log >&2)

run: .virtualenv/bin/cwltool
	mkdir -p $(RUN)
	.virtualenv/bin/cwltool \
		--leave-tmpdir \
		--cachedir cache \
		--outdir $(RUN)/results \
		prefactor.cwl \
		jobs/job_20sb.yaml > >(tee $(RUN)/output) 2> >(tee $(RUN)/log >&2)

toil: data/$(SMALL)/ .virtualenv/bin/cwltoil
	mkdir -p $(RUN)/results
	.virtualenv/bin/toil-cwl-runner \
		--logFile $(RUN)/log \
		--outdir $(RUN)/results \
		--tmp-outdir-prefix $(PWD)/tmp \
		--workDir $(PWD)/work \
		--jobStore file://$(RUN)/job_store \
		prefactor.cwl \
		jobs/job_20sb.yaml | tee $(RUN)/output

slurm: data/$(SMALL) .virtualenv/bin/cwltoil
	mkdir -p $(RUN)/results
	.virtualenv/bin/toil-cwl-runner \
		--batchSystem=slurm  \
		--preserve-environment PATH \
		--logFile $(RUN)/log \
		--outdir $(RUN)/results \
		--jobStore file://$(RUN)/job_store \
		prefactor.cwl \
		jobs/job_20sb.yaml | tee $(RUN)/output


mesos: data/$(SMALL) 
	export PYTHONPATH=/usr/lib/python2.7/site-packages
	mkdir -p $(RUN)/results
	toil-cwl-runner \
		--batchSystem=mesos \
		--mesosMaster=145.100.59.50:5050 \
		--preserve-environment PATH \
		--logFile $(RUN)/log \
		--outdir $(RUN)/results \
		--jobStore file://$(RUN)/job_store \
		prefactor.cwl \
		jobs/job_20sb.yaml | tee $(RUN)/output

docker:
	docker build docker/ -t kernsuite/prefactor

prefactor.simg:
	singularity build prefactor.simg docker://kernsuite/prefactor

singularity: prefactor.simg
