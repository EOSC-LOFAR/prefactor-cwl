.PHONY: clean run

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
	cd data && tar Jxvf L570745_uv_first10.MS.tar.xz

run: data/L591513_SB000_uv_delta_t_4.MS/ .virtualenv/bin/cwltool
	.virtualenv/bin/cwltool \
		--cachedir cache \
		--outdir results \
		prefactor.cwl \
		job.cwl

toil: data/L570745_SB000_uv_first10.MS/ .virtualenv/bin/cwltoil
	.virtualenv/bin/cwltoil prefactor.cwl job_multisub.cwl
