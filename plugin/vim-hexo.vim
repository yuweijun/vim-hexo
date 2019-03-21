" ------------------------------------------------------------------------------
" vim-hexo.vim
" Author:       <test.yu@gmail.com>
" Version:      0.1
" Date:         2019-03-21 19:24:59
" ------------------------------------------------------------------------------

if exists("g:vim_hexo")
    finish
endif

" let g:vim_hexo = 1
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
    call setline(linenum + 1, '---')
    call setline(linenum + 2, 'layout: post')
    call setline(linenum + 3, 'title: title')
    call setline(linenum + 4, 'date: ' . strftime('%Y-%m-%d %H:%M:%S'))
    call setline(linenum + 5, 'categories: linux')
    call setline(linenum + 6, 'updated: ' . strftime('%Y-%m-%d %H:%M:%S'))
    call setline(linenum + 7, '---')
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
    call setline(linenum + 1, '{% codeblock lang:bash|java %}')
    call setline(linenum + 2, '{% endcodeblock %}')
endfunction

" ------------------------------------------------------------------------------
" image tag
"
" {% img [class names] /path/to/image [width] [height] [title text [alt text]] %}
" ------------------------------------------------------------------------------

function! HexoImage()
    let linenum = line(".")
    call setline(linenum + 1, '{% img image-md|image-lg|image-hg /img/path %}')
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
    call setline(linenum + 1, '{% blockquote %}')
    call setline(linenum + 2, '{% endblockquote %}')
endfunction

" ------------------------------------------------------------------------------
" iframe tag
"
" {% iframe url [width] [height] %}
" ------------------------------------------------------------------------------

function! HexoIframe()
    let linenum = line(".")
    call setline(linenum + 1, '{% iframe url [width] [height] %}')
endfunction

" ------------------------------------------------------------------------------
" post excerpt
"
" Use text placed before the <!-- more --> tag as an excerpt for the post.
" ------------------------------------------------------------------------------

function! HexoMore()
    let linenum = line(".")
    call setline(linenum + 1, '<!-- more -->')
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

function! HexoMore()
    let linenum = line(".")
    call setline(linenum + 1, '{% raw %}')
    call setline(linenum + 1, '{% endraw %}')
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
    call setline(linenum + 1, '<style>th:nth-of-type(1) { width: 30%; }</style>')
endfunction

" ------------------------------------------------------------------------------
" article references list
" ------------------------------------------------------------------------------

function! HexoReferences()
    let linenum = line(".")
    call setline(linenum + 1, 'References')
    call setline(linenum + 2, '----------')
    call setline(linenum + 3, '')
    call setline(linenum + 4, '1. []()')
endfunction
