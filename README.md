## Synopsis

This repository demonstrates how to flat a nested object into logstash. It rely on
ruby filter plugin.

```
filter {
    ruby {
      path => '/config-dir/flat_context.rb'
    }
}
```

## The latest version

You can find the latest version to ...

    git clone git@github.com:FabienArcellier/logstash_flat_object.git

## Usage

```bash
cat input.json | docker run -it --rm -v "$PWD":/config-dir logstash -f /config-dir/logstash.conf
```

## Installation

Logstash docker image required

```
docker pull logstash
```