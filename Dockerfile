FROM alpine:3.7

RUN apk --update add \
	nano \
	openssl \
	nmap \
	nmap-scripts \
	tcptraceroute \
	&& rm -rf /var/cache/apk/*

ADD run.sh /run.sh
ADD bin/ /usr/local/bin

RUN chmod +x /usr/local/bin/* \
	&& chmod +x /run.sh

CMD ["/run.sh"]
