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
    colorscheme monokai
    set showmode

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

" When wrapping is allowed, move the cursor between display lines
" rather than physical lines
    noremap <silent> k gk
    noremap <silent> j gj
    noremap <silent> 0 g0
    noremap <silent> $ g$

" Load other settings
    source $VIMHOME/settings/get_hl_color.vim
    source $VIMHOME/settings/ale.vim
    source $VIMHOME/settings/bookmarks.vim
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

" Exclude quickfix from buffer list
    augroup qf
        autocmd!
        autocmd FileType qf set nobuflisted
    augroup END

" Set the number of suggestions in completion-menu
    set pumheight=10

" Allow moving in completion-menu using tab, arrows and C-j/C-k
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

    inoremap <expr> <down> pumvisible() ? "\<C-n>" : "\<down>"
    inoremap <expr> <up> pumvisible() ? "\<C-p>" : "\<up>"

    inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
    inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

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
    map Q <c-w>z
    nmap q: <nop>

    " Convert camelCase to snake_case
    nmap <silent> <Leader>cc :s#\C\(\<\u[a-z0-9]\+\|[a-z0-9]\+\)\(\u\)#\l\1_\l\2#g<CR>

    " Close all buffers
    if !exists(':Q')
        command Q qa
    endif

    " suda plugin
    if !exists(':W')
        command W w suda://%
    endif

    " NerdTree
    nmap <silent> <Leader>e :NERDTreeToggle<CR>
    let NERDTreeIgnore = ['\.o$', '\.a$']

    " w0rp/ale
    nmap <silent> <Leader>gd :ALEGoToDefinition<CR>
    nmap <silent> <Leader>i :ALEDetail<CR>
    nmap <silent> <Leader>fr :ALEFindReferences<CR>
    nmap <silent> <Leader>w :ALEHover<CR>

    " ClangFormat
    map <silent> <Leader>cf :ClangFormat<CR>

    " Open the terminal with leader + Enter
    nnoremap <leader><CR> :terminal<CR>

    " Press ESC in terminal to exit the terminal mode
    tnoremap <Esc> <C-\><C-n>

    " Easier scrolling navigation and back/forward navigation
    noremap <C-j> <C-e>
    noremap <C-k> <C-y>
    noremap <C-h> <C-o>
    noremap <C-l> <C-i>

    " Scrolling in insert mode using Ctrl-j and Ctrl-k - trying to get used to
    " not using this
    " inoremap <silent> <C-j> <C-x><C-e><Esc>a
    " inoremap <silent> <C-k> <C-x><C-y><Esc>a

    " Reindent whole file
    nmap <Leader>ii gg=G

    " Enlarge the quickfix window
    nmap <silent> <Leader>q :40copen<CR>

    " Toggle between *.cc and *.h files
    "nnoremap <Backspace> :e %:p:s,.h$,.X123X,:s,.cc$,.h,:s,.X123X$,.cc,<CR>
    nnoremap <Backspace> :A<CR>

" remember opened buffers in viminfo
" exec 'set viminfo=%,' . &viminfo

let g:wordmotion_spaces = [ '_' ]
let g:wordmotion_uppercase_spaces = ['-', '.', ',', '<', '>', '(', ')', '[', ']', '{', '}', '&', '*', '=', '!', '+', ';', ':', '"']

let g:calendar_google_calendar = 1
" let g:calendar_google_task = 1

" Start searching in project root instead of in CWD
let g:ag_working_path_mode='r'

let g:deoplete#enable_at_startup = 1
set completeopt-=preview

let g:pathogen_blacklist = []
" call add(g:pathogen_blacklist, 'directoryNameInBundleDir')
"call add(g:pathogen_blacklist, 'deoplete.nvim')
execute pathogen#infect()
Helptags

call deoplete#custom#source('ale', 'rank', 999)
call deoplete#custom#option('auto_complete_delay', 50)

set secure

