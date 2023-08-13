"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

" ===================================================== "
" This init.vim should be located in /etc/nvim/
" In order for this to work, a symlink needs to be
" created in /usr/share/nvim/site pointing to /etc/nvim
" and symlink /usr/share/nvim/sysinit.vim pointing to
" /etc/nvim/init.vim. In newer neovim versions the
" symlink is called archlinux.vim instead of sysinit.vim
" ===================================================== "
scriptencoding utf-8
let $VIMHOME= '/etc/nvim'

set backupdir=~/.nvim/backup//
set directory=~/.nvim/swap//

let mapleader = ','
" Keep backward f search, remapping it to <Leader>;
nnoremap <Leader>; ,

set wildignore+=*.o,*.a,*.d,*.so,*.swp,*.jpg,*.png,*.svg,*.ttf,*.pdf,*.zip,*.tar.gz,*.bin
set wildignore+=*/CMakeFiles/*,*/build/*,*/googletest/*

" Basics
    filetype plugin on
    syntax on
    set nowrap
    set background=dark
    set showmode
    let c_no_curly_error=1
    set mouse=

    " Decrease message size - avoids the utterly annoying 
    " "Press ENTER or type command to continue" message
    set shortmess=a

    " Expands tabs to spaces
    set expandtab
    " 4 spaces for the \t character
    set tabstop=4
    " 4 spaces for <Tab> key
    set softtabstop=4
    " 4 spaces for >> key
    set shiftwidth=4
    set shiftround

    set number relativenumber

    " When opening new file, don't close the current buffer, just hide it
    set hidden

    " Set the height of vim command line
    set cmdheight=1

    " Always report changed lines (e.g. "1 line yanked")
    set report=0

    " Always show statusline
    set laststatus=2

    " Don't show Vim help message on start
    set shortmess=I

    " Don't jump at the line start when moving around
    set nostartofline

    " Soft wrapping of lines
    set wrap linebreak

    set splitright
    set cursorline

" Enable command completion
    set wildmenu
    "set wildmode=longest,list,full - "full" completes the whole word.
    " I only want partial completion like in bash, for example.
    set wildmode=longest,list

" Disable auto-comment on new line
    augroup autocomment
        autocmd!
        autocmd FileType * setlocal formatoptions-=cro
    augroup END

" Add <> brackets to the list of matching pairs
    set matchpairs+=<:>

" Don't display @ when a line doesn't fit on screen
    set display+=lastline

" Allow project specific settings via vimrc
    set exrc

" Set up indentation
    set autoindent
    set cindent

    " Don't indent public, protected and private specifiers
    set cinoptions+=g0

    " switch-case indentation
    set cinoptions+=:0
    set cinoptions+=l1
    set cinoptions+=b0

    " namespace indentation
    set cinoptions+=N-s

    " indentation of new line after unclosed (
    set cinoptions+=(1s,W1s " 1s means one 'shiftwidth' spaces

" Indent the current line when typing break (for cinoptions+=b1)
    "set cinkeys+=0=break

" Keep cursor 5 lines above/below when scrolling
    set scrolloff=5 " scroll lines above/below cursor
    set sidescrolloff=5

" Load other settings
    source $VIMHOME/settings/get_hl_color.vim
    source $VIMHOME/settings/ale.vim
    source $VIMHOME/settings/auto_quickfix_on_make.vim
    source $VIMHOME/settings/clipboard.vim
    source $VIMHOME/settings/buffer_workflow.vim
    source $VIMHOME/settings/buffer_line.vim
    source $VIMHOME/settings/smart_search.vim
    source $VIMHOME/settings/auto_paste.vim
    source $VIMHOME/settings/split_switch.vim
    source $VIMHOME/settings/cpp_enhanced_highlight.vim
    source $VIMHOME/settings/rainbow.vim
    source $VIMHOME/settings/tabspace.vim
    source $VIMHOME/settings/ctrl_p.vim
    source $VIMHOME/settings/preserve_line_pos.vim
    source $VIMHOME/settings/git.vim
    source $VIMHOME/settings/rust_fmt.vim
    let g:coc_config_home = '$VIMHOME/settings'


" Exclude quickfix from buffer list
    augroup qf
        autocmd!
        autocmd FileType qf set nobuflisted
    augroup END

" ESC in quickfix window closes quickfix
    augroup escclose
        autocmd FileType qf nnoremap <buffer><silent> <esc> :quit<cr>
        autocmd FileType help nnoremap <buffer><silent> <esc> :quit<cr>
        autocmd FileType preview nnoremap <buffer><silent> <esc> :quit<cr>
        autocmd FileType ale-preview nnoremap <buffer><silent> <esc> :quit<cr>
        autocmd FileType ale-preview.message nnoremap <buffer><silent> <esc> :quit<cr>
        autocmd FileType ale-preview-selection nnoremap <buffer><silent> <esc> :quit<cr>
    augroup END

" Set the number of suggestions in completion-menu
    set pumheight=10

" Allow moving in completion-menu using tab, arrows and C-j/C-k
    " inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

    " inoremap <expr> <down> pumvisible() ? "\<C-n>" : "\<down>"
    " inoremap <expr> <up> pumvisible() ? "\<C-p>" : "\<up>"

    " inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
    " inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

    inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
    inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

    inoremap <expr> <down> coc#pum#visible() ? coc#pum#next(1) : "\<down>"
    inoremap <expr> <up> coc#pum#visible() ? coc#pum#prev(1) : "\<up>"

    inoremap <expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
    inoremap <expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"

    inoremap <expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Toggle show whitespaces
    nmap <silent> <Leader>lw :set list!<CR>
    " Use the same symbols as TextMate for tabstops and EOLs
    set listchars=tab:▸\ ,eol:¬
    if has('multi_byte') && &encoding ==# 'utf-8'
        let &listchars = 'tab:▸ ,extends:❯,precedes:❮,space:•,nbsp:±,eol:¶'
    else
        let &listchars = 'tab:> ,extends:>,precedes:<,space:.,nbsp:.,eol:$'
    endif

" Some useful mappings
    " suda plugin
    if !exists(':W')
        command W w suda://%
    endif

    " NerdTree
    nmap <silent> <Leader>f :NERDTreeToggle<CR>
    let NERDTreeIgnore = ['\.o$', '\.a$']

    " w0rp/ale
    nmap <silent> <Leader>gd :ALEGoToDefinition<CR>
    nmap <silent> <Leader>i :ALEDetail<CR>
    nmap <silent> <Leader>r :ALEFindReferences<CR>
    nmap <silent> <Leader>w :ALEHover<CR>
    nmap <silent> <Leader>e :lopen<CR>

    " ClangFormat
    augroup codeformat
        autocmd!
        autocmd FileType c,cpp nnoremap <buffer> <silent> <Leader>cf :ClangFormat<CR>
        autocmd FileType rust nnoremap <buffer> <silent> <Leader>cf :Rustfmt<CR>
    augroup end
    " autocmd FileType javascript nnoremap <buffer> <C-]> :TernDef<CR>

    " Open the terminal with leader + Enter
    nnoremap <leader><CR> :terminal<CR>

    " Press ESC in terminal to exit the terminal mode
    tnoremap <Esc> <C-\><C-n>

    " Easier scrolling navigation and back/forward navigation
    noremap <C-j> <C-e>
    noremap <C-k> <C-y>
    noremap <C-h> <C-o>
    noremap <C-l> <C-i>

    " Reindent whole file
    nmap <Leader>ii gg=G

let g:wordmotion_spaces = [ '_' ]
let g:wordmotion_uppercase_spaces = ['-', '.', ',', '<', '>', '(', ')', '[', ']', '{', '}', '&', '*', '=', '!', '+', ';', ':', '"']

let g:calendar_google_calendar = 1
" let g:calendar_google_task = 1

" Start searching in project root instead of in CWD
let g:ag_working_path_mode='r'
" Disable default Ag mappings
let g:ag_apply_qmappings=0
" Use Ag! instead of Ag - disables opening of first result in a new bufer
ca Ag Ag!

set completeopt-=preview

let g:pathogen_blacklist = []
call add(g:pathogen_blacklist, 'calendar.vim')
execute pathogen#infect()
Helptags

if !isdirectory($VIMHOME.'/bundle/coc.nvim/build')
    call coc#util#install()
endif

colorscheme onedark

set secure

