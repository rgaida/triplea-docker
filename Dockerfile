FROM eclipse-temurin:11-jre-alpine

ARG VERSION=2.5.22294
ARG PRERELEASE=false

WORKDIR /opt

RUN apk update && apk add bash

RUN if [ "$PRERELEASE" = "true" ]; then \
        wget https://github.com/triplea-game/triplea/releases/download/${VERSION}/triplea-game-headless.zip && \
        unzip triplea-game-headless.zip && rm triplea-game-headless.zip && rm run_bot*; \
    else \
        wget https://github.com/triplea-game/triplea/releases/download/${VERSION}/triplea-game-headless-${VERSION}.zip && \
        unzip triplea-game-headless-${VERSION}.zip && rm triplea-game-headless-${VERSION}.zip && rm run_bot*; \
    fi

RUN mkdir -p triplea/downloadedMaps && mkdir -p triplea/savedGames
COPY run_bot /usr/bin
RUN chmod +x /usr/bin/run_bot

VOLUME ["/opt/triplea/downloadedMaps","/opt/triplea/savedGames"]

CMD ["run_bot", "--help"]