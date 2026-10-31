FROM node:24

WORKDIR /usr/src/artemis-test

COPY javascript ./javascript/
COPY typescript ./typescript/
COPY vitest ./vitest/

# add packages to cache ($HOME/.npm)
# javascript and typescript: Jest-based test repositories of existing exercises
# vitest: Vitest-based test repositories created from the current Artemis templates
RUN ROOTS="javascript javascript/staticCodeAnalysis typescript typescript/staticCodeAnalysis vitest/javascript vitest/javascript/staticCodeAnalysis vitest/typescript vitest/typescript/staticCodeAnalysis"; \
  for root in $ROOTS; do \
    cd "/usr/src/artemis-test/$root" && npm ci; \
  done; rm -rf $ROOTS
