FROM archlinux:latest
WORKDIR /usr/local/bin
RUN pacman -Syu --noconfirm 
RUN pacman -S neovim which --noconfirm 
RUN pacman -S ansible-core ansible --noconfirm
COPY . .
