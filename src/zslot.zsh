# Licence : NYSL (http://www.kmonos.net/nysl/)

function zslot()
{
    function __zslot_gnu_base64_decode_opt()
    {
        [ -x "`which base64`" ] && {
            [ -n "$(base64 --version | grep 'GNU')" ] && {
                echo '-d'
            } || {
                echo '-D'
            }
        }
    }

    function __zslot_show_help()
    {
        echo "----------:("
        echo ""
        echo "-> zslot help"
        echo ""
        echo "    -s/--show   : Show current slot information / zslot -s"
        echo "    -p/--push   : Push target directory to slot / zslot -p <dir> <#slot>"
        echo "    -r/--remove : Remove record from slot       / zslot -r <#slot>"
        echo "    -m/--move   : Move to registered path       / zslot -m <#slot>"
        echo "    -i/--init   : Initialize configuration file / zslot -i"
        echo "    -h/--help   : Hi. It's me:)"
        echo ""
        echo "----------:)"
    }

    function __zslot_show_slot()
    {
        local sid d_path s d_path_b64

        [ -x "`which base64`" ] && {
            cat $ZUSER_SLOT_FILE_NAME | while read s; do
                sid=$(echo $s | cut -d ' ' -f 1)
                d_dest_b64=$(echo $(echo $s | sed 's/^[0-9]*/ /g' | tr -d ' '))

                [ $#d_dest_b64 != 0 ] && {
                    d_path=$(echo $d_dest_b64 | base64 $(__zslot_gnu_base64_decode_opt))
                } || {
                    d_path=""
                }

                echo "- ${sid} : ${d_path}"
            ; done
        } || {
            echo "[Error] : Command - base64 - not found"
        }
    }

    function __zslot_remove_slot()
    {
        local dest_id
        dest_id=$1

        [[ $dest_id -le $ZUSER_SLOT_MAX_SLOT_ID && $dest_id -ge 1 ]] && {
            cat $ZUSER_SLOT_FILE_NAME | grep -v "^${dest_id}" >  /tmp/zslottmp
            echo ${dest_id}                                   >> /tmp/zslottmp
            cat /tmp/zslottmp | sort -n                       >  $ZUSER_SLOT_FILE_NAME

            rm -f /tmp/zslottmp
        } || {
            echo "[Error] : Remove failed"
        }
    }

    function __zslot_move_slot()
    {
        [ -x "`which base64`" ] && {
        local d_path d_path_b64
            d_path_b64=$(echo $(cat $ZUSER_SLOT_FILE_NAME | grep "^${1}" | cut -d' ' -f2))
            d_path=$(echo $d_path_b64 | base64 $(__zslot_gnu_base64_decode_opt))

            [[ -d $d_path && -n "${d_path}" ]] && {
                cd $d_path
            } || {
                echo "[Error] : Directory (${d_path}) not found"
            }
        } || {
            echo "[Error] : Command - base64 - not found"
        }
    }

    function __zslot_push_slot()
    {
        local d_dest slot_id d_dest_b64
        d_dest=$1
        slot_id=$2

        [ -x "`which realpath`" -a -x "`which base64`" ] && {
            # If dest is not absolute path, convert
            [[ $d_dest[1] != '/' && $#d_dest > 0 ]] && {
                d_dest=$(realpath $1)
            } || {
                echo "[Error] zslot-push : Destination is not specified"
                return
            }

            # If slot id contains invalid value, skip
            [ ! -z "$(echo $slot_id | grep '[^0-9]')" ] && {
                echo "[Error] zslot-push : Invalid slot ID has been detected"
                return
            }

            [[ $slot_id -le $ZUSER_SLOT_MAX_SLOT_ID && $slot_id -ge 1 ]] && {
                [ -d $d_dest ] && {
                    [ -z "$(cat $ZUSER_SLOT_FILE_NAME | grep "^${d_dest}$")" ] && {
                        d_dest_b64=$(echo $d_dest | base64)
                        cat $ZUSER_SLOT_FILE_NAME | grep -v "^${slot_id}" >  /tmp/zslottmp
                        echo "${slot_id} ${d_dest_b64}" | tr -d '\n'      >> /tmp/zslottmp
                        cat /tmp/zslottmp | sort -n                       >  $ZUSER_SLOT_FILE_NAME
                        rm -f /tmp/zslottmp
                    } || {
                        echo "[Info] : Already registered. Skip."
                    }
                } || {
                    echo "[Error] : Directory not found"
                }
            } || {
                echo "[Error] : Slot out of bounds error"
            }
        } || {
            echo "[Error] : Command - realpath - or - base64 - not found"
        }
    }

    function __zslot_init_slot()
    {
        seq $ZUSER_SLOT_MAX_SLOT_ID > $ZUSER_SLOT_FILE_NAME
    }

    # Main codes
    local mode
    mode=$1

    [[ $mode != "" ]] && {
        case $mode in
            -s|--show)
                __zslot_show_slot;
                ;;
            -p|--push)
                __zslot_push_slot $2 $3;
                ;;
            -r|--remove)
                __zslot_remove_slot $2;
                ;;
            -m|--move)
                __zslot_move_slot $2;
                ;;
            -i|--init)
                __zslot_init_slot;
                ;;
            -h|--help)
                __zslot_show_help;
                ;;
            *)
                __zslot_move_slot $1;
                ;;
        esac
    } || {
        __zslot_show_help;
    }
}

function _zslot()
{
    _arguments \
        '(- *)'{-s,--show}'[Show slots]' \
        '(- *)'{-p,--push}'[Push current directory to slot]: :_files' \
        '(- *)'{-r,--remove}'[Remove slot with id]' \
        '(- *)'{-m,--move}'[Move to destination]' \
        '(- *)'{-i,--init}'[Initialize slots]' \
        '(- *)'{-h,--help}'[Show help]'
}

compdef _zslot zslot
