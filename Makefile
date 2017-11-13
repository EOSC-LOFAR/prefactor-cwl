.PHONY: clean run
SHELL=bash

all: run


clean:
	rm -rf .virtualenv

.virtualenv/:
	virtualenv -p python2 .virtualenv
 
.virtualenv/bin/cwltool: .virtualenv/
	.virtualenv/bin/pip install -r requirements.txt

.virtualenv/bin/cwltoil: .virtualenv/
	.virtualenv/bin/pip install "toil[cwl]"

data/L591513_SB000_uv_delta_t_4.MS/:
	cd data && tar Jxvf L591513_SB000_uv_delta_t_4.MS.tar.xz

data/L570745_SB000_uv_first10.MS/:
	git lfs fetch
	git lfs checkout
	cd data && tar Jxvf L570745_uv_first10.MS.tar.xz

run: data/L591513_SB000_uv_delta_t_4.MS/ .virtualenv/bin/cwltool
	$(eval RUN=run_$(shell date --iso-8601=seconds --utc))
	mkdir $(RUN)
	.virtualenv/bin/cwltool --pack prefactor.cwl > $(RUN)/packed.cwl
	cp job.yaml $(RUN)/job.yaml
	.virtualenv/bin/cwl-runner \
		--cachedir cache \
		--outdir $(RUN)/results \
		prefactor.cwl \
		job.yaml > >(tee $(RUN)/output) 2> >(tee $(RUN)/log >&2)

toil: data/L570745_SB000_uv_first10.MS/ .virtualenv/bin/cwltoil
	$(eval RUN=run_$(shell date --iso-8601=seconds --utc))
	mkdir $(RUN)
	.virtualenv/bin/cwltool --pack prefactor.cwl > $(RUN)/packed.cwl
	cp job_multisub.yaml $(RUN)/job.yaml
	.virtualenv/bin/toil-cwl-runner --logFile $(RUN)/log \
		--outdir $(RUN)/results --jobStore file:///$(CURDIR)/$(RUN)/jobStore \
		prefactor.cwl job_multisub.yaml | tee $(RUN)/output
