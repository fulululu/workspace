# Zsh
```shell
cp homedir/.zshrc ~/.zshrc
```

# Clash X Pro Premium
download corresponding `.dmg` file from internet.
```shell
cp homedir/.config/clash ~/.config/clash
```
```shell
cp homedir/.zshrc ~/.zshrc
```

# Homebrew
```shell
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
```shell
cp homedir/.zshrc ~/.zshrc
```

# Git
```shell
brew install git
cat homedir/.gitconfig >> ~/.gitconfig
```
```shell
cp homedir/.zshrc ~/.zshrc
```

# Iterm2
```shell
brew install iterm2
cp -r homedir/.config/iterm2 ~/.config
```

# Tmux
```shell
brew install tmux
cp homedir/.tmux.conf > ~/.tmux.conf
```

# Emacs
I used to build emacs from source code on my Macbook Pro (Retina, 13-inch, Early 2015) (MacOS Monterey 12.7.3)

```shell
# Step1: download
brew install git
git clone https://git.savannah.gnu.org/git/emacs.git -b emacs-29 --depth=1

# Step2: prepare
cd emacs
brew install autoconf texinfo
./autogen.sh
brew install pkg-config gnutls gcc@13
brew install harfbuzz jansson tree-sitter
brew install zlib libgccjit@13
ln -s /usr/local/Cellar/libgccjit/13.2.0/lib/gcc/current/libgccjit.0.dylib /usr/local/lib/
ln -s /usr/local/Cellar/libgccjit/13.2.0/lib/gcc/current/libgccjit.dylib /usr/local/lib/
cat <<EOF > /usr/local/lib/pkgconfig/libgccjit.pc
prefix=/usr/local/Cellar/libgccjit/13.2.0
exec_prefix=${prefix}
libdir=${prefix}/lib/gcc/current
includedir=${prefix}/include

Name: libgccjit
Description: Library for GCC for Just-In-Time compilation
Version: 13.2.0
Libs: -L${libdir} -lgccjit
Cflags: -I${includedir}
EOF

# Step3: configure
CC=gcc-13 ./configure --without-x --without-ns --with-mailutils --with-native-compilation --with-tree-sitter

# Step4: build
make -j4

# Step5: test
make check
./src/emacs -Q

# Step6: install
make install
```
```shell
cp -r homedir/.emacs.d ~
```

# Go
```shell
brew install go
```
```shell
cp homedir/.zshrc ~/.zshrc
```
