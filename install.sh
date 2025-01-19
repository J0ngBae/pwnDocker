#!/bin/zsh

CURRENT_SH=""
if [[ "$SHELL" =~ "zsh" ]]
then
    CURRENT_SH=~/.zshrc
else
    CURRENT_SH=~/.bashrc
fi

print_usage(){
    echo "[!] USAGE : ./install.sh [ options ]"
    echo "[+] -a : all Dockerfile build"
    echo "[+] -s : select Dockerfile build ( ex : ./install -s pwn16 )"
}

argv_process(){
    opt=$2
    case $opt in
        pwn16)
            echo "[+] PWN16 install............."
            docker build -t pwn16 -f pwn16/Dockerfile .
            ;;
        pwn18)
            echo "[+] PWN18 install............."
            docker build -t pwn18 -f pwn18/Dockerfile .
            ;;
        pwn20)
            echo "[+] PWN20 install............."
            docker build -t pwn20 -f pwn20/Dockerfile .
            ;;
        pwn22)
            echo "[+] PWN22 install............."
            docker build -t pwn22 -f pwn22/Dockerfile .
            ;;
        *)
            echo "There is no Dockerfile"
            ;;
    esac
}

if [ $# -lt 1 ]
then
    print_usage
    exit
fi

if [ $1 = "-a" ]
then
    echo "[+] PWN16 install............."
    docker build -t pwn16 -f pwn16/Dockerfile .
    echo "[+] PWN18 install............."
    docker build -t pwn18 -f pwn18/Dockerfile .
    echo "[+] PWN20 install............."
    docker build -t pwn20 -f pwn20/Dockerfile .
    echo "[+] PWN22 install............."
    docker build -t pwn22 -f pwn22/Dockerfile .
elif [[ $1 = "-s" && $# -gt 1 ]]
then
    argv_process "$@"
else
    print_usage
fi
