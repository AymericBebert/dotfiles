# Dot Files

Configuration files for various applications

### Generate keys
```sh
ssh-keygen -t rsa -b 4096
ssh-keygen -t dsa
ssh-keygen -t ecdsa -b 521
ssh-keygen -t ed25519
```

### Install oh-my-zsh
```sh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

With powerlevel9k
```sh
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
```

##### Powerline fonts

Download the latest version of the symbol font and fontconfig file:

```sh
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
```

Move the symbol font to a valid X font path. Valid font paths can be listed with xset q:
```sh
mkdir -p ~/.local/share/fonts/
mv PowerlineSymbols.otf ~/.local/share/fonts/
```

Update font cache for the path the font was moved to (root privileges may be needed to update cache for the system-wide paths):
```sh
fc-cache -vf ~/.local/share/fonts/
```

Install the fontconfig file. For newer versions of fontconfig the config path is `~/.config/fontconfig/conf.d/`, for older versions it’s `~/.fonts.conf.d/`:

```sh
mkdir -p ~/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
```
