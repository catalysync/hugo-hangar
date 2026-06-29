# hugo-hangar

Self-contained Hugo template for hangar: a multi-stage Dockerfile builds the
static site and serves it with Caddy bound to `$PORT`. Static sites have no
long-running app process, so the Dockerfile path avoids the buildpack
\"No start command detected\" failure on the worker host.
