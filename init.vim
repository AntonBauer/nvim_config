" Plugins section
call plug#begin()

Plug 'OmniSharp/omnisharp-vim'

call plug#end()

" OmniSharp configuration
let g:OmniSharp_server_use_net6 = 1
let g:OmniSharp_translate_cygwin_wsl = 1
