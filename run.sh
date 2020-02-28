#/bin/bash
docker rm --force traefik-wms
#docker run -d -p 8080:8080 -p 80:80 -v $PWD/traefik.toml:/etc/traefik/traefik.toml -v $PWD/traefik-dynamic.toml:/etc/traefik/traefik-dynamic.toml --name traefik-wms traefik:v2.1.4
docker run -d -p 8080:8080 -p 80:80 --name traefik-wms traefik:v2.0-alpine
docker cp traefik.toml traefik-wms:/etc/traefik/
docker cp traefik-dynamic.toml traefik-wms:/etc/traefik/
docker restart traefik-wms && docker logs -f traefik-wms
