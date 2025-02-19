FROM node:20

WORKDIR /usr/src/artemis-test

COPY javascript ./javascript/
COPY typescript ./typescript/

# add packages to cache ($HOME/.npm)
RUN ROOTS="javascript javascript/staticCodeAnalysis typescript typescript/staticCodeAnalysis"; \
  for root in $ROOTS; do \
    cd "/usr/src/artemis-test/$root" && npm ci; \
  done; rm -rf $ROOTS
