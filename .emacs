(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (afternoon)))
 '(package-selected-packages (quote (magit flycheck elpy slime powerline centaur-tabs))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq inhibit-startup-message t)
(setq column-number-mode t)
(setq line-number-mode t)
(global-linum-mode t)
(setq show-paren-mode t)
(windmove-default-keybindings)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; uncomment for stable
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)
(setq package-list '(afternoon-theme elpy flycheck py-autopep8 magit blacken lsp-mode rust-mode smart-mode-line ranger rainbow-delimiters go-mode undo-tree highlight-symbol highlight-parentheses highlight-numbers popup-kill-ring ace-jump-mode centaur-tabs format-all whitespace-cleanup-mode origami indent-guide zoom all-the-icons auto-complete ace-popup-menu moe-theme monokai-theme monokai-pro-theme ample-theme kaolin-themes ace-window treemacs))

					; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

					; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(elpy-enable)

					; Use IPython for REPL
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

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
;;(require 'prettify-symbols-mode)
(require 'ranger)
(ranger-override-dired-mode t)

(require 'undo-tree)
(global-undo-tree-mode)

(require 'highlight-symbol)
(add-hook 'prog-mode-hook 'highlight-symbol-mode)
(setq highlight-symbol-on-navigation-p t)
;;(global-set-key [f3] 'highlight-symbol-next)
;;(global-set-key [(shift f3)] 'highlight-symbol-prev)

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

(require 'zoom)
(zoom-mode t)

(require 'all-the-icons)
;;(all-the-icons-install-fonts)

(require 'auto-complete)
(ac-config-default)
(global-auto-complete-mode)

(require 'ace-popup-menu)
(ace-popup-menu-mode t)

(require 'ace-window)

(require 'smart-mode-line)
(setq sml/theme 'respectful)
(sml/setup)

(require 'treemacs)
(treemacs-mode t)

(require 'kaolin-themes)
(load-theme 'kaolin-valley-dark)
(kaolin-treemacs-theme)
