filetype off
"设置vim-plug路径
call plug#begin('~/.vim/plugged')

"自动补全
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
" general
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
" python
Plug 'ncm2/ncm2-jedi'
" c/c++
Plug 'ncm2/ncm2-pyclang'
" markdown
"Plug 'oncomouse/ncm2-biblatex'
" rust
"Plug 'ncm2/ncm2-racer'
" vimscript
Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim'

"*************效率工具*******************
"vim-autopep8,自动格式化
Plug 'tell-k/vim-autopep8'

"自动引号/括号
Plug 'jiangmiao/auto-pairs'

"*************其他工具******************
"nerdtree 文件树
Plug 'scrooloose/nerdtree'

call plug#end()

" F3 开启关闭文件树
nnoremap <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" F6自动格式化
autocmd FileType python noremap <buffer> <F6> :call Autopep8()<CR>

" 不启用vi的键盘模式,而是vim自己的
set nocompatible
" 语法高亮支持
syntax on
" 载入文件类型插件,代替filetype off 
filetype plugin indent on
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

" F5 自动编译文件 Normal+Visual mode
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'cpp'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'java'
                exec "!javac %"
                exec "!time java %<"
        elseif &filetype == 'sh'
                :!time bash %
        elseif &filetype == 'python'
                "exec "!clear"
                exec "!time python3 %"
        elseif &filetype == 'html'
                exec "!firefox % &"
        elseif &filetype == 'go'
                " exec "!go build %<"
                exec "!time go run %"
        elseif &filetype == 'mkd'
                exec "!~/.vim/markdown.pl % > %.html &"
                exec "!firefox %.html &"
        endif
endfunc

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


"******************auto format设置***************
"vim-autopep8设置,关闭diff提示
let g:autopep8_disable_show_diff=1

"******************ncm2 设置***************
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
set shortmess+=c
inoremap <c-c> <ESC>
" 延迟弹窗,这样提示更加流畅
let ncm2#popup_delay = 5
"输入几个字母开始提醒:[[最小优先级,最小长度]]
"如果是输入的是[[1,3],[7,2]],那么优先级在1-6之间,会在3个字符弹出,如果大于等于7,则2个字符抬出----优先级概念请参考文档中 ncm2-priority 
let ncm2#complete_length = [[1, 1]]

"模糊匹配模式,详情请输入:help ncm2查看相关文档
let g:ncm2#matcher = 'substrfuzzy'
"使用tab键向下选择弹框菜单
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>" 
"使用shift+tab键向上选择弹窗菜单,这里不设置因为笔记本比较难操作.如果向下太多我通常习惯使用Backspace键再重新操作一遍
inoremap <expr> <S> pumvisible() ? "\<C-p>" : "\<S>"   



"****************jedi-vim设置*******************
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
"如果你想启用这个功能,auto_initialization必须开启
let g:jedi#show_call_signatures = 1
