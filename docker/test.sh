#!/bin/sh

###############################################################################
## No reload runs
###############################################################################
# mkdir /var/lib/max-load/noreload

# simple-load \
# -url=https://ambassador/load-testing/core \
# -rps=$RPS \
# -duration=$DURATION \
# -name=ambassador \
# -out=/var/lib/max-load/noreload/ambassador.csv \
# -reload=false

# sleep 10

# simple-load \
# -url=https://ambassador-core/load-testing/core \
# -rps=$RPS \
# -duration=$DURATION \
# -name=ambassador \
# -out=/var/lib/max-load/noreload/ambassador-core.csv \
# -reload=false

# sleep 10

# simple-load \
# -url=https://ingress-nginx.ingress-nginx/load-testing/core \
# -rps=$RPS \
# -duration=$DURATION \
# -name=ingress-nginx \
# -out=/var/lib/max-load/noreload/ingress-nginx.csv \
# -reload=false

# sleep 10

# simple-load \
# -url=https://haproxy-ingress.ingress-controller/load-testing/core \
# -rps=$RPS \
# -duration=$DURATION \
# -name=haproxy-ingress \
# -out=/var/lib/max-load/noreload/haproxy-ingress.csv \
# -reload=false

# sleep 10

# ###############################################################################
# ## Reload runs
# ###############################################################################
# mkdir /var/lib/max-load/reload

# simple-load \
# -url=https://ambassador/load-testing/core \
# -rps=$RPS \
# -duration=$DURATION \
# -name=ambassador \
# -out=/var/lib/max-load/reload/ambassador.csv \
# -reload=true

# sleep 10

# simple-load \
# -url=https://ambassador-core/load-testing/core \
# -rps=$RPS \
# -duration=$DURATION \
# -name=ambassador \
# -out=/var/lib/max-load/reload/ambassador-core.csv \
# -reload=true

# sleep 10

# simple-load \
# -url=https://ingress-nginx.ingress-nginx/load-testing/core \
# -rps=$RPS \
# -duration=$DURATION \
# -name=ingress-nginx \
# -out=/var/lib/max-load/reload/ingress-nginx.csv \
# -reload=true \

# sleep 10

# simple-load \
# -url=https://haproxy-ingress.ingress-controller/load-testing/core \
# -rps=$RPS \
# -duration=$DURATION \
# -name=haproxy-ingress \
# -out=/var/lib/max-load/reload/haproxy-ingress.csv \
# -reload=true

# sleep 10

# ###############################################################################
# ## Reverse reload runs
# ###############################################################################
# mkdir /var/lib/max-load/reverse

# simple-load \
# -url=https://ambassador/load-testing/core \
# -rps=$RPS \
# -duration=$DURATION \
# -name=ambassador \
# -out=/var/lib/max-load/reverse/ambassador.csv \
# -reload=true \
# -reload-flags=reverse

# sleep 10

# simple-load \
# -url=https://ambassador-core/load-testing/core \
# -rps=$RPS \
# -duration=$DURATION \
# -name=ambassador \
# -out=/var/lib/max-load/reverse/ambassador-core.csv \
# -reload=true \
# -reload-flags=reverse

# sleep 10

# simple-load \
# -url=https://ingress-nginx.ingress-nginx/load-testing/core \
# -rps=$RPS \
# -duration=$DURATION \
# -name=ingress-nginx \
# -out=/var/lib/max-load/reverse/ingress-nginx.csv \
# -reload=true \
# -reload-flags=reverse

# sleep 10

# simple-load \
# -url=https://haproxy-ingress.ingress-controller/load-testing/core \
# -rps=$RPS \
# -duration=$DURATION \
# -name=haproxy-ingress \
# -out=/var/lib/max-load/reverse/haproxy-ingress.csv \
# -reload=true \
# -reload-flags=reverse

# sleep 10

###############################################################################
## Endless scale reload runs
###############################################################################
# mkdir /var/lib/max-load/endlessScale

# simple-load \
# -url=https://ambassador/load-testing/core \
# -rps=$RPS \
# -duration=$DURATION \
# -name=ambassador \
# -out=/var/lib/max-load/endlessScale/ambassador.csv \
# -reload=true \
# -reload-flags=endlessScale

# sleep 30

# simple-load \
# -url=https://ambassador-core/load-testing/core \
# -rps=$RPS \
# -duration=$DURATION \
# -name=ambassador \
# -out=/var/lib/max-load/endlessScale/ambassador-core.csv \
# -reload=true \
# -reload-flags=endlessScale

# sleep 30

# simple-load \
# -url=https://ingress-nginx.ingress-nginx/load-testing/core \
# -rps=$RPS \
# -duration=$DURATION \
# -name=ingress-nginx \
# -out=/var/lib/max-load/endlessScale/ingress-nginx.csv \
# -reload=true \
# -reload-flags=endlessScale

# sleep 30

# simple-load \
# -url=https://haproxy-ingress.ingress-controller/load-testing/core \
# -rps=$RPS \
# -duration=$DURATION \
# -name=haproxy-ingress \
# -out=/var/lib/max-load/endlessScale/haproxy-ingress.csv \
# -reload=true \
# -reload-flags=endlessScale

###############################################################################
## Final reload runs
###############################################################################
mkdir /var/lib/max-load/final

simple-load \
-url=https://ambassador.ambassador/load-testing/core \
-rps=$RPS \
-duration=$DURATION \
-name=ambassador \
-out=/var/lib/max-load/final/ambassador-core.csv 

# sleep 30

# simple-load \
# -url=https://ambassador/load-testing/core \
# -rps=$RPS \
# -duration=$DURATION \
# -name=ambassador \
# -out=/var/lib/max-load/final/ambassador.csv \
# -reload=true \
# -reload-flags=final

# sleep 30

# simple-load \
# -url=https://ingress-nginx.ingress-nginx/load-testing/core \
# -rps=$RPS \
# -duration=$DURATION \
# -name=ingress-nginx \
# -out=/var/lib/max-load/final/ingress-nginx.csv \
# -reload=true \
# -reload-flags=final

# sleep 30

# simple-load \
# -url=https://haproxy-ingress.ingress-controller/load-testing/core \
# -rps=$RPS \
# -duration=$DURATION \
# -name=haproxy-ingress \
# -out=/var/lib/max-load/final/haproxy-ingress.csv \
# -reload=true \
# -reload-flags=final

# sleep 30

# simple-load \
# -url=https://traefik/load-testing/core \
# -rps=$RPS \
# -duration=$DURATION \
# -name=traefik \
# -out=/var/lib/max-load/final/traefik.csv \
# -reload=true \
# -reload-flags=final

cd /var/lib/max-load
trap 'python3 -m http.server' EXIT
set -ex