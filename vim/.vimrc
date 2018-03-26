syntax on

let mapleader="ö"


" visuals
set number
set ignorecase
set nowrap
set listchars=tab:\ \ ,trail:· " show trailing whitespace
set list


" show zsh-like menu for tab completion
set wildmenu

" highlight matching parenthesis
set showmatch

" highlight search results
" set hlsearch
" search while typing
set incsearch

" whitespace
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent


" no cursor keys
noremap <Up>	  <nop>
noremap <Down>	<nop>
noremap <Left>	<nop>
noremap <Right>	<nop>


" insert character under cursor
nnoremap <Space> i_<Esc>r

" delete previous character and insert
nnoremap S hs


" jump to start of line in normal & visual mode and
" as word object (allows eg cm, dm)
nnoremap m $
vnoremap m $
onoremap m $

" jump to end of line in normal & visual mode and
" as word object (allows eg cM, dM)
nnoremap M ^
vnoremap M ^
onoremap M ^


" search with enter
nnoremap <CR> /
" don't search with / until I learned the above
nnoremap / <nop>


" shortcut for make
nmap <leader>m :w<CR>:make!<CR>


" open horizontal/ vertical terminal
nnoremap <leader>T :terminal<CR>
nnoremap <leader>t :vertical terminal<CR>


" search for visually selected text
vnoremap // y/<C-R>"<CR>


" indent with tab in visual mode
vnoremap <tab> >gv
vnoremap <S-tab> <gv
nnoremap <tab> >>
nnoremap <S-tab> <<


" show/ hide highlights
nnoremap <leader>H :set hlsearch<CR>
nnoremap <leader>h :set nohlsearch<CR>


" add line above/ below
nnoremap <leader>k O<Esc>j
nnoremap <leader>j o<Esc>k


" change buffer with wasd
nnoremap <leader>w <C-w>k
nnoremap <leader>a <C-w>h
nnoremap <leader>s <C-w>j
nnoremap <leader>d <C-w>l

nnoremap <C-w>k <nop>
nnoremap <C-w>h <nop>
nnoremap <C-w>j <nop>
nnoremap <C-w>l <nop>
