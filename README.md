# arduino-cli-wrapper
### A simple wrapper to make arduino-cli more usable

Requires ```jq``` in order to work.

Takes in as switch arguments -b for a board name, -p for a port and a file name as a last argument, or reads from a json file named ```sketch.json```, placed in the root dir of the sketch, formatted as follows:

```json
{
    "cpu": {
        "fqbn": "{FQBN}"
    },

    "port": "{PORT}",
    "file": "{FILE_PATH}"
}
```

Example:


```json
{
    "cpu": {
        "fqbn": "esp8266:esp8266:generic"
    },

    "port": "/dev/ttyUSB0",
    "file": "blink.ino"
}
```

This config file is compatible and was inspired with ACDB : https://github.com/Softmotions/acdb
