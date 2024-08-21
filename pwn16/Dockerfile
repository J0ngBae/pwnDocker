FROM ubuntu:16.04

ENV LANG=C.UTF-8
ENV LANGUAGE=C.UTF-8
ENV LC_ALL=C.UTF-8
WORKDIR /root

# Prevent User Interactive
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y
RUN apt install python3 python3-pip python3-dev git ruby libssl-dev libffi-dev build-essential libcapstone-dev zsh -y
RUN apt install curl gdb gcc g++ iputils-ping make netcat vim net-tools ssh tmux wget file -y

RUN dpkg --add-architecture i386
RUN apt update
RUN apt install libc6-i386 libc6-dbg gcc-multilib -y

# pwntools install
RUN python3 -m pip install -U "pip<21.0"
RUN python3 -m pip install -U pwntools


# ropper install
RUN python3 -m pip install capstone
RUN python3 -m pip install unicorn
RUN python3 -m pip install keystone-engine
RUN python3 -m pip install ropper

# one_gadget install <- Nope wtf?! maybe ruby version problem
# RUN apt install ruby-full ruby-dev -y
# RUN gem install one_gadget -v 1.3.4.1

# Pwngdb install
RUN git clone https://github.com/longld/peda.git ~/peda
RUN git clone https://github.com/scwuaptx/Pwngdb.git
RUN cp ~/Pwngdb/.gdbinit ~/

RUN chsh -s $(which zsh) 
RUN zsh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN sed -i 's|ZSH_THEME="robbyrussell"|ZSH_THEME="nicoulaj"|g' ~/.zshrc
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
RUN sed -i 's|plugins=(git)|plugins=(git zsh-syntax-highlighting zsh-autosuggestions)|g' ~/.zshrc
RUN echo 'ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan"' >> ~/.zshrc

CMD ["zsh"]

#alias pwn16="docker run --rm -it -v /Users/$USER/Downloads/pwn:/root/pwn --name ubuntu_16 young34844/ctf_ubuntu_16.04 /bin/zsh"