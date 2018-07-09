FROM kernsuite/base:3
RUN docker-apt-install lofar prefactor python-pip
RUN pip --no-cache-dir install html5lib "toil[cwl]"
COPY InitSubtract_deep_sort_and_compute.patch /root/ 
RUN cd /usr/lib/prefactor/scripts/ && patch -b -z .bak InitSubtract_deep_sort_and_compute.py /root/InitSubtract_deep_sort_and_compute.patch
ENV PYTHONPATH /usr/lib/prefactor/scripts/
