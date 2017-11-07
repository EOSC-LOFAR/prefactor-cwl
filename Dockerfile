FROM kernsuite/base:3
RUN docker-apt-install lofar prefactor python-pip make nodejs-legacy
RUN pip install cwltool
ADD . /code
WORKDIR /code/data
RUN tar Jxvf L591513_SB000_uv_delta_t_4.MS.tar.xz
WORKDIR /code
RUN cwltool --no-container  prefactor.cwl job.cwl
