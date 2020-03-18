" ------------------------------------------------------------------------------
" vim-hexo.vim
" Author:       <test.yu@gmail.com>
" Version:      0.1
" Date:         2019-03-21 19:24:59
" ------------------------------------------------------------------------------

if exists("g:vim_hexo")
    finish
endif

let g:vim_hexo = 1

scriptencoding utf-8

" ------------------------------------------------------------------------------
" post front-matter
"
" https://hexo.io/docs/front-matter
"
" ---
" layout: post
" title: title
" date: 2019-01-01 00:00:00
" categories: linux
" ---
" ------------------------------------------------------------------------------

function! HexoHeader()
    let linenum = line(".")
    let expr = []
    let expr += ['---']
    let expr += ['layout: post']
    let expr += ['title: title']
    let expr += ['date: ' . strftime('%Y-%m-%d %H:%M:%S')]
    let expr += ['categories: linux']
    let expr += ['updated: ' . strftime('%Y-%m-%d %H:%M:%S')]
    let expr += ['---']
    call append(linenum, expr)
    return ""
endfunction

function! HexoPostUpdated()
    if expand("%:e") == 'md'
        sil!'[,']s/^updated: \zs.*/\=strftime('%Y-%m-%d %H:%M:%S') /
    endif
endfunction

augroup HexoPostLastModified
    autocmd!

    autocmd BufWritePre,FileWritePre,FileAppendPre  *  :call HexoPostUpdated()
augroup END

" ------------------------------------------------------------------------------
" codeblock
"
" {% codeblock [title] [lang:language] [url] [link text] %}
" code snippet
" {% endcodeblock %}
"
" {% codeblock Array.map %}
" array.map(callback[, thisArg])
" {% endcodeblock %}
" Backtick Code Block
"
" This is identical to using a code block, but instead uses three backticks to
" delimit the block.
" ``` [language] [title] [url] [link text] code snippet ```
" ------------------------------------------------------------------------------

function! HexoCodeblock()
    let linenum = line(".")
    call append(linenum, ['{% codeblock lang:bash %}', '{% endcodeblock %}'])
    return ""
endfunction

" ------------------------------------------------------------------------------
" image tag
"
" {% img [class names] /path/to/image [width] [height] [title text [alt text]] %}
" ------------------------------------------------------------------------------

function! HexoImage()
    let linenum = line(".")
    call append(linenum, '{% img image-md|image-lg|image-hg /img/path [alt] %}')
endfunction

" ------------------------------------------------------------------------------
" block quote
"
" {% blockquote [author[, source]] [link] [source_link_title] %}
" content
" {% endblockquote %}
"
" {% blockquote Seth Godin http://sethgodin.typepad.com/seths_blog/2009/07/
" welcome-to-island-marketing.html Welcome to Island Marketing %}
" Every interaction is both precious and an opportunity to delight.
" {% endblockquote %}
" ------------------------------------------------------------------------------

function! HexoBlockQuote()
    let linenum = line(".")
    call append(linenum, ['{% blockquote %}', '{% endblockquote %}'])
endfunction

" ------------------------------------------------------------------------------
" iframe tag
"
" {% iframe url [width] [height] %}
" ------------------------------------------------------------------------------

function! HexoIframe()
    let linenum = line(".")
    call append(linenum1, '{% iframe url [width] [height] %}')
    return ""
endfunction

" ------------------------------------------------------------------------------
" post excerpt
"
" Use text placed before the <!-- more --> tag as an excerpt for the post.
" ------------------------------------------------------------------------------

function! HexoMore()
    let linenum = line(".")
    call append(linenum, '<!-- more -->')
endfunction

" ------------------------------------------------------------------------------
" Raw
"
" If certain content is causing processing issues in your posts,
" wrap it with the raw tag to avoid rendering errors.
" {% raw %}
" content
" {% endraw %}
" ------------------------------------------------------------------------------

function! HexoRaw()
    let linenum = line(".")
    call append(linenum, ['{% raw %}' , '{% endraw %}'])
    return ""
endfunction

" ------------------------------------------------------------------------------
" style tag
"
" for customize css
"
" <style>th:nth-of-type(1) { width: 30%; }</style>
" ------------------------------------------------------------------------------

function! HexoStyle()
    let linenum = line(".")
    call append(linenum, '<style>th:nth-of-type(1) { width: 30%; }</style>')
    return ""
endfunction

" ------------------------------------------------------------------------------
" article references list
" ------------------------------------------------------------------------------

function!  HexoReferences()
    let linenum =  line(".")
    let expr    =  []
    let expr += ['References']
    let expr += ['----------']
    let expr += ['']
    let expr += ['1. []()']
    let expr += ['2. []()']
    call append(linenum, expr)
    return ""
endfunction

" ------------------------------------------------------------------------------
" nmap for vim-hexo
" ------------------------------------------------------------------------------

nmap <silent> <leader>hb :call HexoBlockQuote()<CR>
nmap <silent> <leader>hc :call HexoCodeblock()<CR>
nmap <silent> <leader>hh :call HexoHeader()<CR>
nmap <silent> <leader>hi :call HexoImage()<CR>
nmap <silent> <leader>hm :call HexoMore()<CR>
nmap <silent> <leader>hr :call HexoReferences()<CR>
nmap <silent> <leader>hs :call HexoStyle()<CR>
nmap <silent> <leader>hw :call HexoRaw()<CR>

