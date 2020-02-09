filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Nerdtree
Plugin 'scrooloose/nerdtree'

" Control P
Plugin 'ctrlpvim/ctrlp.vim'

" Auto close " ( [
Plugin 'Raimondi/delimitMate'

" Snippets require tlib & vom-addon-mw-utils
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

" Syntax higlighting for vue
Plugin 'posva/vim-vue'

" Syntax highlighting for blade
Plugin 'jwalton512/vim-blade'

" Syntax higlight for php
Plugin 'StanAngeloff/php.vim'

" Add git to the gutter
Plugin 'airblade/vim-gitgutter'

Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'ludovicchabant/vim-gutentags'

" PhpUnit test
Plugin 'janko-m/vim-test'

" Change ssurroundings
Plugin 'tpope/vim-surround'

" Comment stuff out using gcc
Plugin 'tpope/vim-commentary'

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" PHP Sniffer
Plugin 'joonty/vim-phpqa'

call vundle#end()            " required
filetype plugin indent on    " required
