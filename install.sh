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
    chk_alias=$(<$CURRENT_SH)

    opt=$2
    case $opt in
        pwn16)
            echo "[+] PWN16 install............."
            docker build -t pwn16 ./pwn16/

            if [[ "$chk_alias" =~ "pwn16=~/pwnDocker/utils/run16.sh" ]];
            then
                echo "[+] alias already set!"
            else  
                echo 'alias pwn16=~/pwnDocker/utils/run16.sh' >> $CURRENT_SH
            fi
            shift 0
            ;;
        pwn18)
            echo "[+] PWN18 install............."
            docker build -t pwn18 ./pwn18/

            if [[ "$chk_alias" =~ "pwn18=~/pwnDocker/utils/run18.sh" ]];
            then
                echo "[+] alias already set!"
            else  
                echo 'alias pwn18=~/pwnDocker/utils/run18.sh' >> $CURRENT_SH
            fi
            shift 0
            ;;
        pwn20)
            echo "[+] PWN20 install............."
            docker build -t pwn20 ./pwn20/

            if [[ "$chk_alias" =~ "pwn20=~/pwnDocker/utils/run20.sh" ]];
            then
                echo "[+] alias already set!"
            else  
                echo 'alias pwn20=~/pwnDocker/utils/run20.sh' >> $CURRENT_SH
            fi
            shift 0
            ;;
        pwn22)
            echo "[+] PWN22 install............."
            docker build -t pwn22 ./pwn22/

            if [[ "$chk_alias" =~ "pwn22=~/pwnDocker/utils/run22.sh" ]];
            then
                echo "[+] alias already set!"
            else  
                echo 'alias pwn22=~/pwnDocker/utils/run22.sh' >> $CURRENT_SH
            fi
            shift 0
            ;;
        *)
            echo "There is no Dockerfile"
            shift 0
            ;;
    esac
    source $CURRENT_SH
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
    
    echo 'alias pwn16="docker run --rm --privileged --cap-add=SYS_PTRACE --security-opt seccomp:unconfined -it -v $PWD:/root/work --name pwn16 pwn16:latest /bin/zsh"' >> ~/\.[a-zA-Z0-9]*shrc
    echo 'alias pwn18="docker run --rm --privileged --cap-add=SYS_PTRACE --security-opt seccomp:unconfined -it -v $PWD:/root/work --name pwn18 pwn18:latest /bin/zsh"' >> ~/\.[a-zA-Z0-9]*shrc
    echo 'alias pwn20="docker run --rm --privileged --cap-add=SYS_PTRACE --security-opt seccomp:unconfined -it -v $PWD:/root/work --name pwn20 pwn20:latest /bin/zsh"' >> ~/\.[a-zA-Z0-9]*shrc
    echo 'alias pwn22="docker run --rm --privileged --cap-add=SYS_PTRACE --security-opt seccomp:unconfined -it -v $PWD:/root/work --name pwn22 pwn22:latest /bin/zsh"' >> ~/\.[a-zA-Z0-9]*shrc
    source .bashrc
elif [[ $1 = "-s" && $# -gt 1 ]]
then
    argv_process "$@"
else
    print_usage
fi
