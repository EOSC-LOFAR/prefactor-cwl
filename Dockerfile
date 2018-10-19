FROM kernsuite/base:3
RUN docker-apt-install lofar prefactor python-pip libcasa-derivedmscal2 curl liblofarstman0 casacore-data
RUN pip --no-cache-dir install html5lib "toil[cwl]"
ENV PYTHONPATH /usr/lib/prefactor/scripts/
