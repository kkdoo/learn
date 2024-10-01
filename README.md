# README

## Installation

1) Copy .env example

```bash
cp .env.example .env
```

2) Build image

```bash
docker compose build
```

3) Run rails dev server

```bash
docker compose up
```

4) Open swagger generated docs http://localhost:3000/api-docs/

## Run specs

- Open terminal in docker

```bash
docker compose run --rm core bash
```

- Run specs

```bash
bin/rspec
```

- Run specs with simplecov report

```bash
COV=1 bin/rspec
```
