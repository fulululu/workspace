;;; Package --- summary
;;; Commentary:
;; Codes here are all about pluging packages.

;;; Code:
;; ================================ Basic Package Setting ==================================
(require 'package)
(setq package-archives '(("gnu" . "http://1.15.88.122/gnu/")
                         ("melpa" . "http://1.15.88.122/melpa/")))

(dolist (package '(use-package diminish))
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))

;; ================================ Built-in Package Setting ==================================
(require 'associate-packagevc-with-usepackage)

(use-package hideshow
  :diminish hs-minor-mode
  :hook ((c-mode c++mode json-mode) . hs-minor-mode)
  :config (setq hs-allow-nesting t))

(use-package flymake
  ;; Disable "Warning [flymake init.el]: Disabling backend flymake-proc-legacy-flymake because
  ;; (error Can’t find a suitable init function) " in *Flymake log* buffer
  :config (remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake))

;; ================================ Minimal Third Party Package Setting ==================================
; This package is used to benchmark emacs startup time.
(use-package benchmark-init
  :ensure t
  :config
  ;; To disable collection of benchmark data after init is done.
  (add-hook 'after-init-hook 'benchmark-init/deactivate))

(use-package diminish
  :commands diminish
  :diminish (eldoc-mode abbrev-mode))

(use-package hungry-delete
  :ensure t
  :diminish hungry-delete-mode
  :config (global-hungry-delete-mode t))

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config (smartparens-global-mode t))

(use-package popwin
  :ensure t
  :config (popwin-mode t))

(use-package wn-mode
  :ensure t
  :diminish wn-mode
  :config (wn-mode t))

(use-package pbcopy
  :ensure t)

(use-package company
  :ensure t
  :diminish company-mode
  :init (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-idle-delay 0.1
	company-minimum-prefix-length 1
	company-backends '(company-capf)))

(use-package ivy
  :ensure t
  :pin melpa
  :demand
  :diminish ivy-mode
  :config
  (ivy-mode t)
  (setq ivy-use-virtual-buffers t
  	ivy-count-format "%d/%d ")
  :bind (:map ivy-mode-map
  	      ("C-x C-b" . ivy-switch-buffer)
  	      ("C-x b" . ivy-switch-buffer)))

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
  	 ("C-r" . swiper)))

(use-package counsel
  :ensure t
  :diminish counsel-mode
  :init (counsel-mode t)
  :bind (:map counsel-mode-map
	      ("C-h f" . 'counsel-describe-function)
	      ("C-h v" . 'counsel-describe-variable)
	      ("C-h b" . 'counsel-descbinds)
	      ("M-x" . counsel-M-x)
	      ("C-x r" . counsel-recentf)))

;; This package is used to resolve one issue when using exec-path-from-shell
(use-package cache-path-from-shell
  :ensure t
  :vc (:fetcher "github" :repo "manateelazycat/cache-path-from-shell"))

(use-package exec-path-from-shell
  :ensure t
  :init
  (require 'cache-path-from-shell)
  (setq exec-path-from-shell-arguments nil)
  :config (exec-path-from-shell-initialize))

(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package cmake-mode
  :ensure t)

(use-package json-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)

(use-package dockerfile-mode
  :ensure t
  :init
  (add-to-list 'load-path "~/.emacs.d/elpa/dockerfile-mode/")
  (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

(use-package docker-compose-mode
  :ensure t)

(use-package protobuf-mode
  :ensure t)

(use-package graphql-mode
  :ensure t)

;; ================================ Extra Third Party Package Setting ==================================
(use-package projectile
  :ensure t
  :commands projectile-mode
  :diminish projectile-mode
  :hook ((emacs-lisp-mode c-mode c++-mode python-mode asm-mode) . projectile-mode)
  :config (setq projectile-completion-system 'ivy)
  :bind (:map projectile-mode-map
	      ("s-p" . 'projectile-command-map)
	      ("C-c p" . 'projectile-command-map)))

(use-package yasnippet
  :ensure t
  :pin melpa
  :commands yas-minor-mode
  :diminish yas-minor-mode
  :hook ((c-mode c++-mode python-mode asm-mode sh-mode go-mode) . yas-minor-mode)
  :bind (:map yas-minor-mode-map
	      ("C-c y" . 'ivy-yasnippet)))

(use-package yasnippet-snippets
  :ensure t)

(use-package ivy-yasnippet
  :ensure t)

(use-package magit
  :ensure t
  :config (setq magit-view-git-manual-method 'man))

(use-package google-c-style
  :ensure t
  :hook ((c-mode c++-mode) . google-set-c-style))

(use-package lsp-mode
  :ensure t
  :commands lsp
  :init
  (setq read-process-output-max (* 1024 1024))
  (setq gc-cons-threshold 100000000)
  (setq lsp-log-io nil)
  :hook ((sh-mode go-mode python-mode) . lsp-deferred))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :hook (lsp-mode . lsp-ui-mode)
  :bind (:map lsp-ui-mode-map
	      ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
              ([remap xref-find-references] . lsp-ui-peek-find-references)))

(use-package go-mode
  :ensure t
  :init
  (add-hook 'go-mode-hook (lambda()
			    (add-hook 'before-save-hook #'lsp-format-buffer t t)
			    (add-hook 'before-save-hook #'lsp-organize-imports t t))))

(use-package php-mode
  :ensure t
  :mode
  ("\\.php\\'" . php-mode))

(provide 'init-packages)
;;; init-packages.el ends here
