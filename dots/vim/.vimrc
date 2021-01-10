set nocompatible              						"We want the latest Vim settings/options.

so ~/.vim/plugins.vim

syntax enable
set backspace=indent,eol,start                      "Make backspace behave like every other editor.
let mapleader = ',' 						    	"The default is \, but a comma is much better.
set number relativenumber							"Let's activate line numbers.
set noerrorbells visualbell t_vb=               	"No damn bells!
set updatetime=750                                  "Smaller is better, but smaller than 750 might produce glitches
set noshowmode                                      "Don't put a 'mode message' on the last line
set noruler                                         "Don't show the line number and the cursor position 
set laststatus=0                                    "No Statusline for last window
set noshowcmd                                       "No partial commands
set shortmess=F                                     "Avoid 'hit-enter' prompts 





"-------------Colorschemes--------------"
colorscheme nord
set t_CO=256										"Use 256 colors. This is useful for Terminal Vim.
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:airline_theme='lucius'





"-------------Search--------------"
set hlsearch										"Highlight all matched terms.
set incsearch										"Incrementally highlight, as we type.





"-------------Indents--------------"
set tabstop=4 shiftwidth=4 expandtab





"-------------Linebreaks--------------"
"Set standard hjkl to move inside linebreaks
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$





"-------------Split Management--------------"
set splitbelow										"Make splits default to below...
set splitright										"And to the right. This feels more natural.

"We'll set simpler mappings to switch between splits.
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>





"-------------Fix annoying typos--------------"
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q





"----------------Mappings--------------"
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>es :e ~/.vim/snippets/
nmap <Leader>ep :e ~/.vim/plugins.vim<cr>
nmap <Leader>c :tabclose<cr>
nmap <Leader><space> :nohlsearch<cr>
nmap <Leader>1 :NERDTreeToggle<cr>
nmap <Leader>w :w!<cr>
nmap <Leader>wq :wq!<cr>
nmap <Leader>t :TestNearest<cr>
nmap <Leader>ts :TestSuite<cr>
nmap <Leader>tf :TestFile<cr>
nmap <Leader>tl :TestLast<cr>

"Switch between buffers
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

"Open terminal inside Vim
nmap <Leader>tt :vert term<cr>


"----------------UltiSnips--------------"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"



"----------------Kite Auto Completion--------------"
let g:kite_supported_languages = ['*']


"----------------ctags--------------"
set statusline+=%{gutentags#statusline()}
let g:gutentags_ctags_exclude = ["storage", "public", ".git", "node_modules", "*vendor/*/test*", "*vendor/*/Test*", "vendor/*/Test", "vendor/*test", "bootstrap/cache"]
"open underlying path
nmap <Leader>o <C-]>





"-------------php-cs-fixer--------------"
let g:php_cs_fixer_rules = "@PSR2" 
let g:php_cs_fixer_php_path = "php"               " Path to PHP
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.
let g:phpqa_messdetector_autorun = 0
let g:phpqa_codesniffer_args = "--standard=psr2"





"--------------Laravel Specific----------------"
nmap <Leader>lrw :e routes/web.php<cr>
nmap <Leader>lra :e routes/api.php<cr>
nmap <Leader>lenv :e .env<cr>
nmap <Leader>lm :!php artisan make:
nmap <Leader>a :!php artisan
nmap <Leader><Leader>c :e app/Http/Controllers/<cr>
nmap <Leader><Leader>m :e app/Models/<cr>
nmap <Leader><Leader>r :e resources/<cr>
:command! Mfs !php artisan migrate:fresh --seed





"-------------- Git Specific ----------------"
nmap <Leader>gs :!git status<cr>
:command! Gs !git status





"--------------Auto import use ----------------"
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>





"--------------Ctrlp----------------"
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|.git\|public\|storage\|tags\|vendor'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
let g:ctrlp_show_hidden = 1





"--------------Buffers----------------"
augroup buffers
	function! SwitchBuffer()
		b#
	endfunction
augroup END
nmap <Leader>l :call SwitchBuffer()<CR>

" Run php-cs-fixer on save
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()





"--------------Auto-Commands----------------"
"Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

"Automatically switch between relative and normal line numbers
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
