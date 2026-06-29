# Build the Hugo static site, then serve it with Caddy bound to $PORT.
FROM hugomods/hugo:ext AS build
WORKDIR /src
COPY . .
RUN hugo --minify -d /public

FROM caddy:2-alpine
COPY --from=build /public /srv
# Caddy reads $PORT at runtime (hangar injects it) and file-serves /srv.
ENV PORT=8080
CMD ["sh","-c","caddy file-server --root /srv --listen :${PORT}"]
