FROM ubuntu:18.04

ARG ANGELHEAP_PATH='./angelheap'

ENV LANG=C.UTF-8
ENV LANGUAGE=C.UTF-8
ENV LC_ALL=C.UTF-8
WORKDIR /root

# Prevent User Interactive
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update

# For pwntools, one_gadget, zsh package
RUN apt install python3 python3-pip python3-dev git ruby libssl-dev libffi-dev build-essential zsh -y

# etc tools
RUN apt install curl gdb gcc g++ iputils-ping make netcat vim net-tools ssh tmux wget file -y

# 32bit cross compile & libc debugging symbols
RUN dpkg --add-architecture i386
RUN apt update
RUN apt install libc6-i386 libc6-dbg gcc-multilib -y

# angelheap copy
COPY ${ANGELHEAP_PATH}/angelheap_set /root/.angelheap_set

# pwntools install
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade pwntools

# ropper install
RUN python3 -m pip install capstone
RUN python3 -m pip install filebytes
RUN python3 -m pip install keystone-engine
RUN python3 -m pip install ropper

# gef install -> 2018.10 version install
# Because latest version is required gdb 10.0v or higher (2025.01.19 update)
RUN wget -O ~/.gdbinit-gef.py -q https://raw.githubusercontent.com/hugsy/gef/2018.10/gef.py
RUN echo source ~/.gdbinit-gef.py >> ~/.gdbinit

# Angelheap setting
RUN git clone https://github.com/scwuaptx/Pwngdb.git
RUN cat /root/.angelheap_set >> ~/.gdbinit

# one_gadget install
# [!] ruby version issue. one_gadget should use v1.9.0
RUN gem install one_gadget -v 1.9.0

# zsh setting
RUN chsh -s $(which zsh) 
RUN zsh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN sed -i 's|ZSH_THEME="robbyrussell"|ZSH_THEME="nicoulaj"|g' ~/.zshrc
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
RUN sed -i 's|plugins=(git)|plugins=(git zsh-syntax-highlighting zsh-autosuggestions)|g' ~/.zshrc
RUN echo 'ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan"' >> ~/.zshrc

CMD ["zsh"]
