@echo off
docker build --pull --rm --build-arg VERSION="2.5.22294" --build-arg PRERELEASE="false" -f Dockerfile -t triplea:2.5.22294 .
docker build --pull --rm --build-arg VERSION="2.6.14696" --build-arg PRERELEASE="true" -f Dockerfile -t triplea:2.6.14696-pre .