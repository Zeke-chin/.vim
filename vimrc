"""-----------------------map----------------------------------"""
map Q :q<CR>		"""退出
map R :source $MYVIMRC<CR>"""重启
map S :w<CR>		"""保存
map s <nop>		"""防止误触

noremap i k		"""上
noremap j h		"""下
noremap k j		"""左
noremap K 5j		"""快速下
noremap I 5k		"""快速上
noremap m i

noremap M I
noremap = nzz		"""在查找模式下换下一个查找目标并居中zz	
noremap - Nzz		"""在查找模式下换上一个查找目标并居中zz

map sd :set splitright<CR>:vsplit<CR>
map sa :set nosplitright<CR>:vsplit<CR>
map sw :set nosplitbelow<CR>:split<CR>
map sx :set splitbelow<CR>:split<CR>
map sq <C-w>t<C-w>K		"""改成上下分屏
map se <C-w>t<C-w>H		"""改成左右分屏
"""上下左右
map <LEADER>i <C-w>k
map <LEADER>k <C-w>j
map <LEADER>j <C-w>h
map <LEADER>l <C-w>l

"""↑↓←→分别表示分屏大小
map w<up> :res -5<CR>	
map w<down> :res +5<CR>
map w<left> :vertical resize+5<CR>
map w<right> :vertical resize-5<CR>

map tr :tabe<CR>    """打开新的标签页
map tf :-tabnext<CR>"""左一标签页
map th :+tabnext<CR>"""右一标签页

"""-----------------------set----------------------------------"""

set nocompatible	"""插件所需
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set encoding=utf-8	"""文件编码
let &t_ut=''		"""文件配置
"set mouse=a		"""允许使用鼠标🖱️


"""tab自定义
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

""" 光标自定义
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

""" 光标位置保存
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


set cursorline		"""下划线
set showcmd		"""右下角显示键入
set number 		"""显示行号

set wildmenu		"""代码补全 智能提示
set wrap		"""自动换行

set hlsearch		"""查找高亮
"""去除进去时显示上次搜索高亮
exec "nohlsearch"	
set incsearch		"""边输入边高亮
set ignorecase		"""忽略大小写
set smartcase		"""智能大小写

let mapleader=" "
"""空格 + ↵ 取消高亮 
noremap <LEADER><CR> :nohlsearch<CR>

"""-----------------------plug----------------------------------"""

""call  plug#begin ( ' ~/.vim/plugged ' )
""Plug 'connorholyday/vim-snazzy'
""Plug 'vim-airline/vim-airline'

""call plug#end()
""let g:SnazzyTransparent = 1

""以下是Plug的配置
call plug#begin('~/.vim/plugged')

	Plug 'junegunn/vim-easy-align'
	Plug 'connorholyday/vim-snazzy'
	Plug 'vim-airline/vim-airline'
	Plug 'preservim/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'mbbill/undotree'

call plug#end()


"	插件配置	"
""透明
let g:SnazzyTransparent = 1

" ===
" === NERDTree
" ===	
" T 打开新的标签页
map tt :NERDTreeToggle<CR>
"""let NERDTreeShowLineNumbers=1	"显示行号
""当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ==
" == NERDTree-git
" ==
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" ===
" === Undotree
" ===
let g:undotree_DiffAutoOpen = 0
map L :UndotreeToggle<CR>
