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
                echo 'alias pwn16="docker run --rm --privileged --cap-add=SYS_PTRACE --security-opt seccomp:unconfined -it -v $PWD:/root/work --name pwn16 pwn16:latest /bin/zsh"' >> .bashrc
                source .bashrc
                shift
                ;;
            pwn18)
                echo "[+] PWN18 install............."
                docker build -t pwn18 ./pwn18/
                echo 'alias pwn18="docker run --rm --privileged --cap-add=SYS_PTRACE --security-opt seccomp:unconfined -it -v $PWD:/root/work --name pwn18 pwn18:latest /bin/zsh"' >> .bashrc
                source .bashrc
                shift
                ;;
            pwn20)
                echo "[+] PWN20 install............."
                docker build -t pwn20 ./pwn20/
                echo 'alias pwn20="docker run --rm --privileged --cap-add=SYS_PTRACE --security-opt seccomp:unconfined -it -v $PWD:/root/work --name pwn20 pwn20:latest /bin/zsh"' >> .bashrc
                source .bashrc
                shift
                ;;
            pwn22)
                echo "[+] PWN22 install............."
                docker build -t pwn22 ./pwn22/
                echo 'alias pwn22="docker run --rm --privileged --cap-add=SYS_PTRACE --security-opt seccomp:unconfined -it -v $PWD:/root/work --name pwn22 pwn22:latest /bin/zsh"' >> .bashrc
                source .bashrc
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
    
    echo 'alias pwn16="docker run --rm --privileged --cap-add=SYS_PTRACE --security-opt seccomp:unconfined -it -v $PWD:/root/work --name pwn16 pwn16:latest /bin/zsh"' >> .bashrc
    echo 'alias pwn18="docker run --rm --privileged --cap-add=SYS_PTRACE --security-opt seccomp:unconfined -it -v $PWD:/root/work --name pwn18 pwn18:latest /bin/zsh"' >> .bashrc
    echo 'alias pwn20="docker run --rm --privileged --cap-add=SYS_PTRACE --security-opt seccomp:unconfined -it -v $PWD:/root/work --name pwn20 pwn20:latest /bin/zsh"' >> .bashrc
    echo 'alias pwn22="docker run --rm --privileged --cap-add=SYS_PTRACE --security-opt seccomp:unconfined -it -v $PWD:/root/work --name pwn22 pwn22:latest /bin/zsh"' >> .bashrc
    source .bashrc
elif [[ $1 = "-s" && $# -gt 1 ]]
then
    argv_process "$@"
else
    print_usage
fi
