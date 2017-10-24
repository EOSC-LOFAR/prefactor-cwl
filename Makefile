.PHONY: clean run

all: run


clean:
	    rm -rf .virtualenv

.virtualenv/:
	virtualenv -p python2 .virtualenv

.virtualenv/bin/cwltool: .virtualenv/
	.virtualenv/bin/pip install -r requirements.txt

run: .virtualenv/bin/cwltool
#--cachedir cache 
	.virtualenv/bin/cwltool \
		--debug \
		--enable-ext \
		--outdir results \
		workflow.cwl \
		job.cwl
