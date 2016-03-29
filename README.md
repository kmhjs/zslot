# zslot

Zsh - Path slot plugin

## Purpose

* To add a kind of "Slot" (or short cut) to your terminal.
* Originally, this plugin was developed for Zsh.
    * Named as "zslot"

## Usage

This plugin contains following options.

    -s/--show   : Show current slot information / zslot -s
    -p/--push   : Push target directory to slot / zslot -p <dir> <#slot>
    -r/--remove : Remove record from slot       / zslot -r <#slot>
    -m/--move   : Move to registered path       / zslot -m <#slot>
    -i/--init   : Initialize configuration file / zslot -i
    -h/--help   : Hi. It's me:)

## Installation

Add some lines to your .zshenv from .zshenv of this project.
Add some lines to your .zshrc from .zshrc of this project.

## Todo

* To support Zsh autoload
* __HIGH__ : Use named directory
    * Reference
        * [zshの名前付きディレクトリがとても便利 - pockestrap](http://pocke.hatenablog.com/entry/2014/07/23/173811)
    * Enable to load record file as one part of configuration file. (`source ${RECORD_FILE}`)

## Licence

* NYSL (http://www.kmonos.net/nysl/) 0.9981

## Others

This project was moved from my [gist](https://gist.github.com/kmhjs/7c2de0cbbd13f7ce8d43).
