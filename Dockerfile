FROM alpine:3.1
MAINTAINER Frank Zhao <frank@frankzhao.net>

RUN apk add --update perl curl gzip tar make bind-tools nmap \
    && rm -rf /var/cache/apk/*
RUN curl http://www.cpan.org/authors/id/S/SS/SSCHECK/Net-BGP-0.16.tar.gz | tar -xz
RUN cd Net-BGP-0.16 && perl Makefile.PL && make && make install
RUN curl -O http://bgpsimple.googlecode.com/svn/trunk/bgp_simple.pl

RUN apk del curl gzip tar make

COPY ./startbgp.sh /bin/startbgp
RUN chmod +x /bin/startbgp && chmod +x /bgp_simple.pl

ENTRYPOINT ["startbgp"]
