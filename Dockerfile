FROM kernsuite/base:3
RUN docker-apt-install lofar prefactor python-pip make nodejs-legacy
RUN pip --no-cache-dir install cwlref-runner html5lib "toil[cwl]"
