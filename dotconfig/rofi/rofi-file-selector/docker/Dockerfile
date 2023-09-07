FROM rust:alpine as BUILD

RUN apk add --no-cache musl-dev git wget \
&&  git clone https://github.com/theryangeary/choose.git \
&& cd choose \
&& cargo build --release \
&& cp target/release/choose /usr/bin
RUN cd /tmp \
&& wget https://github.com/sharkdp/fd/releases/download/v8.2.1/fd-v8.2.1-x86_64-unknown-linux-musl.tar.gz \
 && tar xf fd*tar.gz \
 && cp fd*linux-musl/fd /usr/bin

FROM ffurrer/bats
RUN apk add --no-cache coreutils bash findutils

COPY --from=BUILD /usr/bin/choose /usr/bin/fd /usr/bin/
RUN cp /usr/bin/yes /usr/bin/xsel # To allow dependency check to succeed
#COPY --from=BUILD /usr/bin/fd /usr/bin/fd

ENTRYPOINT [ ]



