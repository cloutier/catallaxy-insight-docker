FROM node:latest
WORKDIR /opt
RUN apt update && apt install -y git libzmq3-dev build-essential
RUN npm install -g --unsafe-perm=true bitcore-node
#RUN git clone https://github.com/cloutier/insight.git && cd insight && git checkout catallaxy
RUN bitcore-node create node && cd node && bitcore-node install insight-api && bitcore-node install insight-ui
#RUN ln -s /opt/insight /opt/node/node_modules/insight-ui
RUN cat /opt/node/bitcore-node.json
#COPY node.json /opt/node/bitcore-node.json
RUN ls /opt
RUN ls /opt/node/node_modules | grep insight
ENTRYPOINT cd /opt/node && bitcore-node start
EXPOSE 3001
