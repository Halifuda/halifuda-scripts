vim9script

# Plugins will be downloaded under the specified directory.
plug#begin("$HOME\\vimfiles")

# Declare the list of plugins.
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'prabirshrestha/vim-lsp'
Plug 'arcticicestuidio/nord-vim'

# List ends here. Plugins become visible to Vim after this call.
plug#end()

if has("syntax")
	syntax on
endif

set nocompatible
set nu
# allow backspace
set backspace=2
# indent
set tabstop=4
set shiftwidth=4
set expandtab
set ruler
set autoindent
# mouse support
set mouse=a
# highlight cursor
set cursorline
# switchbuf of quickfix window
set switchbuf+=usetab,newtab

# terminal
noremap <silent> <C-t> :tab term<CR>
noremap <silent> tt :tabprevious<CR>
noremap <silent> TT :tabnext<CR>
# switch to NORMAL mode in terminal
tnoremap <C-Q> <C-\><C-n>

# NERDTree
noremap <silent> <C-n> :tab NERDTreeToggle<CR>

au Filetype FILETYPE let b: AutoPairs = {"(" : ")"}

# One theme
if (empty($TMUX))
	if (has("termguicolors"))
		set termguicolors
	endif
endif

set background=dark
g:nord_italic = 1
g:nord_bold = 1
g:nord_underline = 1
g:nord_italic_comments = 1
colorscheme nord
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guifg=darkyellow ctermfg=darkyellow
hi Comment guifg=darkgray ctermfg=darkgray

# vim-lsp
g:lsp_log_file = expand('$HOME\\vimfiles\\.vim-lsp-log')
g:lsp_diagnostics_echo_cursor = 1
g:lsp_diagnostics_echo_delay = 100
g:lsp_diagnostics_float_cursor = 1
g:lsp_diagnostics_float_delay = 1000
g:lsp_diagnostics_virtual_text_enabled = 0
g:lsp_inlay_hints_enabled = 1

nmap <silent> gr <Plug>(lsp-references)
nmap <silent> gs <Plug>(lsp-workspace-symbol-search)

nmap <silent> pd :LspPeekDefinition<CR>
nmap <silent> gd :tab LspDefinition<CR>
nmap <silent> pi :LspPeekImplementation<CR>
nmap <silent> gi :tab LspImplementation<CR>
nmap <silent> pt :LspPeekTypeDefinition<CR>
nmap <silent> gt :tab LspTypeDefinition<CR>

nmap <silent> H <Plug>(lsp-hover)
nnoremap <silent> <expr><C-j> lsp#scroll(+4)
nnoremap <silent> <expr><C-k> lsp#scroll(-4)

nmap <silent> [ <Plug>(lsp-previous-diagnostic)
nmap <silent> ] <Plug>(lsp-next-diagnostic)

lsp#register_server({
            \ 'name': 'rust-analyzer',
            \ 'cmd': ['rust-analyzer'],
            \ 'allowlist': ['rust']
           \ })
lsp#register_server({
            \ 'name': 'clangd',
            \ 'cmd': ['clangd'],
            \ 'allowlist': ['C', 'c', 'cc', 'cpp']
           \ })
lsp#register_server({
            \ 'name': 'pylsp',
            \ 'cmd': ['pylsp'],
            \ 'allowlist': ['python']
           \ })

