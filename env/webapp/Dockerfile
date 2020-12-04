FROM node:15

RUN npm install -g @vue/cli

COPY config_db/db.json /root/.vue-cli-ui/db.json

COPY init.sh /init.sh

CMD bash /init.sh