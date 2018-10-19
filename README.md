# IOTA node in a Docker container

# Dependencies

- Docker
- a Docker network called `develop`. To change this, adapt `docker-compose.yml`.

# Running

- Copy `config.ini.example` to `config.ini`
- Configure some neighbours in `config.ini`
- `make start`

# Scripts

Various scripts are included for e.g. running the container, rebuilding, logging into the container while it's running.
