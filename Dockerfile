FROM kernsuite/base:dev
RUN docker-apt-install lofar prefactor
ADD . /code
WORKDIR /code
RUN make run
