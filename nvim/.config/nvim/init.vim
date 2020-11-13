" >>>>== general config ==>>>>
set number
" set cursorline
" set cursorcolumn
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" terminal mode map
tnoremap <Esc> <C-\><C-n>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
" normal mode map
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
" bracket auto complete
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
" <<<<== general config ==<<<<

" >>>>== vim-packager config ==>>>>
" Load packager only when you need it
function! PackagerInit() abort
    packadd vim-packager
    call packager#init({ 'dir': $XDG_DATA_HOME . "/nvim/site/pack/packager" })
    call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })
    call packager#add('neovim/nvim-lsp', { 'type': 'opt'})
    call packager#add('junegunn/fzf.vim')
    call packager#add('justinmk/vim-sneak')
    call packager#add('tpope/vim-surround')
    " vim-lsp
    call packager#add('prabirshrestha/vim-lsp')
    call packager#add('prabirshrestha/async.vim')
    call packager#add('prabirshrestha/asyncomplete.vim')
    call packager#add('prabirshrestha/asyncomplete-lsp.vim')
    " themes
    call packager#add('itchyny/lightline.vim')
    call packager#add('rakr/vim-one')
endfunction

command! PackagerInstall call PackagerInit() | call packager#install()
command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()
" <<<<== vim-packager config ==<<<<

" >>>>==vim-lsp config==>>>>
if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd', '-background-index']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'whitelist': ['rust'],
        \ })
endif
" key map
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
" <<<<== vim-lsp config ==<<<<

" >>>>== theme config ==>>>>
set noshowmode
set termguicolors " open 256-color support
" set lightline theme to one
" let g:lightline = {
"       \ 'colorscheme': 'one',
"       \ }

colorscheme one
"change to default background
" set background=light " for the light version

" unset background
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
" set background=dark " for the dark version
" <<<<== theme config ==<<<<

" 
" >>>>== nvim-lsp config ==>>>>
" packadd nvim-lsp
" lua << EOF
" require'nvim_lsp'.clangd.setup{}
" EOF

" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>

" Use LSP omni-completion in c files.
" autocmd FileType c setlocal omnifunc=v:lua.vim.lsp.omnifunc
" <<<<== nvim-lsp config ==<<<<
