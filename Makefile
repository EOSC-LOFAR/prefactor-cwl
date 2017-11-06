.PHONY: clean run

all: run


clean:
	rm -rf .virtualenv

.virtualenv/:
	virtualenv -p python2 .virtualenv
 
.virtualenv/bin/cwltool: .virtualenv/
	.virtualenv/bin/pip install -r requirements.txt

data/L591513_SB000_uv_delta_t_4.MS/:
	cd data && tar Jxvf L591513_SB000_uv_delta_t_4.MS.tar.xz

run: data/L591513_SB000_uv_delta_t_4.MS/ .virtualenv/bin/cwltool
		#--debug \
	.virtualenv/bin/cwltool \
		--cachedir cache \
		--outdir results \
		prefactor.cwl \
		job.cwl
