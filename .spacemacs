(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(rust
     idris
     (typescript :variables typescript-backend 'tide)
     react
     web-beautify
     javascript
     sql
     purescript
     yaml
     python
     ocaml
     (haskell :variables haskell-enable-ghc-mod-support nil)
     (keyboard-layout :variables kl-layout 'bepo)
     coq
     (erc :variables
          erc-server-list
          '(("irc.freenode.net"
             :port "6697"
             :ssl t
             :nick "kindaro")))
     cmake
     lsp
     gpu
     (c-c++ :variables c-c++-backend 'lsp-clangd c-c++-lsp-enable-semantic-highlight 'rainbow)
     helm
     html
     auto-completion
     emacs-lisp
     markdown
     syntax-checking
     multiple-cursors
     treemacs)
   dotspacemacs-additional-packages '(base16-theme)
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only))
(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  (setq-default
   dotspacemacs-enable-emacs-pdumper nil
   dotspacemacs-emacs-pdumper-executable-file "emacs"
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-gc-cons '(100000000 0.1)
   dotspacemacs-read-process-output-max (* 1024 1024)
   dotspacemacs-use-spacelpa nil
   dotspacemacs-verify-spacelpa-archives t
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory 'emacs-version
   dotspacemacs-editing-style 'vim
   dotspacemacs-startup-buffer-show-version t
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-show-startup-list-numbers t
   dotspacemacs-startup-buffer-multi-digit-delay 0.4
   dotspacemacs-new-empty-buffer-major-mode 'text-mode
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-scratch-buffer-persistent nil
   dotspacemacs-scratch-buffer-unkillable nil
   dotspacemacs-initial-scratch-message nil
   dotspacemacs-themes '(base16-black-metal)
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Inconsolata LGC"
                               :size 12
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-generate-layout-names nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-undecorated-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-scroll-bar-while-scrolling t
   dotspacemacs-line-numbers nil
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-activate-smartparens-mode t
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-enable-server nil
   dotspacemacs-server-socket-dir nil
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   dotspacemacs-frame-title-format "%I@%S"
   dotspacemacs-icon-title-format nil
   dotspacemacs-show-trailing-whitespace t
   dotspacemacs-whitespace-cleanup nil
   dotspacemacs-use-clean-aindent-mode t
   dotspacemacs-use-SPC-as-y nil
   dotspacemacs-swap-number-row nil
   dotspacemacs-zone-out-when-idle nil
   dotspacemacs-pretty-docs nil
   dotspacemacs-home-shorten-agenda-source nil
   dotspacemacs-byte-compile nil))
(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))
(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first.")
(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump.")
(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
    (eval-after-load 'coq `(evil-define-key 'normal coq-mode-map (kbd "RET") 'proof-assert-next-command-interactive))
    (eval-after-load 'coq `(evil-define-key 'normal coq-mode-map (kbd "DEL") 'proof-undo-last-successful-command))
    (load-theme 'base16-black-metal-dark-funeral t)
    (add-hook 'after-change-major-mode-hook '(lambda () (variable-pitch-mode)))
    (add-hook 'after-change-major-mode-hook '(lambda () (visual-line-mode)))
    (set-fontset-font t nil (font-spec :size 18 :name "Symbola"))
    (set-fontset-font t 'greek (font-spec :size 18 :name "GFS Olga"))
    (set-fontset-font t '(#x2295 . #x229d) (font-spec :size 22 :name "Symbola")) ;; Especially hard to read mathematics.
    (set-fontset-font t '(#x2190 . #x21ff) (font-spec :size 18 :name "Symbola")) ;; Arrows
    (server-start)
    (setq load-path (append (list (expand-file-name "/usr/share/emacs/site-lisp/")) load-path))
    (autoload 'LilyPond-mode "lilypond-mode")
    (setq auto-mode-alist
          (cons '("\\.ly$" . LilyPond-mode) auto-mode-alist))
  )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 '(coq-one-command-per-line nil)
 '(custom-safe-themes
   '("760ce657e710a77bcf6df51d97e51aae2ee7db1fba21bbad07aab0fa0f42f834" default))
 '(erc-modules
   '(completion log spelling services hl-nicks netsplit button match track readonly networks ring autojoin noncommands irccontrols move-to-prompt stamp menu list))
 '(evil-want-Y-yank-to-eol nil)
 '(global-undo-tree-mode t)
 '(line-spacing 0.3)
 '(lsp-ui-sideline-enable nil)
 '(package-selected-packages
   '(toml-mode ron-mode racer helm-gtags ggtags flycheck-rust dap-mode bui counsel-gtags counsel swiper ivy cargo rust-mode yapfify yaml-mode web-beautify utop tuareg caml tide typescript-mode sql-indent pyvenv pytest pyenv-mode py-isort psci purescript-mode psc-ide flycheck pip-requirements ocp-indent merlin livid-mode skewer-mode simple-httpd live-py-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc idris-mode prop-menu hy-mode dash-functional hlint-refactor hindent helm-pydoc helm-hoogle helm-company helm-c-yasnippet haskell-snippets fuzzy erc-yt erc-view-log erc-social-graph erc-image erc-hl-nicks disaster cython-mode company-statistics company-ghci haskell-mode company-cabal company-c-headers company-anaconda company coffee-mode cmm-mode cmake-mode clang-format base16-theme auto-yasnippet yasnippet anaconda-mode pythonic ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump diminish define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile alect-themes aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line))
 '(proof-auto-raise-buffers nil)
 '(proof-multiple-frames-enable t)
 '(psc-ide-add-import-on-completion t t)
 '(psc-ide-rebuild-on-save nil t)
 '(send-mail-function 'mailclient-send-it))
(custom-set-faces
 '(coq-solve-tactics-face ((t (:foreground "dark magenta"))))
 '(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face :foreground "dark olive green"))))
 '(font-lock-comment-face ((t (:foreground "dim gray"))))
 '(highlight ((t (:foreground "#FFFFFF"))))
 '(proof-locked-face ((((type x) (class color) (background light)) (:background "#201030" :extend t)) (((type x) (class color) (background dark)) (:background "#201030" :extend t)) (((type mswindows) (class color) (background light)) (:background "#201030" :extend t)) (((type mswindows) (class color) (background dark)) (:background "#201030" :extend t)) (((type w32) (class color) (background light)) (:background "#201030" :extend t)) (((type w32) (class color) (background dark)) (:background "#201030" :extend t)) (((type gtk) (class color) (background light)) (:background "#201030" :extend t)) (((type gtk) (class color) (background dark)) (:background "#201030" :extend t)) (((type mac) (class color) (background light)) (:background "#201030" :extend t)) (((type mac) (class color) (background dark)) (:background "#201030" :extend t)) (((type carbon) (class color) (background light)) (:background "#201030" :extend t)) (((type carbon) (class color) (background dark)) (:background "#201030" :extend t)) (((type ns) (class color) (background light)) (:background "#201030" :extend t)) (((type ns) (class color) (background dark)) (:background "#201030" :extend t)) (((type x-toolkit) (class color) (background light)) (:background "#201030" :extend t)) (((type x-toolkit) (class color) (background dark)) (:background "#201030" :extend t)) (t (:underline t :extend t))))
 '(proof-queue-face ((((type x) (class color) (background light)) (:background "#302010" :extend t)) (((type x) (class color) (background dark)) (:background "#302010" :extend t)) (((type mswindows) (class color) (background light)) (:background "#302010" :extend t)) (((type mswindows) (class color) (background dark)) (:background "#302010" :extend t)) (((type w32) (class color) (background light)) (:background "#302010" :extend t)) (((type w32) (class color) (background dark)) (:background "#302010" :extend t)) (((type gtk) (class color) (background light)) (:background "#302010" :extend t)) (((type gtk) (class color) (background dark)) (:background "#302010" :extend t)) (((type mac) (class color) (background light)) (:background "#302010" :extend t)) (((type mac) (class color) (background dark)) (:background "#302010" :extend t)) (((type carbon) (class color) (background light)) (:background "#302010" :extend t)) (((type carbon) (class color) (background dark)) (:background "#302010" :extend t)) (((type ns) (class color) (background light)) (:background "#302010" :extend t)) (((type ns) (class color) (background dark)) (:background "#302010" :extend t)) (((type x-toolkit) (class color) (background light)) (:background "#302010" :extend t)) (((type x-toolkit) (class color) (background dark)) (:background "#302010" :extend t)) (t (:underline t :extend t))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "VioletRed3"))))
 '(variable-pitch ((t (:height 1.2 :family "Merriweather")))))
)
(custom-set-variables
 '(package-selected-packages
   '(yapfify yaml-mode web-beautify utop tuareg caml tide typescript-mode sql-indent pyvenv pytest pyenv-mode py-isort psci purescript-mode psc-ide flycheck pip-requirements ocp-indent merlin livid-mode skewer-mode simple-httpd live-py-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc idris-mode prop-menu hy-mode dash-functional hlint-refactor hindent helm-pydoc helm-hoogle helm-company helm-c-yasnippet haskell-snippets fuzzy erc-yt erc-view-log erc-social-graph erc-image erc-hl-nicks disaster cython-mode company-statistics company-ghci haskell-mode company-cabal company-c-headers company-anaconda company coffee-mode cmm-mode cmake-mode clang-format base16-theme auto-yasnippet yasnippet anaconda-mode pythonic ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump diminish define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile alect-themes aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
(custom-set-faces
 )
