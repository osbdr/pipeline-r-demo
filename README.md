# pipeline-r-demo
Der Code für das Beispiel stammt von: https://rstudio.github.io/shinydashboard/get_started.html

Beispiel einer Pipeline, die folgendes kann:
- Erstellung eines Docker Images

```
name: Standard Pipeline

on:
  push:
  pull_request:

jobs:
  docker:
    runs-on: ubuntu-18.04
    steps:
    - uses: actions/checkout@v2

    - name: docker build
      run: docker build -t r-demo -f Dockerfile .
```