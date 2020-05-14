# pipeline-r-demo

Beispiel einer Pipeline, die folgendes kann:
- R Package bauen und überprüfen
- Erstellung eines Docker Images

```
name: Standard Pipeline

on:
  push:
  pull_request:

jobs:
  check:
    runs-on: ubuntu-18.04
    steps:
    - uses: actions/checkout@v2
    - uses: r-lib/actions/setup-r@v1
      with:
        r-version: 4.0.0

    - name: build
      run: R CMD build . --no-build-vignettes --no-manual

    - name: check
      run: R CMD check *tar.gz --no-build-vignettes --no-manual

  docker:
    runs-on: ubuntu-18.04
    steps:
    - uses: actions/checkout@v2

    - name: docker build
      run: docker build -t r-demo .
```

## Referenzen
- Building an R package: https://kbroman.org/pkg_primer/pages/build.html
- Checking an R package: https://kbroman.org/pkg_primer/pages/check.html

- Docker Pipeline: https://partner.bdr.de/gitlab/kfe-devops/docker-demo