# Build the Hugo static site, then serve it with Caddy bound to $PORT.
FROM ghcr.io/gohugoio/hugo:latest AS build
WORKDIR /src
COPY . .
USER root
RUN hugo --minify -d /public

FROM caddy:2-alpine
COPY --from=build /public /srv
ENV PORT=8080
CMD ["sh","-c","caddy file-server --root /srv --listen :${PORT}"]
