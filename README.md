## Synopsis

This repository demonstrates how to flat a nested object into logstash. It rely on
ruby filter plugin.

## The latest version

You can find the latest version to ...

    git clone ...

## Usage

```bash
cat input.json | docker run -it --rm -v "$PWD":/config-dir logstash -f /config-dir/logstash.conf
```

## Installation

Logstash docker image required

```
docker pull logstash
```