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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'voldikss/vim-floaterm'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'skywind3000/vim-quickui'
Plug 'chuling/ci_dark'
Plug 'luochen1990/rainbow'
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
"let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1   
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" 设置环境变量 使java language server支持lombok
let $JAVA_TOOL_OPTIONS="-javaagent:/Users/josh/dev/lombok.jar -Xbootclasspath/p:/Users/josh/dev"

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

" fzf
map <leader>f :FloatermNew fzf<CR>
map <leader>r :Rg<CR>

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

"调整分屏大小快捷键
noremap m<up> :res +2<CR>
noremap m<down> :res -2<CR>
noremap m<left> :vertical resize-2<CR>
noremap m<right> :vertical resize+2<CR>

"tab页快捷键
noremap tn :tabe<CR>
noremap tk :-tabnext<CR>
noremap tj :+tabnext<CR>

"移动选中的行
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" 打开 fzf 的方式选择 floating window
let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }

let $FZF_DEFAULT_OPTS="--height 100% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"

" 浮动窗口函数
function! OpenFloatingWin()

  let height = float2nr((&lines - 2) / 1.5)
  let row = float2nr((&lines - height) / 2)
  let width = float2nr(&columns / 1.5)
  let col = float2nr((&columns - width) / 2)

  " Main Window
  let opts = {
    \ 'relative': 'editor',
    \ 'style': 'minimal',
    \ 'width': width,
    \ 'height': height,
    \ 'col': col,
    \ 'row': row,
    \ }

  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)

  " 设置浮动窗口高亮
  call setwinvar(win, '&winhl', 'Normal:Pmenu')

  setlocal
			\ buftype=nofile
			\ nobuflisted
			\ bufhidden=hide
			\ nonumber
			\ norelativenumber
			\ signcolumn=no
endfunction

let g:coc_global_extensions = ['coc-marketplace', 'coc-actions', 'coc-json', 'coc-vimlsp', 'coc-html', 'coc-java', 'coc-tsserver', 'coc-go', 'coc-vetur']

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
            \ ['Rename', ":call CocAction('rename')" ],
            \ ]

" set cursor to the last position
let content_menu_opts = {'index':g:quickui#context#cursor, 'color': 'ci_dark', 'border': 1}

" bind to leader-c
noremap <silent><leader>q :call quickui#context#open(content_menus, content_menu_opts)<CR>
