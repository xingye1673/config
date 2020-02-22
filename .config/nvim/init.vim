syntax on
set number
set relativenumber
set cursorline
set wrap
set showcmd
"set cursorcolumn
set wildmenu
set hlsearch
set incsearch
set ignorecase
set smartcase
set scrolloff=5
set si
set ts=4
set sw=4
set termguicolors

call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
"Plug 'jodosha/vim-godebug'
"Plug 'vim-vdebug/vdebug'
call plug#end()

"主题、透明背景
"let g:SnazzyTransparent = 1
color snazzy

"打开关闭nerdtree文件目录
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

"分屏快捷键
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

"移动光标到分屏快捷键
noremap mh <C-w>h
noremap mj <C-w>j
noremap mk <C-w>k
noremap ml <C-w>l

"调整分屏大小快捷键
noremap m<up> :res +2<CR>
noremap m<down> :res -2<CR>
noremap m<left> :vertical resize-2<CR>
noremap m<right> :vertical resize+2<CR>

"tab页快捷键
noremap tn :tabe<CR>
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>
