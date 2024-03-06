# Bash
```shell
cp homedir/.bashrc ~/.bashrc
```

# Git
```shell
apt install git
cat homedir/.gitconfig >> ~/.gitconfig
```
```shell
cp homedir/.bashrc ~/.bashrc
```

# Tmux
```shell
apt install tmux
cp homedir/.tmux.conf > ~/.tmux.conf
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

# Go
I used to download tarball from internet
```shell
cp homedir/.bashrc ~/.bashrc
```
