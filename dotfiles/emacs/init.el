;;; AAA --- My .emacs

;;; Commentary:
;; Below should come in handy in the future.

;; So the idea is that you copy/paste this code into your *scratch* buffer,
;; hit C-j, and you have a working developper edition of el-get.
;;(url-retrieve
;; "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
;; (lambda (s)
;;   (let (el-get-master-branch)
;;     (goto-char (point-max))
;;     (eval-print-last-sexp))))

;;; Code:

;; ================================== Functions
(require 'cl)

(defun my-packages-installed-p ()
  "Helper to install any missing packages."
  (loop for p in my-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(defun recentf-ido-find-file ()
  "Find a recent file using Ido."
  (interactive)
  (let* ((file-assoc-list
	  (mapcar (lambda (x)
		    (cons (file-name-nondirectory x)
			  x))
		  recentf-list))
	 (filename-list
	  (remove-duplicates (mapcar #'car file-assoc-list)
			     :test #'string=))
	 (filename (ido-completing-read "Choose recent file: "
					filename-list
					nil
					t)))
    (when filename
      (find-file (cdr (assoc filename
			     file-assoc-list))))))

(defun edit-as-root ()
    "Edit the file that is associated with the current buffer as root."
    (interactive)
    (if (buffer-file-name)
        (progn
        (setq file (concat "/sudo::" (buffer-file-name)))
        (find-file file))
    (message "Current buffer does not have an associated file.")))

(defun reload-dotemacs-file ()
    "Reload your.emacs file without restarting Emacs."
    (interactive)
    (load-file "~/.emacs.d/init.el") )

;; ================================== Packages
(require 'package)

;; Repos
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                                         ("marmalade" . "http://marmalade-repo.org/packages/")
					 ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;; Package list
(defvar my-packages
  '(
    auctex
    auctex-latexmk
    autopair
    flx-ido
    flycheck
    ido-ubiquitous
    jedi
    org
    python-mode
    smart-mode-line
    web-mode
    zenburn-theme
    )
  "A list of packages to ensure are installed at launch.")

(unless (my-packages-installed-p)
  ;; check for new packages (package versions)
  (package-refresh-contents)
  ;; install the missing packages
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;; ================================== Font and misc visual settings
;; AquaMacs specific/Mac specific
;;(one-buffer-one-frame-mode 0)
;;(setq-default cursor-type 'box)
;;(set-face-background 'cursor "black")
;; (set-frame-font "-apple-dejavu sans mono-medium-r-normal--0-0-0-0-m-0-mac-roman")
;; (set-default-font "-apple-bitstream vera sans mono-medium-r-normal--15-120-72-72-m-120-iso10646-1")
;; (setq ns-right-alternate-modifier nil)

;; Colour theme
(load-theme 'zenburn t)

;; Font settings
(set-frame-font "-apple-dejavu sans mono-medium-r-normal--0-0-0-0-m-0-mac-roman")
(add-to-list 'default-frame-alist '(font . "-apple-dejavu sans mono-medium-r-normal--0-0-0-0-m-0-mac-roman"))

;; Don't show the startup screen
(setq inhibit-startup-screen t)

;; No blinking cursor!
(blink-cursor-mode 0)

;; Set tab width to 4
(setq-default indent-tabs-mode nil)
(setq tab-width 4)

;; No backup files, annoying
(setq make-backup-files nil)

;; Should I start using backups... (from jsfr)
;; store all backup and autosave files in the tmp dir
;; (setq
;;  backup-by-copying t      ; don't clobber symlinks
;;    backup-directory-alist
;;    '(("." . "~/.saves"))    ; don't litter my fs tree
;;    delete-old-versions t
;;    kept-new-versions 6
;;    kept-old-versions 2
;;    version-control t)       ; use versioned backups
;; (setq backup-directory-alist
;;       `((".*" . ,"/home/jens/.emacs.d/backups")))
;; (setq auto-save-file-name-transforms
;;       `((".*" ,"/home/jens/.emacs.d/autosaves" t)))

;; Turn on column numbering in status line
(column-number-mode t)

;; Disable the menu-bar
(menu-bar-mode -1)

;; Disable the scrollbar
(scroll-bar-mode -1)

;; Disable the toolbar
(tool-bar-mode -1)

; Don't use gtk dialogs, but use the minibuffer instead
(setq use-dialog-box nil)

;; Highlight current line
(global-hl-line-mode 1)

;; Set column size to 80
(setq major-mode 'text-mode)
(setq-default fill-column 80)
(setq text-mode-hook 'turn-on-auto-fill)

;; Show line numbers in the left side of the buffer.
(require 'linum)
(global-linum-mode 1)

;; ================================== Settings

;; Allow 'y' and 'p' instead of 'yes' and 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

;; Require final newlines in files when they are saved
(setq require-final-newline t)

;; Highlight lines longer than 80 chars
(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)

;; Set column size to 80 (before line breaking)
(setq major-mode 'text-mode)
(setq-default fill-column 80)
(setq text-mode-hook 'turn-on-auto-fill)

;; Delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Save cursor position in files
;; (setq save-place-file "~/.emacs.d/saveplace")
;; (setq-default save-place t)
;; (require 'saveplace)

;; Smooth scrolling
(setq scroll-margin 5
scroll-conservatively 9999
scroll-step 1)

;; Use the whitespace mode
;; make whitespace-mode use “↓” for newline and “→” for tab.
;; together with the rest of its defaults
;(require 'whitespace)

;; autoload 'whitespace-mode "whitespace" "Toggle whitespace visualization." t)
;; setq whitespace-display-mappings
;; '(
;;   (space-mark 32 [183] [46]) ; normal space, ·
;;   (space-mark 160 [164] [95])
;;   (space-mark 2208 [2212] [95])
;;   (space-mark 2336 [2340] [95])
;;   (space-mark 3616 [3620] [95])
;;   (space-mark 3872 [3876] [95])
;;   (newline-mark 10 [8595 10]) ; newlne, ↓
;;   (tab-mark 9 [8594 9] [92 9]) ; tab, →
;; )

;; ================================== Minor modes

;; Advanced dired
(require 'dired-x)

;; Ido mode
(require 'ido)
(require 'flx-ido)
(require 'ido-ubiquitous)
(ido-mode 1)
(ido-ubiquitous-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq flx-ido-use-faces nil)

(defun ido-ignore-non-user-except-ielm (name)
  "Ignore all non-user (a.k.a. *starred*) buffers except *scratch*.
NAME the buffer to check against."
  (and (string-match "^\*" name)
       (not (string= name "*scratch*"))))
(setq ido-ignore-buffers '("\\` " ido-ignore-non-user-except-ielm))

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Smart-mode-line
(require 'smart-mode-line)
(sml/setup)
(column-number-mode t)

;; autopair mode
(require 'autopair)
(autopair-global-mode) ;; to enable in all buffers

;; ================================= Major modes

;; Auto-complete mode
(add-to-list 'load-path "/usr/share/emacs/site-lisp/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/usr/share/emacs/site-lisp/auto-complete/ac-dict")
(ac-config-default)

; AUCTeX
(load "auctex.el" nil t t)
(require 'auctex-latexmk)
(require 'reftex)
(auctex-latexmk-setup)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;;(add-hook 'LaTeX-mode-hook 'flyspell-mode)
;;(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook 'whitespace-mode)
(add-hook 'LaTeX-mode-hook '(lambda () (local-unset-key "\"")))
(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "LatexMk")))
(setq TeX-PDF-mode t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-view-program-list '(("PDF Viewer" "zathura %o")))
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq reftex-format-cite-function 'reftex-format-cite)
(setq reftex-format-ref-function 'reftex-format-cref)
(setq reftex-plug-into-AUCTeX t)
(setq-default TeX-master nil)

;; Web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-enable-current-element-highlight nil)

;; Javascript
(autoload 'js-mode "js" "Javascript mode." t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js-mode))

;; Php mode
(autoload 'php-mode "php-mode.el" "Php mode." t)
(setq auto-mode-alist (append '(("/*.\.php[345]?$" . php-mode)) auto-mode-alist))

;; jedi (python mode)
(add-hook 'python-mode-hook 'jedi:setup)

;; Python stuff
(autoload 'python-mode "python-mode.el" "Python mode." t)
(setq auto-mode-alist (append '(("/*.\.py$" . python-mode)) auto-mode-alist))

;; Lua mode
(setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

;; Org-Mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(put 'downcase-region 'disabled nil)

;; Haskell mode
;;(load "/usr/share/emacs/site-lisp/haskell-mode/haskell-site-file")
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(setq haskell-font-lock-symbols t) ;; to get unicode symbols for lambda etc.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(current-language-environment "German")
 '(custom-safe-themes
   (quote
    ("2e5705ad7ee6cfd6ab5ce81e711c526ac22abed90b852ffaf0b316aa7864b11f" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; .init.el ends here
