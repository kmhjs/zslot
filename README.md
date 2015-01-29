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
Source .zslot in your .zshrc.

## Todo

* To support Zsh autoload

## Licence

* NYSL (http://www.kmonos.net/nysl/)
* Official : TBD.

## Others

This project was moved from my [gist](https://gist.github.com/kmhjs/7c2de0cbbd13f7ce8d43).
