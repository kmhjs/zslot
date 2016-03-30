# zslot

Zsh - Path slot plugin

## Purpose

* To add a kind of "Slot" (or short cut) to your terminal.
    * Internally, this plugin uses named directory [examples:aliasdirs - ZshWiki](http://zshwiki.org/home/examples/aliasdirs).
* Originally, this plugin was developed for Zsh.
    * Named as "zslot"

## Usage

```bash
zslot [options] [name] [path]
```

After you register the record, you can open stored directory as follows. 
```
cd ~registered_name
``` 
If you want to omit `~` when you open directory with `cd`, enable option `CDABLE_VARS` in `.zshrc`.

### Options

```bash
-a, --add
    USAGE:
        zslot -a [name] [path]
        zslot --add [name] [path]

-u, --update
    USAGE:
        zslot -u [name] [new dest]
        zslot --update [name] [new dest]

-r, --remove
    USAGE:
        zslot -r [name]
        zslot --remove [name]

-s, --show
    USAGE:
        zslot -s
        zslot --show

-h, --help
    USAGE:
        zslot -h
        zslot --help
```

## Installation

* Add some lines to your .zshenv from `.zshenv` of this project.
    * Variable `ZUSER_SLOT_FILE_NAME` defines file path of persistent store.
* Add some lines to your .zshrc from `.zshrc` of this project.
    * This file loads plugin.
    * If you want to omit `~` when you open directory with `cd`, enable option `CDABLE_VARS`. 
    * To enable persistent store, you need to `source` the file `ZUSER_SLOT_FILE_NAME`.

## Todo

## License

* The MIT Licence (MIT). See `LICENSE`.

## Others

This project was moved from my [gist](https://gist.github.com/kmhjs/7c2de0cbbd13f7ce8d43).
