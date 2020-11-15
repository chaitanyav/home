;;; .emacs
;;; Commentary: --**--
;;
;; My Emacs configuration
;;
;;; Code:
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(setq comp-deferred-compilation t)
(setq gc-cons-threshold (* 1024 1024 512)) ;; 512mb
(setq read-process-output-max (* 1024 1024 20)) ;; 20mb
(setq inhibit-startup-message t)
(setq scroll-bar-mode nil)        ; Disable visible scrollbar
(setq tool-bar-mode nil)          ; Disable the toolbar
(setq tooltip-mode nil)           ; Disable tooltips
(set-fringe-mode nil)       ; Give some breathing room
(setq menu-bar-mode nil)            ; Disable the menu bar
(setq column-number-mode t)
(setq line-number-mode t)
(setq global-linum-mode t)
(setq show-paren-mode t)
(setq visible-bell t)

;;(setq debug-on-error t)
(windmove-default-keybindings)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; uncomment for stable
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)
(setq package-list '(afternoon-theme flycheck magit blacken lsp-mode lsp-ui lsp-treemacs company rust-mode smart-mode-line ranger rainbow-delimiters go-mode undo-tree highlight-symbol highlight-parentheses highlight-numbers popup-kill-ring ace-jump-mode centaur-tabs format-all whitespace-cleanup-mode origami indent-guide golden-ratio all-the-icons auto-complete ace-popup-menu moe-theme monokai-theme monokai-pro-theme ample-theme kaolin-themes ace-window treemacs rg markdown-mode xkcd which-key dumb-jump unicode-fonts helm helm-swoop))

					; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

					; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(require 'unicode-fonts)
(unicode-fonts-setup)

(require 'golden-ratio)
(golden-ratio-mode t)

(require 'helm)
(require 'helm-swoop)

;; Enable Flycheck
(require 'flycheck)
(add-hook 'prog-mode-hook 'flycheck-mode)

;; Enable autopep8
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(require 'go-mode)
(add-hook 'go-mode-hook 'lsp-deferred)

(require 'rust-mode)
(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
(setq rust-format-on-save t)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;;(require 'whitespace-mode)
(global-prettify-symbols-mode)

(require 'ranger)
(ranger-override-dired-mode t)

(require 'undo-tree)
(global-undo-tree-mode)

(require 'highlight-symbol)
(add-hook 'prog-mode-hook 'highlight-symbol-mode)
(setq highlight-symbol-on-navigation-p t)

(require 'highlight-numbers)
(add-hook 'prog-mode-hook 'highlight-numbers-mode)

(require 'highlight-parentheses)
(add-hook 'prog-mode-hook 'highlight-parentheses-mode)

;; hs-minor-mode
(add-hook 'prog-mode-hook 'hs-minor-mode)

(require 'popup-kill-ring)

(require 'ace-jump-mode)
(setq ace-jump-mode t)

(require 'centaur-tabs)
(setq centaur-tabs-set-icons t)
(setq centaur-tabs-set-bar 'over)
(setq x-underline-at-descent-line t)
(setq centaur-tabs-enable-key-bindings t)
(centaur-tabs-mode t)

(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-create-new-buffer 'always)
(ido-mode t)

(require 'format-all)
(add-hook 'prog-mode-hook 'format-all-mode)

(require 'whitespace-cleanup-mode)
(add-hook 'prog-mode-hook 'whitespace-cleanup-mode)

(require 'origami)
(add-hook 'prog-mode-hook 'origami-mode)

(require 'indent-guide)
(add-hook 'prog-mode-hook 'indent-guide-mode)

(require 'all-the-icons)
;;(all-the-icons-install-fonts)

(require 'auto-complete)
(ac-config-default)
(global-auto-complete-mode)

(require 'ace-popup-menu)
(ace-popup-menu-mode t)

(require 'ace-window)

(require 'smart-mode-line)
(setq sml/theme 'dark)
(sml/setup)

;; (require 'treemacs)

(require 'kaolin-themes)
(load-theme 'kaolin-valley-dark)

(require 'rg)
(require 'markdown-mode)
(require 'xkcd)

(require 'which-key)
(which-key-mode t)

(require 'dumb-jump)
(setq dumb-jump-force-searcher 'rg)
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)

(require 'lsp-ui)
(add-hook 'prog-mode-hook 'lsp-ui-mode)
(setq lsp-ui-sideline-enable t)
(setq lsp-ui-sideline-show-hover nil)
(setq lsp-ui-doc-position 'right)
(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
;;(lsp-ui-peek-find-workspace-symbol "pattern 0")
;; If the server supports custom cross references
;;(lsp-ui-peek-find-custom 'base "$cquery/base")
(setq lsp-ui-peek-enable t)
(setq lsp-ui-doc-enable t)

(require 'lsp-mode)
(setq lsp-completion-provider :capf)
(setq lsp-print-performance t)
(setq lsp-enable-file-watchers nil)
(setq lsp-enable-which-key-integration t)
(add-hook 'prog-mode-hook #'lsp-deferred)
(add-hook 'prog-mode-hook #'lsp-modeline-code-actions-mode)
;;(lsp-ui-sideline-toggle-symbols-info t)
(add-hook 'prog-mode-hook #'lsp-headerline-breadcrumb-mode)
(add-hook 'prog-mode-hook #'lsp-modeline-diagnostics-mode)
(provide '.emacs)
;;; .emacs ends here
