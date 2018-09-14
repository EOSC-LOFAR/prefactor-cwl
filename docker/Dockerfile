FROM kernsuite/base:3
RUN docker-apt-install lofar prefactor python-pip libcasa-derivedmscal2 curl
RUN pip --no-cache-dir install html5lib "toil[cwl]"
RUN cd /usr/lib/prefactor/ && curl https://github.com/lofar-astron/prefactor/commit/dd0ec767ca4b20206155bb5100455697c712877b.patch | patch -p1
ENV PYTHONPATH /usr/lib/prefactor/scripts/
