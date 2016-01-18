FROM ubuntu:15.10

# Install MP4Box
RUN apt-get update -y
RUN apt-get install subversion build-essential zlib1g-dev supervisor -y
RUN svn co https://svn.code.sf.net/p/gpac/code/trunk/gpac gpac --trust-server-cert --non-interactive
RUN /gpac/configure
RUN make
RUN make install
RUN cp bin/gcc/libgpac.so /usr/lib

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]
