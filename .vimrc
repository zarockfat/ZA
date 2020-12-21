"=========setting==========================================="
set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
" 自动缩进
 set autoindent
 set cindent
" " Tab键的宽度
 set tabstop=4
" " 统一缩进为4
 set softtabstop=4
 set shiftwidth=4
" " 不要用空格代替制表符
 set noexpandtab
" " 在行和段开始处使用制表符
 set smarttab
" " 显示行号
 set number
" " 历史记录数
" set history=1000
" "禁止生成临时文件
 set nobackup
 set noswapfile
" "搜索忽略大小写
 set ignorecase
" "搜索逐字符高亮
 set hlsearch
 set incsearch
" "行内替换
" set gdefault
" "编码设置
 set enc=utf-8
 set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
" "语言设置
" set langmenu=zh_CN.UTF-8
"set syntax=on

"{}()enter
set smartindent
set expandtab
imap{ {}<ESC>i<CR><ESC>O
imap ( ()<ESC>i

nmap <s-j> :<ESC>3j
nmap <s-k> :<ESC>3k

filetype off                 

set rtp+=/root/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'taglist.vim'
"Plugin 'cscope.vim'
Plugin 'vim-airline'
Plugin 'dracula/vim',{'name':'dracula'}
Plugin 'jpo/vim-railscasts-theme'
Plugin 'jacoborus/tender.vim'
Plugin 'brookhong/cscope.vim'
Plugin 'mhinz/vim-startify'

call vundle#end()           

syntax enable
"packadd! dracula
"colorscheme dracula
"colorscheme monokai
"colorscheme railscasts

if (has("termguicolors"))
    set termguicolors
endif
" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" Theme
syntax enable
colorscheme tender
" set lighline theme inside lightline config
let g:lightline = {'colorscheme': 'tender'}

" NerdTree才插件的配置信息
"将F2设置为开关NERDTree的快捷键"
map <f2> :NERDTreeToggle<cr>
""修改树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
""窗口位置
let g:NERDTreeWinPos='right'
""窗口尺寸
let g:NERDTreeSize=10
""窗口是否显示行号
let g:NERDTreeShowLineNumbers=1
""不显示隐藏文件
let g:NERDTreeHidden=0
let g:NERDTreeChDirMode=2
nn <silent><F2> :exec("NERDTree ".expand('%:h'))<CR>

let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1               "不同时显示多个文件的tag，只显示当前文件的
let Tlist_WinWidt =20                   "设置taglist的宽度             
let Tlist_Exit_OnlyWindow=1             "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window=1           "在右侧窗口中显示taglist窗口
let Tlist_Use_Left_Windo =1             "在左侧窗口中显示taglist窗口   
"let Tlist_Auto_Open=1
"let Tlist_Process_File_Always=1
""taglist始终解析文件中的tag，不管taglist窗口有没有打开
map <silent> <F8> :TlistToggle<cr>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
set laststatus=2 "1为关闭底部状态栏 2为开启"
set t_Co=256     "终端开启256色支持"
"打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
let g:airline#extensions#tabline#buffer_nr_show = 1
" 设置切换Buffer快捷键"
"nnoremap <C-tab> :bn<CR>
"nnoremap <C-s-tab> :bp<CR>
nmap <tab> :bn<cr> "设置tab键映射"
" 关闭当前 buffer
 noremap <C-x> :w<CR>:bd<CR>
" " <leader>1~9 切到 buffer1~9
 map <leader>1 :b 1<CR>
 map <leader>2 :b 2<CR>
 map <leader>3 :b 3<CR>
 map <leader>4 :b 4<CR>
 map <leader>5 :b 5<CR>
 map <leader>6 :b 6<CR>
 map <leader>7 :b 7<CR>
 map <leader>8 :b 8<CR>
 map <leader>9 :b 9<CR>

" cscope setting
set cscopequickfix=s-,c-,d-,i-,t-,e-
if has("cscope")
     set csprg=/usr/bin/cscope
     set csto=0
     set cst
     set nocsverb
     "add any database in current directory
     if filereadable("cscope.out")
         cs add cscope.out
     " else add database pointed to by environment
     elseif $CSCOPE_DB != ""
         cs add $CSCOPE_DB
     endif
     set csverb
endif
"nmap <C-s> :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-g> :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-c> :cs find c <C-R>=expand("<cword>")<CR><CR><c-w>lq<ESC>:copen<CR>
"nmap <C-t> :cs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <C-e> :cs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <C-f> :cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-i> :cs find i <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-d> :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-d> :<ESC>:cclose<CR><CR>

filetype plugin indent on  
