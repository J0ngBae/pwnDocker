#!/bin/bash

print_usage(){
    echo "[!] USAGE : ./install.sh [ options ]"
    echo "[+] -a : all Dockerfile build"
    echo "[+] -s : select Dockerfile build ( ex : ./install -s pwn16 )"
}

argv_process(){
    while [[ $# -gt 1 ]]
    do
        opt=$2
        case $opt in
            pwn16)
                echo "[+] PWN16 install............."
                docker build -t pwn16 ./pwn16/
                shift
                ;;
            pwn18)
                echo "[+] PWN18 install............."
                docker build -t pwn18 ./pwn18/
                shift
                ;;
            pwn20)
                echo "[+] PWN20 install............."
                docker build -t pwn20 ./pwn20/
                shift
                ;;
            pwn22)
                echo "[+] PWN22 install............."
                docker build -t pwn22 ./pwn22/
                shift
                ;;
            *)
                echo "There is no Dockerfile"
                shift
                ;;
        esac
    done
}

if [ $# -lt 1 ]
then
    print_usage
    exit
fi

if [ $1 = "-a" ]
then
    echo "[+] PWN16 install............."
    docker build -t pwn16 ./pwn16/
    echo "[+] PWN18 install............."
    docker build -t pwn18 ./pwn18/
    echo "[+] PWN20 install............."
    docker build -t pwn20 ./pwn20/
    echo "[+] PWN22 install............."
    docker build -t pwn22 ./pwn22/
elif [[ $1 = "-s" && $# -gt 1 ]]
then
    argv_process "$@"
else
    print_usage
fi