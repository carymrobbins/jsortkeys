# jsortkeys

```
Sorts JSON from stdin given an explicit key order
Usage: jsortkeys [key1 [key2 [..]]]

Example:
$ jsortkeys foo bar <<< '{"bar":1,"foo":2}'
{"foo":2,"bar":1}
```

## Installation

Requires `stack`

```
$ git clone https://github.com/carymrobbins/jsortkeys
$ cd jsortkeys
$ stack install
```

The binary will be installed at `~/.local/bin/jsortkeys`
