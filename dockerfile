FROM multiarch/alpine:aarch64-edge

ENV ADDRESS ADDRESS
ENV POOL POOL
ENV MINER MINER

# COPY xmrig-6.8.2-linux-static-x64.tar.gz /
RUN wget "https://github.com/xmrig/xmrig/releases/download/v6.8.2/xmrig-6.8.2-linux-static-x64.tar.gz" \
    && tar -xzvf xmrig-6.8.2-linux-static-x64.tar.gz \
    && apk add -U tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata

CMD /xmrig-6.8.2/xmrig -u ${ADDRESS}  -o ${POOL} -p ${MINER}
