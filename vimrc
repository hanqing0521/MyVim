""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            common configrations                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fileencodings=utf-8,gb18030,utf-16,latin1
set hlsearch
set cursorcolumn
set cursorline
set cursorlineopt=both
set colorcolumn=+1
set wildmenu
set number
set shiftwidth=4
set textwidth=78
set softtabstop=4
set expandtab
set t_Co=256
set encoding=utf-8
let g:maplocalleader=" "
let g:mapleader=','
let g:tex_conceal='abmgd'
"set conceallevel=1
set background=light
imap jk <ESC>
imap <C-l> <ESC>2li
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <localleader>w :w<CR>
nnoremap <localleader>\ :vs 
nnoremap <localleader>- :sp 
nnoremap <localleader>du :diffupdate<CR>
au WinLeave * set nocursorline nocursorcolumn colorcolumn=""
au WinEnter * set cursorline cursorcolumn colorcolumn=+1

if $TERM=="xterm-256color"
    set termguicolors
    if empty(v:servername) && exists('*remote_startserver')
      call remote_startserver('VIM')
    endif
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    end                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""
"  set for boxes comment by boxes  "
""""""""""""""""""""""""""""""""""""
autocmd BufEnter * nmap ,mms !!boxes -d stone<CR>
autocmd BufEnter * vmap ,mms !boxes -d stone<CR>
autocmd BufEnter * nmap ,xms !!boxes -d stone -r<CR>
autocmd BufEnter * vmap ,xms !boxes -d stone -r<CR>

autocmd BufEnter * nmap ,mmm !!boxes -d mouse<CR>
autocmd BufEnter * vmap ,mmm !boxes -d mouse<CR>
autocmd BufEnter * nmap ,xmm !!boxes -d mouse -r<CR>
autocmd BufEnter * vmap ,xmm !boxes -d mouse -r<CR>

autocmd BufEnter * nmap ,mc !!boxes -d shell<CR>
autocmd BufEnter * vmap ,mc !boxes -d shell<CR>
autocmd BufEnter * nmap ,xc !!boxes -d shell -r<CR>
autocmd BufEnter * vmap ,xc !boxes -d shell -r<CR>
autocmd BufEnter *.html nmap ,mc !!boxes -d html<CR>
autocmd BufEnter *.html vmap ,mc !boxes -d html<CR>
autocmd BufEnter *.html nmap ,xc !!boxes -d html -r<CR>
autocmd BufEnter *.html vmap ,xc !boxes -d html -r<CR>
autocmd BufEnter *.[chly],*.[pc]c nmap ,mc !!boxes -d c-cmt<CR>
autocmd BufEnter *.[chly],*.[pc]c vmap ,mc !boxes -d c-cmt<CR>
autocmd BufEnter *.[chly],*.[pc]c nmap ,xc !!boxes -d c-cmt -r<CR>
autocmd BufEnter *.[chly],*.[pc]c vmap ,xc !boxes -d c-cmt -r<CR>
autocmd BufEnter *.C,*.cpp,*.java nmap ,mc !!boxes -d java-cmt<CR>
autocmd BufEnter *.C,*.cpp,*.java vmap ,mc !boxes -d java-cmt<CR>
autocmd BufEnter *.C,*.cpp,*.java nmap ,xc !!boxes -d java-cmt -r<CR>
autocmd BufEnter *.C,*.cpp,*.java vmap ,xc !boxes -d java-cmt -r<CR>
autocmd BufEnter .vimrc*,.exrc nmap ,mc !!boxes -d vim-boxes<CR>
autocmd BufEnter .vimrc*,.exrc vmap ,mc !boxes -d vim-boxes<CR>
autocmd BufEnter .vimrc*,.exrc nmap ,xc !!boxes -d vim-boxes -r<CR>
autocmd BufEnter .vimrc*,.exrc vmap ,xc !boxes -d vim-boxes -r<CR>
autocmd BufEnter *.f,*.f90,*.f95 nmap ,mb !!boxes -s 80 -d f90-box -m<CR>
autocmd BufEnter *.f,*.f90,*.f95 vmap ,mb !boxes -s 80 -d f90-box -m<CR>
autocmd BufEnter *.f,*.f90,*.f95 nmap ,xb !!boxes  -d f90-box -r<CR>
autocmd BufEnter *.f,*.f90,*.f95 vmap ,xb !boxes -d f90-box -r<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    end                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""





" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/morhetz/gruvbox'

" Any valid git URL is allowed

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              coc setup begin                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
""xmap <leader>f  <Plug>(coc-format-selected)
""nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" find files.
nnoremap <silent><nowait> <space>f :<C-u>CocList folders<cr>

nmap <leader>rf <Plug>(coc-refactor)


if has('nvim-0.4.0') || has('patch-8.2.0750')
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               coc setup end                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-----------------------------------------------------------------------------

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   begin ultisnipts and vim-snippets: will be used by coc-snippets     “
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsListSnippets="<c-tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              end vim-snippets                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                begin vimtex                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'lervag/vimtex'

    let g:vimtex_compiler_latexrun_engines = {
        \ '_'                : 'pdflatex',
        \ 'pdflatex'         : 'pdflatex',
        \ 'lualatex'         : 'lualatex',
        \ 'xelatex'          : 'xelatex',
        \}
    let g:vimtex_compiler_latexmk = {
        \ 'build_dir' : '',
        \ 'callback' : 1,
        \ 'continuous' : 1,
        \ 'executable' : 'latexmk',
        \ 'hooks' : [],
        \ 'options' : [
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
    let g:vimtex_view_method='zathura'
    "let g:vimtex_view_zathura_options= ' -forward-search @tex @line @pdf'
    let g:vimtex_quickfix_ignore_filters=['Marginpar on page',
		\ 'Package']
    let g:tex_flavor = 'latex'
    let g:vimtex_grammar_textidote = {
	    \ 'jar': '/home/lixun/.local/bin/textidote.jar',
	    \ 'args': '',
	    \}
" force set cls tex file map recover vimtex map K for VimtexDocPackage
autocmd BufEnter *.cls,*.tex nmap K :VimtexDocPackage<cr>
let g:vimtex_syntax_enabled=0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 end vimtex                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   themes setting                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

let g:airline_left_sep = "\ue0bc"
let g:airline_left_alt_sep = "\ue0bd"
let g:airline_right_sep = "\ue0ba"
let g:airline_right_alt_sep = "\ue0bb"
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'


let g:airline#extensions#tabline#left_sep = "\ue0b8"
"let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = "\ue0be"
"let g:airline#extensions#tabline#right_alt_sep = ''

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#alt_sep = 1
let g:airline_detect_iminsert=1
"Plug 'flazz/vim-colorschemes'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'https://github.com/rakr/vim-one'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   begin fcitx                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-scripts/fcitx.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   end fcitx                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 begin  easymotion                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'easymotion/vim-easymotion'
" Add Chinese surport
Plug 'ZSaberLv0/vim-easymotion-chs' 

let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 "keep cursor colum when JK motion"
map <localleader><localleader>h <Plug>(easymotion-linebackward)
map <localleader><localleader>j <Plug>(easymotion-j)
map <localleader><localleader>k <Plug>(easymotion-k)
map <localleader><localleader>l <Plug>(easymotion-lineforward)
map <localleader><localleader>s <Plug>(easymotion-s2)
map <localleader><localleader>t <Plug>(easymotion-t2)

map <lead><leader>. <Plug>(easymotion-repead)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                    end  easymotion                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     begin whichkey                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'liuchengxu/vim-which-key'
" Plug 'liuchengxu/vim-which-key', {'on': ['WhichKey', 'WhichKey!']}

let g:which_key_leader_map = {}
let g:which_key_leader_map.f={'name': "LeaderF"}
let g:which_key_leader_map.c={'name': "NerdComment"}

let g:which_key_localleader_map = {}
let g:which_key_localleader_map[' ']={'name': "EasyMotion"}
let g:which_key_localleader_map['l']={'name': "Vimtex"}

let g:which_key_leader_map['w'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ '=' : ['<C-W>='     , 'balance-window']        
      \ }
augroup which_key_group
    autocmd!
    autocmd FileType tex,cls let g:which_key_localleader_map.l={'name': "Vimtex"}
    autocmd FileType python,python3,python2,py,py2,py3 let g:which_key_localleader_map.J={'name': "Jupyter"}
    autocmd VimEnter * call which_key#register('<space>', "g:which_key_localleader_map")
    autocmd VimEnter  * call which_key#register(',', "g:which_key_leader_map")
augroup END

nnoremap <silent><leader> :<C-U>WhichKey ','<CR>
nnoremap <silent><localleader> :<C-U>WhichKey '<space>'<CR>

vnoremap <silent><leader> :<C-U>WhichKeyVisual ','<CR>
vnoremap <silent><localleader> :<C-U>WhichKeyVisual '<space>'<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           end whichkey                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          begin choose win                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 't9md/vim-choosewin'
let g:choosewin_color_label = {
    \ 'gui': ['firebrick1', 'White','bold'],
    \ 'cterm': [1, 16,10]
    \ }
let g:choosewin_color_other = { 'gui': ['#5B9C90'] }
let g:choosewin_color_label_current = g:choosewin_color_label
"let g:choosewin_overlay_enable=0
nmap - <Plug>(choosewin)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     end choose win                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     begin undotree                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'mbbill/Undotree'
if has('persistent_undo')
	set undodir=~/.undodir/
	set undofile
endif
nnoremap <localleader>U :UndotreeToggle<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       end undotree                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             begin vim-surround                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-surround'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              end vim-surround                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""
"  begin vim-boxdraw  "
"""""""""""""""""""""""
Plug 'gyim/vim-boxdraw' 
"""""""""""""""""
"  end boxdraw  "
"""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              begin table-mode                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'dhruvasagar/vim-table-mode'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               end table-mode                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              begin indentline                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'Yggdroot/indentLine'                                                   
"indentLine will change the concealcursor: inc
let g:indentLine_setConceal=0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" indentLine will overwrite conceal color
let g:indentLine_setColors=0 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               end indentline                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               begin leaderF                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap <leader>frg :<C-U>Leaderf! rg 

"noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
"noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>



let g:Lf_StlSeparator = { 'left': "\ue0bc", 'right': "\ue0ba", 'font': '' }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                end leaderF                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            begin vim-gutentags                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'ludovicchabant/vim-gutentags'
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               end gutentags                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             begin jupyter-vim                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'jupyter-vim/jupyter-vim'
let g:jupyter_mapkeys=0
au FileType python,py,python3,py3,python2,py2 call JupyterMap()
function! JupyterMap()
    nnoremap <buffer> <silent> <localleader>JR    :JupyterRunFile<CR>

    " Change to directory of current file
    nnoremap <buffer> <silent> <localleader>Jd    :JupyterCd %:p:h<CR>

    " Send just the current line
    nnoremap <buffer> <silent> <localleader>JX    :JupyterSendCell<CR>
    nnoremap <buffer> <silent> <localleader>JE    :JupyterSendRange<CR>

    " Send the text to jupyter kernel
    nmap <buffer> <silent> <localleader>Je        <Plug>JupyterRunTextObj
    vmap <buffer> <silent> <localleader>Je        <Plug>JupyterRunVisual

    nnoremap <buffer> <silent> <localleader>JU    :JupyterUpdateShell<CR>

    nnoremap <buffer><silent><localleader>Jc	  :JupyterConnect<CR>
    nnoremap <buffer><silent><localleader>JUP	  :silent !jupyter-qtconsole&<CR>
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              end jupyter-vim                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               begin nerdtree                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'preservim/nerdtree'
map <localleader>E :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                end nerdtree                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            begin nerdcommenter                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'preservim/nerdcommenter'

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             end nerdcommenter                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             begin vim-rainbow                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'frazrepo/vim-rainbow'
let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

"let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
"let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              end vim-rainbow                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        begin fencview for encoding                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vimchina/vim-fencview'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  end fen                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              begin hexokinase                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For visualize the rgb color
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
let g:Hexokinase_highlighters=['backgroundfull']
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  end hex                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        for nerd fonts vim-devicons                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'ryanoasis/vim-devicons'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                end devicons                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"##############################################################################
"#                           begin markdown preview                           #
"##############################################################################

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'}

" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

"##############################################################################
"#                            end markdown preview                            #
"##############################################################################


" Initialize plugin system
call plug#end()

"colorscheme space-vim-dark
colorscheme OceanicNext
"set background=light

