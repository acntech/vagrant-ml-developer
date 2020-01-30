Exec {
    path => [ '/sbin', '/bin', '/usr/sbin', '/usr/bin' ]
}

include system
include git
include docker
include python3
include pip
include sqlite3
include conda
include zsh
