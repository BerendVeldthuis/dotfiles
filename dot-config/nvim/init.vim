" Plugin load
call plug#begin()

" List your plugins here
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

colorscheme gruvbox
set colorcolumn=81  "Change colum 80 as length marker
set relativenumber
set tabstop=4 shiftwidth=4 expandtab    "Enshure tabs are 4 spaces deep.
set nowrap
