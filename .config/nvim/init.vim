filetype off
" 载入文件类型插件,代替filetype off 
filetype plugin indent on
" 不启用vi的键盘模式,而是vim自己的
set nocompatible
" 语法高亮支持
syntax on
"************编码设置***************
" 设置编码格式为utf-8
set encoding=utf-8
" 自动判断编码时,依次尝试下编码
set fileencodings=utf-8,ucs-bom,GB2312,big5
"************行和列设置***************
" 显示行横线
set cursorline
" 显示行号
set nu
"************缩进设置***************
" 自动套用上一行的缩进方式
set autoindent
" 开智能缩进
set smartindent
" 光标移动到buffer的顶部和底部保持4行继续
set scrolloff=4
" 当光标移动到一个括号时,高亮显示对应的另一个括号
set showmatch
" 对退格键提供更好帮助
set backspace=indent,eol,start



"""""""""设置vim-plug路径"""""""""
call plug#begin('~/.vim/plugged')

" 自动补全
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

" nerdtree 文件树
Plug 'scrooloose/nerdtree'

call plug#end()



" F3 开启关闭文件树
nnoremap <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" F5 自动编译文件 Normal+Visual mode
map <F5> :call CompileRun()<CR>
func! CompileRun()
        exec "w"
        if &filetype == 'c'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'cpp'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'fortran'
                exec "!gfortran % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'sh'
                :!time bash %
        elseif &filetype == 'python'
                "exec "!clear"
                exec "!time python %"
        elseif &filetype == 'markdown'
		exec "CocCommand markdown-preview-enhanced.openPreview"
        endif
endfunc

" F6自动格式化
noremap <buffer> <F6> :call CocAction('format')<CR>

"##################################插件设置##################################

" *********** NERDTree插件配置 ***********
" 默认打开NERDTree
let NERDTreeChDirMode=2                                         " 设置当前目录为nerdtree的起始目录
let NERDChristmasTree=1                                         " 使得窗口有更好看的效果
let NERDTreeMouseMode=1                                         " 双击鼠标左键打开文件
let NERDTreeWinSize=25                                          " 设置窗口宽度为25
let NERDTreeQuitOnOpen=1                                        " 打开一个文件时nerdtree分栏自动关闭
" 打开文件默认开启文件树
"autocmd VimEnter * NERDTree

