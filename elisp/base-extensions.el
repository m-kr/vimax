
(use-package avy
  :bind
  ("C-c SPC" . avy-goto-char))

(use-package dashboard
  :config
  (dashboard-setup-startup-hook))

(use-package ediff
  :config
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)
  (setq-default ediff-highlight-all-diffs 'nil)
  (setq ediff-diff-options "-w"))

(use-package exec-path-from-shell
  :config
  ;; Add GOPATH to shell
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-copy-env "GOPATH")
    (exec-path-from-shell-copy-env "PYTHONPATH")
    (exec-path-from-shell-initialize)))

(use-package expand-region
  :bind
  ("C-=" . er/expand-region))

(use-package counsel
  :bind
  ("M-x" . counsel-M-x)
  ("C-x C-m" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ("C-x c k" . counsel-yank-pop))

(use-package counsel-projectile
  :bind
  ("C-x v" . counsel-projectile)
  ("C-x c p" . counsel-projectile-ag)
  :config
  (counsel-projectile-on))

(use-package ivy
  :bind
  ("C-x s" . swiper)
  ("C-x C-r" . ivy-resume)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers nil)
  (define-key read-expression-map (kbd "C-r") 'counsel-expression-history))


;; (use-package hlinum
;;   :config
;;   (hlinum-activate))

;; (use-package linum
;;   :config
;;   (setq linum-format " %3d ")
;;   (global-linum-mode nil))

(use-package magit
  :config

  (setq magit-completing-read-function 'ivy-completing-read)

  :bind
  ;; Magic
  ("C-x g s" . magit-status)
  ("C-x g x" . magit-checkout)
  ("C-x g c" . magit-commit)
  ("C-x g p" . magit-push)
  ("C-x g u" . magit-pull)
  ("C-x g e" . magit-ediff-resolve)
  ("C-x g r" . magit-rebase-interactive))

(use-package magit-popup)

(use-package multiple-cursors
  :bind
  ("C-S-c C-S-c" . mc/edit-lines)
  ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-previous-like-this)
  ("C-c C->" . mc/mark-all-like-this))

(use-package neotree
  :config
  (setq neo-theme 'arrow
        neotree-smart-optn t
        neo-window-fixed-size nil)
  ;; Disable linum for neotree
  (add-hook 'neo-after-create-hook 'disable-neotree-hook))

(use-package org
  :config
  (setq org-directory "~/org-files"
        org-default-notes-file (concat org-directory "/todo.org"))
  :bind
  ("C-c l" . org-store-link)
  ("C-c a" . org-agenda))

(use-package org-projectile
  :config
  (org-projectile-per-project)
  (setq org-projectile-per-project-filepath "todo.org"
	org-agenda-files (append org-agenda-files (org-projectile-todo-files))))

(use-package org-bullets
  :config
  (setq org-hide-leading-stars t)
  (add-hook 'org-mode-hook
            (lambda ()
              (org-bullets-mode t))))

(use-package page-break-lines)

(use-package projectile
  :config
  (setq projectile-known-projects-file
        (expand-file-name "projectile-bookmarks.eld" temp-dir))

  (setq projectile-completion-system 'ivy)

  (projectile-global-mode))

(use-package recentf
  :config
  (setq recentf-save-file (recentf-expand-file-name "~/.emacs.d/private/cache/recentf"))
  (recentf-mode 1))

(use-package smartparens)

(use-package smex)

(use-package undo-tree
  :config
  ;; Remember undo history
  (setq
   undo-tree-auto-save-history nil
   undo-tree-history-directory-alist `(("." . ,(concat temp-dir "/undo/"))))
  (global-undo-tree-mode 1))

(use-package which-key
  :config
  (which-key-mode))

(use-package windmove
  :bind
  ("C-x <up>" . windmove-up)
  ("C-x <down>" . windmove-down)
  ("C-x <left>" . windmove-left)
  ("C-x <right>" . windmove-right))

(use-package wgrep)

(use-package yasnippet
  :config
  (yas-global-mode 1))

;;;;;;;;; Custom part ;;;;;;;;;;;
(use-package git-gutter
  :config
  (global-git-gutter-mode t))

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-commentary
  :after evil
  :ensure t
  :config
  (evil-commentary-mode))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package airline-themes)

(use-package powerline
  :requires airline-themes
  :ensure t
  :config
  (airline-themes-set-modeline))
  ;; (powerline-vim-theme))
  ;; (powerline-center-evil-theme))

;; (use-package spaceline
;;   :ensure t
;;   :config
;;   (spaceline-spacemacs-theme))
  ;; :after powerline
  ;; :init
  ;; (setq airline-themes-set-modeline t)
  ;; (load-theme 'airline-cool-theme))

(use-package prettier-js
  :ensure t
  :config
  (add-hook 'js2-mode-hook 'prettier-js-mode))

(use-package company
 :ensure t
 :config
 (setq company-idle-delay 0.3)
 (add-hook 'after-init-hook 'global-company-mode))
 ;;(global-set-key (kbd “C-\<tab\>”) ‘company-complete))

(use-package company-php)

;; (use-package lsp-mode
;;   :ensure t
;;   :defer t
;;   :config
;;   (with-eval-after-load 'lsp-mode
;;       (require 'lsp-flycheck))
;;   :custom
;;   (lsp-enable-flycheck t)
;;   (lsp-enable-eldoc t)
;;   (lsp-enable-completion-at-point t))

 ; Company-LSP
(use-package company-lsp
  :ensure t
  :after lsp-mode
  :config
  (push 'company-lsp company-backends)
  :custom
  (company-lsp-async t)
  (company-lsp-enable-snippet t))

;; (use-package lsp-mode
;;   :hook (XXX-mode . lsp)
;;   :commands lsp)

;; (use-package lsp-ui :commands lsp-ui-mode)
;; (use-package company-lsp :commands company-lsp)
;; (use-package helm-lsp :commands helm-lsp-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(use-package lsp-mode
 ;; :config
  ;; (setq lsp-prefer-flymake nil)
  :hook ((php-mode . lsp)
	 (js2--mode . lsp))
  :commands lsp)

(use-package lsp-ui
 :requires lsp-mode flycheck
 :config
 (setq lsp-ui-doc-enable t
 lsp-ui-doc-use-childframe t
 lsp-ui-doc-position ‘top
 lsp-ui-doc-include-signature t
 lsp-ui-sideline-enable nil
 lsp-ui-flycheck-enable t
 lsp-ui-flycheck-list-position ‘right
 lsp-ui-flycheck-live-reporting t
 lsp-ui-peek-enable t
 lsp-ui-peek-list-width 60
 lsp-ui-peek-peek-height 25
 lsp-ui-sideline-enable nil)
 (add-hook ‘lsp-mode-hook ‘lsp-ui-mode))

;; (use-package company-lsp
;;  :commands company-lsp)

;; (use-package linum-relative
;;   :ensure t
;;   :config
;;   (setq linum-relative-current-symbol "")
;;   (linum-relative-toggle))

(provide 'base-extensions)
