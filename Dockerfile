FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    asterisk \
    asterisk-core-sounds-en \
    && rm -rf /var/lib/apt/lists/*

COPY asterisk-extensions.conf /etc/asterisk/extensions.conf
COPY asterisk-sip.conf /etc/asterisk/sip.conf

EXPOSE 5060/udp 5060/tcp

CMD ["asterisk", "-f"]