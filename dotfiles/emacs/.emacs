;; Emacs color themes
;;(require 'color-theme)
;;(color-theme-initialize)
;;(color-theme-robin-hood)
;;(color-theme-classic)
;;(color-theme-gnome)
;;(color-theme-gnome2)
;;(color-theme-solarized-dark)

;; So the idea is that you copy/paste this code into your *scratch* buffer,
;; hit C-j, and you have a working developper edition of el-get.
;;(url-retrieve
;; "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
;; (lambda (s)
;;   (let (el-get-master-branch)
;;     (goto-char (point-max))
;;     (eval-print-last-sexp))))

;; No blinking cursor!
(blink-cursor-mode 0)

;; Set tab width to 4
(setq tab-width 4)

;; No backup files, annoying
(setq make-backup-files nil)

;; Turn on column numbering in status line
(column-number-mode t)

;; Show line numbers in the left side of the buffer. Toggle the
;; display of line numbers with: M-x linum-mode
;;(require 'linum)
;;(global-linum-mode 1)

;; Set up a different background and foreground colour for line
;; numbering (custom-set-faces '(linum ((t (:inherit (shadow default)
;;:background "grey23" :foreground "white")))))

;; Insert a space between the line number
;; and the text buffer in console (no X).
(setq linum-format "%d ")

;; Disable the menu-bar
(menu-bar-mode -1)

;; Disable the scrollbar
(scroll-bar-mode -1)

;; Disable the toolbar
(tool-bar-mode -1)

;; Use the whitespace mode
;; make whitespace-mode use “↓” for newline and “→” for tab.
;; together with the rest of its defaults
;(require 'whitespace)

(autoload 'whitespace-mode "whitespace" "Toggle whitespace visualization." t)
(setq whitespace-display-mappings
 '(
   (space-mark 32 [183] [46]) ; normal space, ·
   (space-mark 160 [164] [95])
   (space-mark 2208 [2212] [95])
   (space-mark 2336 [2340] [95])
   (space-mark 3616 [3620] [95])
   (space-mark 3872 [3876] [95])
   (newline-mark 10 [8595 10]) ; newlne, ↓
   (tab-mark 9 [8594 9] [92 9]) ; tab, →
))

;; ido mode (interactive mode)
(require 'ido)
(ido-mode t)

;; Package management emacs
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))
(el-get 'sync)

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; autopair mode
(require 'autopair)
(autopair-global-mode) ;; to enable in all buffers

;; jedi (python mode)
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:ac-setup)

;; Auto-complete mode
(add-to-list 'load-path "/usr/share/emacs/site-lisp/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/usr/share/emacs/site-lisp/auto-complete/ac-dict")
(ac-config-default)

;; Haskell mode
(load "/usr/share/emacs/site-lisp/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(setq haskell-font-lock-symbols t) ;; to get unicode symbols for lambda etc.

;; Php mode
(autoload 'php-mode "php-mode.el" "Php mode." t)
(setq auto-mode-alist (append '(("/*.\.php[345]?$" . php-mode)) auto-mode-alist))

;; SML mode
(require 'sml-mode)

;; Lua mode
(setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

;; Python stuff
(autoload 'python-mode "python-mode.el" "Python mode." t)
(setq auto-mode-alist (append '(("/*.\.py$" . python-mode)) auto-mode-alist))

;; auctex package
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

;; Org-Mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(put 'downcase-region 'disabled nil)

;; Set column size to 80
(setq fill-column 80)
(setq text-mode-hook 'turn-on-auto-fill)
(setq default-major-mode 'text-mode)