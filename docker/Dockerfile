FROM kernsuite/base:3
RUN docker-apt-install lofar prefactor python-pip
RUN pip --no-cache-dir install html5lib "toil[cwl]"
ENV PYTHONPATH /usr/lib/prefactor/scripts/
