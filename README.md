# pipeline-r-demo
Der Code für das Beispiel stammt von: https://rstudio.github.io/shinydashboard/get_started.html

Beispiel einer Pipeline, die folgendes kann:
- Erstellung eines Docker Images

Die Dependencies werden mit Renovate aktualisiert. Mehr Infos: https://github.com/renovatebot/renovate

```
name: Standard Pipeline

on:
  pull_request:
    branches: '**'
  push:
    branches:
      - develop
  schedule:
    - cron: '0 20 * * 5'

jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2

    - name: docker build
      run: docker build -t r-demo -f Dockerfile .
```

## Referenzen
- Docker Pipeline: https://partner.bdr.de/gitlab/kfe-devops/pipeline-docker-nodejs-demo
