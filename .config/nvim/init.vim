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

"共享系统剪贴版
set clipboard=unnamedplus

"代码折叠
set foldmethod=indent
set foldlevel=99

"允许未保存切换Buffer
set hidden

call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'connorholyday/vim-snazzy'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'voldikss/vim-floaterm'
Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/indentLine'
call plug#end()

"主题、透明背景
"let g:SnazzyTransparent = 1
color snazzy

"tab线 前置空格
"let g:indentLine_setColors = 0
"let g:indentLine_leadingSpaceChar = '.'
"let g:indentLine_leadingSpaceEnabled = 1

" airline主题、配置
let g:airline_theme='bubblegum'
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
let g:floaterm_keymap_toggle = "<leader>8"

" fzf
map <leader>f :FloatermNew fzf<CR>
map <leader>r :Rg<CR>

" coc相关
map <leader>d :call CocAction('jumpDefinition')<CR>

" coc-java
map <leader>o :CocCommand java.action.organizeImports<CR>
map <leader>c :CocCommand java.clean.workspace<CR>

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

"调整分屏大小快捷键
noremap m<up> :res +2<CR>
noremap m<down> :res -2<CR>
noremap m<left> :vertical resize-2<CR>
noremap m<right> :vertical resize+2<CR>

"tab页快捷键
noremap tn :tabe<CR>
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>

"移动选中的行
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

 




" 让输入上方，搜索列表在下方
"let $FZF_DEFAULT_OPTS = '--layout=reverse'

" 打开 fzf 的方式选择 floating window
let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }

let $FZF_DEFAULT_OPTS="--height 100% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"

" 浮动窗口函数
function! OpenFloatingWin()
	let height = &lines - 3
	let width = float2nr(&columns - (&columns * 2 / 10))
	let col = float2nr((&columns - width) / 2)

	" 设置浮动窗口打开的位置，大小等。
	" 这里的大小配置可能不是那么的 flexible 有继续改进的空间
	let opts = {
				\ 'relative': 'editor',
				\ 'row': height * 0.3,
				\ 'col': col + 30,
				\ 'width': width * 2 / 3,
				\ 'height': height / 2
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
