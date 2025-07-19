_xbuild_complete() {
    local cur="${COMP_WORDS[COMP_CWORD]}"
    
    local XBUILD_OPTS="host x86_64-linux-gnu \
                       aarch64 aarch64-unknown-linux-gnu pi\
                       musl x86_64-alpine-linux-musl "

    XBUILD_OPTS+="--debug --src -ps --post-script clean "

    COMPREPLY=($(compgen -W "$XBUILD_OPTS" -- "$cur"))
}

complete -F _xbuild_complete ./xbuild
