:set nocompatible
:set hlsearch
:set showmode
:set showcmd
:set ruler
:syntax on
:set shiftwidth=4
:filetype plugin on
:autocmd FileType c,cpp :set cindent
:autocmd FileType python :set softtabstop=4 shiftwidth=4 expandtab autoindent
:nmap <F7> :w<CR>:!xmllint --format --recover %<CR>:e<CR>
:nmap <F8> :w<CR>:!aspell --lang=ru -e -c %<CR>:e<CR>
:nmap <F9> :w<CR>:!aspell --lang=uk -e -c %<CR>:e<CR>
:map <F6> }{!}fmt -75<CR>}
:set keymap=russian-jcukenwin
:set iminsert=0
:set imsearch=0
:highlight lCursor guifg=NONE guibg=Cyan

"Configuration for javacomplete2
":autocmd FileType java set omnifunc=javacomplete#Complete
:autocmd FileType java set completefunc=javacomplete#Complete
":setlocal completefunc=javacomplete#CompleteParamsInfo 
:nnoremap <F4> call javacomplete#AddImport()<cr>

"Configuration for languagetool
:let g:languagetool_jar='$HOME/LanguageTool-3.1/languagetool-commandline.jar'

call plug#begin('~/.vim/plugged')
Plug 'artur-shaik/vim-javacomplete2'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-scripts/LanguageTool'
call plug#end()

:set background=dark
:colorscheme solarized

:map Ф A
:map И B
:map С C
:map В D
:map У E
:map А F
:map П G
:map Р H
:map Ш I
:map О J
:map Л K
:map Д L
:map Ь M
:map Т N
:map Щ O
:map Х P
:map Й Q
:map К R
:map Ы S
:map Е T
:map Г U
:map М V
:map Ц W
:map Ч X
:map Н Y
:map Я Z
:map ф a
:map и b
:map с c
:map в d
:map у e
:map а f
:map п g
:map р h
:map ш i
:map о j
:map л k
:map д l
:map ь m
:map т n
:map щ o
:map з p
:map й q
:map к r
:map ы s
:map е t
:map г u
:map м v
:map ц w
:map ч x
:map н y
:map я z
:map І S
:map і s
