#FPATH=<SOMEWHERE>/zslot/src:$FPATH
autoload -Uz zslot

setopt CDABLE_VARS

if [[ -e ${ZUSER_SLOT_FILE_NAME} ]]; then;
    source ${ZUSER_SLOT_FILE_NAME}
; fi
