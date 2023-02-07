FROM node:16
FROM mcr.microsoft.com/playwright:focal

COPY entrypoint.sh /

WORKDIR /slidev

RUN chmod +x /entrypoint.sh
RUN apt-get update && apt-get -y \
	install libnss3 libatk-bridge2.0-0 libdrm-dev libxkbcommon-dev libgbm-dev libasound-dev libatspi2.0-0 libxshmfence-dev \
  	&& rm -rf /var/lib/apt/lists/*
CMD [ "/entrypoint.sh"]

