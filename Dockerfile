FROM alpine:3.10

RUN apk --no-cache --update add go git make musl-dev curl ca-certificates

ENV GOPATH /go

RUN go get github.com/JustinHop/cloudstack-cloudmonkey

#FROM alpine:3.9
#
#RUN echo echo
#
#RUN apk --no-cache add py2-pip py2-openssl readline curl libhistory git
#
#RUN apk --no-cache add readline-dev python-dev openssl-dev
#
RUN curl https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.pem.txt | tee /usr/local/share/ca-certificates/lets-encrypt-cross-signed.pem
RUN curl https://letsencrypt.org/certs/letsencryptauthorityx3.pem.txt | tee /usr/local/share/ca-certificates/lets-encrypt.pem
RUN /usr/sbin/update-ca-certificates
#
#RUN pip install --upgrade pip
#RUN pip install --upgrade git+https://github.com/apache/cloudstack-cloudmonkey.git
#RUN pip install --upgrade "requests[security]"
RUN mkdir /cloudmonkey
RUN ln -sv /cloudmonkey .cloudmonkey

RUN mkdir /cmk
RUN ln -sv /cmk .cmk
#
#RUN apk del readline-dev python-dev
#
#ENTRYPOINT ["cloudmonkey", "-c", "/cloudmonkey/config"]



RUN rm -rfv /go/src
RUN apk --purge del make musl-dev curl



#ENTRYPOINT ["/go/bin/cloudstack-cloudmonkey", "-c", "/cloudmonkey/config"]
ENTRYPOINT ["/go/bin/cloudstack-cloudmonkey"]
