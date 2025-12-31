# Bash
```shell
cp homedir/.bashrc ~/.bashrc
```

# Git
```shell
apt install git

cat homedir/.gitconfig >> ~/.gitconfig

git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

cat <<EOF >> ~/.bashrc

# bash-git-prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  GIT_PROMPT_ONLY_IN_REPO=1
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi
EOF
```

# Tmux
```shell
apt install tmux

cat homedir/.tmux.conf >> ~/.tmux.conf
```

# Emacs
I used to build emacs from source code on my x86 PC (Debian 12.2)

```shell
# Step1: download
git clone https://git.savannah.gnu.org/git/emacs.git -b emacs-29 --depth=1

# Step2: prepare
apt build-dep emacs
apt install libtree-sitter-dev

# Step3: configure
cd emacs
./autogen.sh
CC=gcc-12 ./configure --without-x --without-ns --with-mailutils --with-native-compilation --with-tree-sitter

# Step4: build
make -j4

# Step5: test
make check
./src/emacs -Q

# Step6: install
make install
```
```shell
cp -r homedir/.emacs.d ~/.emacs.d
```

# C/C++
```shell
apt install bear build-essential clang clangd cmake

# Building ccls from source code (ref: https://github.com/MaskRay/ccls/wiki/Build)
```

# Python
```shell
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# Optional: Compile a dynamic Bash extension to speed up Pyenv. Don't worry if it fails.
cd ~/.pyenv && src/configure && make -C src

cat <<EOF >> ~/.bashrc

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"
EOF

cat <<EOF >> ~/.profile

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"
EOF
```

# Go
```shell
apt install go
cat <<EOF >> ~/.bashrc

# Add go bin directory to path
export PATH=$PATH:/usr/local/go/bin
EOF
go install golang.org/x/tools/gopls@latest
go install github.com/golangci/golangci-lint/v2/cmd/golangci-lint@latest
```
