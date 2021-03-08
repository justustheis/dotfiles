![Dotfiles](https://user-images.githubusercontent.com/7760415/72578616-d3746980-38d6-11ea-94a4-c9a11b0961b0.gif)
## Installation
> **Requires:**
- **[git](https://git-scm.com)**
- **[ctags](http://ctags.sourceforge.net)**
- **[grc](https://launchpad.net/ubuntu/+source/grc)**
- **[zsh](https://ohmyz.sh)**

**Ubuntu**
``` bash
$ sudo apt install git exuberant-ctags grc zsh composer vifm tmux ripgrep
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
$ composer global require "squizlabs/php_codesniffer=*"
$ composer global require friendsofphp/php-cs-fixer
$ git clone https://github.com/justustheis/dotfiles.git
$ bash ~/dotfiles/scripts/setup.sh
```
