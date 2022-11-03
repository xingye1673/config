syntax on
set mouse=a
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

"共享系统剪贴版
set clipboard=unnamedplus

"代码折叠
set foldmethod=indent
set foldlevel=99

"允许未保存切换Buffer
set hidden

call plug#begin('~/.config/nvim/plugged')
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'chuling/ci_dark'
Plug 'luochen1990/rainbow'
Plug 'gcmt/wildfire.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'junegunn/vim-peekaboo'
call plug#end()

"主题、透明背景
set termguicolors
colorscheme ci_dark

set fillchars+=vert:│

let g:airline_theme = 'ci_dark'
let g:lightline = {'colorscheme': 'ci_dark'}

"彩虹括号
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

"airline主题、配置
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1   
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" 设置环境变量 使java language server支持lombok
" let $JAVA_TOOL_OPTIONS="-javaagent:/Users/josh/dev/lombok.jar -Xbootclasspath/p:/Users/josh/dev"

" 快捷键配置开始=========================================================
let mapleader=" "

"打开关闭nerdtree文件目录
map <leader>3 :NERDTreeMirror<CR>
map <leader>3 :NERDTreeToggle<CR>
map <leader>4 :NERDTreeFind<CR>

"Undo Tree
map <leader>5 :UndotreeToggle<CR>

" 浮动terminal快捷键
let g:floaterm_keymap_toggle = "<leader>t"

" FZF
map <leader>f :FZF<CR>
map <leader>r :Ag<CR>

" easymotion
map <leader>e <Plug>(easymotion-s2)

" 切换buffer
map <leader>j :bp<CR>
map <leader>k :bn<CR>

"分屏快捷键
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

"移动分屏快捷键
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"insert模式移动光标
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

"基础快捷键
noremap Q :bd<CR>

"tab页快捷键
noremap tn :tabe<CR>
noremap tk :-tabnext<CR>
noremap tj :+tabnext<CR>

"移动选中的行
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

let g:coc_global_extensions = ['coc-marketplace', 'coc-actions', 'coc-json', 'coc-vimlsp', 'coc-html', 'coc-java', 'coc-java-debug','coc-tsserver', 'coc-go']

nmap <leader>cr <Plug>(coc-rename)
nmap <leader>cf <Plug>(coc-refactor)

" 右键菜单
let content_menus = [
            \ ["跳转到定义处", ":call CocAction('jumpDefinition')" ],
            \ ['跳转到声明处', ":call CocAction('jumpDeclaration')" ],
			\ ['跳转到实现处', ":call CocAction('jumpImplementation')" ],
            \ ['跳转到类型定义处', ":call CocAction('jumpTypeDefinition')" ],
            \ ['跳转到引用处', ":call CocAction('jumpReferences')" ],
			\ ['Show Commands', ':CocList commands' ],
            \ ['Show Actions', ':CocList actions' ],
            \ ['Show Info', ":call CocAction('doHover')" ],
			\ ]
"\ ['Rename', ":call CocAction('rename')" ],
