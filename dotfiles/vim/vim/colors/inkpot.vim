" Vim color file
" Name:           inkpot.vim
" Maintainer: Ciaran McCreesh <ciaran.mccreesh@blueyonder.co.uk>
" This should work in the GUI, rxvt-unicode (88 colour mode) and xterm (256
" colour mode). It won't work in 8/16 colour terminals.
"
" To use a black background, :let g:inkpot_black_background = 1

set background=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

let colors_name = "inkpot"

" map a urxvt cube number to an xterm-256 cube number
fun! <SID>M(a)
        return strpart("0135", a:a, 1) + 0
endfun

" map a urxvt colour to an xterm-256 colour
fun! <SID>X(a)
        if &t_Co == 88
            return a:a
        else
            if a:a == 8
                return 237
            elseif a:a < 16
                return a:a
            elseif a:a > 79
                return 232 + (3 * (a:a - 80))
            else
                let l:b = a:a - 16
                let l:x = l:b % 4
                let l:y = (l:b / 4) % 4
                let l:z = (l:b / 16)
                return 16 + <SID>M(l:x) + (6 * <SID>M(l:y)) + (36 * <SID>M(l:z))
            endif
        endif
endfun

if ! exists("g:inkpot_black_background")
    let g:inkpot_black_background = 0
endif

if has("gui_running")
        if ! g:inkpot_black_background
            hi Normal         ui=NONE   guifg=#cfbfad   guibg=#1e1e27
        else
            hi Normal         ui=NONE   guifg=#cfbfad   guibg=#000000
        endif

        hi IncSearch      ui=BOLD   guifg=#303030   guibg=#cd8b60
        hi Search         ui=NONE   guifg=#303030   guibg=#cd8b60
        hi ErrorMsg       ui=BOLD   guifg=#ffffff   guibg=#ce4e4e
        hi WarningMsg     ui=BOLD   guifg=#ffffff   guibg=#ce8e4e
        hi ModeMsg        ui=BOLD   guifg=#7e7eae   guibg=NONE
        hi MoreMsg        ui=BOLD   guifg=#7e7eae   guibg=NONE
        hi Question       ui=BOLD   guifg=#ffcd00   guibg=NONE

        hi StatusLine     ui=BOLD   guifg=#b9b9b9   guibg=#3e3e5e
        hi User1          ui=BOLD   guifg=#00ff8b   guibg=#3e3e5e
        hi User2          ui=BOLD   guifg=#7070a0   guibg=#3e3e5e
        hi StatusLineNC   gui=NONE   guifg=#b9b9b9   guibg=#3e3e5e
        hi VertSplit      ui=NONE   guifg=#b9b9b9   guibg=#3e3e5e

        hi WildMenu       ui=BOLD   guifg=#eeeeee   guibg=#6e6eaf

        hi MBENormal                 uifg=#cfbfad   guibg=#2e2e3f
        hi MBEChanged                uifg=#eeeeee   guibg=#2e2e3f
        hi MBEVisibleNormal          uifg=#cfcfcd   guibg=#4e4e8f
        hi MBEVisibleChanged         uifg=#eeeeee   guibg=#4e4e8f

        hi DiffText       ui=NONE   guifg=#ffffcd   guibg=#4a2a4a
        hi DiffChange     ui=NONE   guifg=#ffffcd   guibg=#306b8f
        hi DiffDelete     ui=NONE   guifg=#ffffcd   guibg=#6d3030
        hi DiffAdd        ui=NONE   guifg=#ffffcd   guibg=#306d30

        hi Cursor         ui=NONE   guifg=#404040   guibg=#8b8bff
        hi lCursor        ui=NONE   guifg=#404040   guibg=#8fff8b
        hi CursorIM       ui=NONE   guifg=#404040   guibg=#8b8bff

        hi Folded         ui=NONE   guifg=#cfcfcd   guibg=#4b208f
        hi FoldColumn     ui=NONE   guifg=#8b8bcd   guibg=#2e2e2e

        hi Directory      ui=NONE   guifg=#00ff8b   guibg=NONE
        hi LineNr         ui=NONE   guifg=#8b8bcd   guibg=#2e2e2e
"        hi NonText        ui=BOLD   guifg=#8b8bcd   guibg=NONE
        hi NonText        ui=BOLD   guifg=#3e3e3e   guibg=NONE
"ghi SpecialKey     ui=BOLD   guifg=#ab60ed   guibg=NONE
        hi SpecialKey     ui=BOLD   guifg=#3e3e3e   guibg=NONE
        hi Title          ui=BOLD   guifg=#af4f4b   guibg=NONE
        hi Visual         ui=NONE   guifg=#eeeeee   guibg=#4e4e8f

        hi Comment        ui=NONE   guifg=#cd8b00   guibg=NONE
        hi Constant       ui=NONE   guifg=#ffcd8b   guibg=NONE
        hi String         ui=NONE   guifg=#ffcd8b   guibg=#404040
        hi Error          ui=NONE   guifg=#ffffff   guibg=#6e2e2e
        hi Identifier     ui=NONE   guifg=#ff8bff   guibg=NONE
        hi Ignore         ui=NONE
        hi Number         ui=NONE   guifg=#f0ad6d   guibg=NONE
        hi PreProc        ui=NONE   guifg=#409090   guibg=NONE
        hi Special        ui=NONE   guifg=#c080d0   guibg=NONE
        hi SpecialChar    ui=NONE   guifg=#c080d0   guibg=#404040
        hi Statement      ui=NONE   guifg=#808bed   guibg=NONE
        hi Todo           ui=BOLD   guifg=#303030   guibg=#d0a060
        hi Type           ui=NONE   guifg=#ff8bff   guibg=NONE
        hi Underlined     ui=BOLD   guifg=#df9f2d   guibg=NONE
        hi TaglistTagName gui=BOLD   guifg=#808bed   guibg=NONE

        hi perlSpecialMatch   gui=NONE guifg=#c080d0   guibg=#404040
        hi perlSpecialString  gui=NONE guifg=#c080d0   guibg=#404040

        hi cSpecialCharacter  gui=NONE guifg=#c080d0   guibg=#404040
        hi cFormat            ui=NONE guifg=#c080d0   guibg=#404040

        hi doxygenBrief                 ui=NONE guifg=#fdab60   guibg=NONE
        hi doxygenParam                 ui=NONE guifg=#fdd090   guibg=NONE
        hi doxygenPrev                  ui=NONE guifg=#fdd090   guibg=NONE
        hi doxygenSmallSpecial          ui=NONE guifg=#fdd090   guibg=NONE
        hi doxygenSpecial               ui=NONE guifg=#fdd090   guibg=NONE
        hi doxygenComment               ui=NONE guifg=#ad7b20   guibg=NONE
        hi doxygenSpecial               ui=NONE guifg=#fdab60   guibg=NONE
        hi doxygenSpecialMultilineDesc  gui=NONE guifg=#ad600b   guibg=NONE
        hi doxygenSpecialOnelineDesc    ui=NONE guifg=#ad600b   guibg=NONE

        if v:version >= 700
            hi Pmenu          ui=NONE   guifg=#eeeeee   guibg=#4e4e8f
            hi PmenuSel       ui=BOLD   guifg=#eeeeee   guibg=#2e2e3f
            hi PmenuSbar      ui=BOLD   guifg=#eeeeee   guibg=#6e6eaf
            hi PmenuThumb     ui=BOLD   guifg=#eeeeee   guibg=#6e6eaf

            hi SpellBad     ui=undercurl guisp=#cc6666
            hi SpellRare    ui=undercurl guisp=#cc66cc
            hi SpellLocal   gui=undercurl guisp=#cccc66
            hi SpellCap     ui=undercurl guisp=#66cccc

            hi MatchParen   gui=NONE      uifg=#404040   guibg=#8fff8b
        endif
else
        if ! g:inkpot_black_background
            exec "hi Normal         cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . "NONE"
        else
            exec "hi Normal         cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(16)
        endif

        exec "hi IncSearch      cterm=BOLD   ctermfg=" . <SID>X(80) . " ctermbg=" . <SID>X(73)
        exec "hi Search         cterm=NONE   ctermfg=" . <SID>X(80) . " ctermbg=" . <SID>X(73)
        exec "hi ErrorMsg       cterm=BOLD   ctermfg=" . <SID>X(16) . " ctermbg=" . <SID>X(48)
        exec "hi WarningMsg     cterm=BOLD   ctermfg=" . <SID>X(16) . " ctermbg=" . <SID>X(68)
        exec "hi ModeMsg        cterm=BOLD   ctermfg=" . <SID>X(38) . " ctermbg=" . "NONE"
        exec "hi MoreMsg        cterm=BOLD   ctermfg=" . <SID>X(38) . " ctermbg=" . "NONE"
        exec "hi Question       cterm=BOLD   ctermfg=" . <SID>X(52) . " ctermbg=" . "NONE"

        exec "hi StatusLine     cterm=BOLD   ctermfg=" . <SID>X(85) . " ctermbg=" . <SID>X(81)
        exec "hi User1          cterm=BOLD   ctermfg=" . <SID>X(28) . " ctermbg=" . <SID>X(81)
        exec "hi User2          cterm=BOLD   ctermfg=" . <SID>X(39) . " ctermbg=" . <SID>X(81)
        exec "hi StatusLineNC   cterm=NONE   ctermfg=" . <SID>X(84) . " ctermbg=" . <SID>X(81)
        exec "hi VertSplit      cterm=NONE   ctermfg=" . <SID>X(84) . " ctermbg=" . <SID>X(81)

        exec "hi WildMenu       cterm=BOLD   ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(38)

        exec "hi MBENormal                   ctermfg=" . <SID>X(85) . " ctermbg=" . <SID>X(81)
        exec "hi MBEChanged                  ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(81)
        exec "hi MBEVisibleNormal            ctermfg=" . <SID>X(85) . " ctermbg=" . <SID>X(82)
        exec "hi MBEVisibleChanged           ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(82)

        exec "hi DiffText       cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(34)
        exec "hi DiffChange     cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(17)
        exec "hi DiffDelete     cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(32)
        exec "hi DiffAdd        cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(20)

        exec "hi Folded         cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(35)
        exec "hi FoldColumn     cterm=NONE   ctermfg=" . <SID>X(39) . " ctermbg=" . <SID>X(80)

        exec "hi Directory      cterm=NONE   ctermfg=" . <SID>X(28) . " ctermbg=" . "NONE"
        exec "hi LineNr         cterm=NONE   ctermfg=" . <SID>X(39) . " ctermbg=" . <SID>X(80)
"        exec "hi NonText        cterm=BOLD   ctermfg=" . <SID>X(39) . " ctermbg=" . "NONE"
"        exec "hi SpecialKey     cterm=BOLD   ctermfg=" . <SID>X(55) . " ctermbg=" . "NONE"
        exec "hi NonText        cterm=BOLD   ctermfg=" . <SID>X(81) . " ctermbg=" . "NONE"
        exec "hi SpecialKey     cterm=BOLD   ctermfg=" . <SID>X(81) . " ctermbg=" . "NONE"
        exec "hi Title          cterm=BOLD   ctermfg=" . <SID>X(48) . " ctermbg=" . "NONE"
        exec "hi Visual         cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(38)

        exec "hi Comment        cterm=NONE   ctermfg=" . <SID>X(52) . " ctermbg=" . "NONE"
        exec "hi Constant       cterm=NONE   ctermfg=" . <SID>X(73) . " ctermbg=" . "NONE"
        exec "hi String         cterm=NONE   ctermfg=" . <SID>X(73) . " ctermbg=" . "NONE"
        exec "hi Error          cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(32)
        exec "hi Identifier     cterm=NONE   ctermfg=" . <SID>X(53) . " ctermbg=" . "NONE"
        exec "hi Ignore         cterm=NONE"
        exec "hi Number         cterm=NONE   ctermfg=" . <SID>X(69) . " ctermbg=" . "NONE"
        exec "hi PreProc        cterm=NONE   ctermfg=" . <SID>X(25) . " ctermbg=" . "NONE"
        exec "hi Special        cterm=NONE   ctermfg=" . <SID>X(55) . " ctermbg=" . "NONE"
        exec "hi SpecialChar    cterm=NONE   ctermfg=" . <SID>X(55) . " ctermbg=" . <SID>X(81)
        exec "hi Statement      cterm=NONE   ctermfg=" . <SID>X(27) . " ctermbg=" . "NONE"
        exec "hi Todo           cterm=BOLD   ctermfg=" . <SID>X(16) . " ctermbg=" . <SID>X(57)
        exec "hi Type           cterm=NONE   ctermfg=" . <SID>X(71) . " ctermbg=" . "NONE"
        exec "hi Underlined     cterm=BOLD   ctermfg=" . <SID>X(77) . " ctermbg=" . "NONE"
        exec "hi TaglistTagName cterm=BOLD   ctermfg=" . <SID>X(39) . " ctermbg=" . "NONE"

        if v:version >= 700
            exec "hi Pmenu          cterm=NONE   ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(82)
            exec "hi PmenuSel       cterm=BOLD   ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(38)
            exec "hi PmenuSbar      cterm=BOLD   ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(39)
            exec "hi PmenuThumb     cterm=BOLD   ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(39)

            exec "hi SpellBad       cterm=NONE ctermbg=" . <SID>X(32)
            exec "hi SpellRare      cterm=NONE ctermbg=" . <SID>X(33)
            exec "hi SpellLocal     cterm=NONE ctermbg=" . <SID>X(36)
            exec "hi SpellCap       cterm=NONE ctermbg=" . <SID>X(21)
            exec "hi MatchParen     cterm=NONE ctermbg=" . <SID>X(14) . "ctermfg=" . <SID>X(25)
        endif
endif
