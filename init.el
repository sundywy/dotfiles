(require 'package)

(set-frame-font "Hack-16")

(setq inhibit-startup-screen t)
(global-display-line-numbers-mode t)

(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))
(add-to-list
 'package-archives
 '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(use-package counsel
  :ensure t
  :bind
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line)))

(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "%d/%d ")
  (setq ivy-display-style 'fancy)
  (setq ivy-use-selectable-prompt t))

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper-isearch)
	 ("C-r" . swiper-isearch)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

(use-package company
  :ensure t
  :bind (:map company-active-map
              ("<tab>" . company-complete-selection))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 3)
  (global-company-mode t))

(use-package iedit
  :ensure t)

(use-package smartparens
  :ensure t
  :hook (prog-mode . smartparens-mode)
  :config
  (require 'smartparens-config)
  (add-hook 'minibuffer-setup-hook 'turn-on-smartparens-strict-mode)
  (smartparens-global-mode t)
  (show-smartparens-global-mode t))

;; (use-package tree-sitter
;;   :ensure t
;;   :config
;;   ;; activate tree-sitter on any buffer containing code for which it has a parser available
;;   (global-tree-sitter-mode)
;;   ;; you can easily see the difference tree-sitter-hl-mode makes for python, ts or tsx
;;   ;; by switching on and off
;;   (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

;; (use-package tree-sitter-langs
;;   :ensure t
;;   :after tree-sitter)

;; (use-package eglot
;;   :hook((
;; 	 ;; c-mode
;; 	 ;; c++-mode
;; 	 ;; python-mode
;; 	 ruby-mode
;; 	 ;; rust-mode
;; 	 ;; go-mode
;; 	 elixir-mode
;; 	 ;; cmake-mode
;; 	 ;; zig-mode 
;; 	 ) . eglot-ensure)
;;   :config
;;   (add-hook 'eglot-managed-mode-hook (lambda () (flymake-mode -1)))
;;   (add-to-list 'eglot-server-programs '((ruby-mode ruby-ts-mode) "ruby-lsp")))

(use-package jetbrains-darcula-theme
  :ensure t
  :init (load-theme 'jetbrains-darcula t))

(use-package slime
  :ensure t
  :init (setq inferior-lisp-program "sbcl"))

(use-package slime-company
  :ensure t 
  :after (slime company)
  :config (setq slime-company-completion 'fuzzy
                slime-company-after-completion 'slime-company-just-one-space))

(use-package rustic
  :ensure t
  :config
  (setq rustic-format-on-save t)
  (setq rustic-lsp-client 'eglot)
  (setq rustic-lsp-server 'rust-analyzer))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package rainbow-identifiers
  :ensure t
  :hook (prog-mode . rainbow-identifiers-mode))

(use-package nix-mode
  :ensure t)

(use-package racket-mode
  :ensure t)

;; (use-package cmake-mode
;;   :ensure t)

(use-package geiser
  :ensure t
  :config
  (use-package geiser-guile
    :ensure t))

(use-package cider
  :ensure t)

(use-package yasnippet
  :ensure t
  :config
  (require 'yasnippet)
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t)

(use-package tuareg
  :ensure t
  :config
  (load "/Users/sundyyaputra/.opam/default/share/emacs/site-lisp/tuareg-site-file")
  (autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
  (add-hook 'tuareg-mode-hook 'utop-minor-mode))

(use-package ocamlformat
  :ensure t
  :custom (ocamlformat-enable 'enable-outside-detected-project)
  :hook (before-save . ocamlformat-before-save))

(use-package utop
  :ensure t)

(use-package merlin
  :ensure t
  :config
  (require 'merlin-company)
  (require 'merlin-iedit)
  :hook (tuareg-mode . merlin-mode))

(use-package merlin-company
  :ensure t
  :config
  (add-to-list 'company-backends 'merlin-company))

(use-package merlin-iedit
  :ensure t)

(use-package dune
  :ensure t)

(use-package haskell-mode
  :ensure t
  :config
  (require 'haskell-interactive-mode)
  (require 'haskell-process)
  (add-hook 'haskell-mode-hook 'interactive-haskell-mode))

;; (use-package flycheck
;;   :ensure t
;;   :init (global-flycheck-mode)
;;   :config
;;   (setq flycheck-python-flake8-executable "flake8"))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package cider
  :ensure t)

(use-package clojure-mode
  :ensure t)

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))

(use-package projectile
  :ensure t)

;; (when (executable-find "ipython")
;;   (setq python-shell-interpreter "ipython"))

;; (use-package go-mode
;;   :ensure t
;;   :custom
;;   (gofmt-command "goimports")
;;   :hook (before-save . gofmt-before-save))

;; (use-package terraform-mode
;;   :ensure t)

;; (use-package yaml-mode
;;   :ensure t)

(use-package multiple-cursors
  :ensure t
  :config
  (require 'multiple-cursors)
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

;; (use-package bazel
;;   :ensure t)

(use-package magit
  :ensure t)

;; (use-package company-dcd
;;   :ensure t)

;; (use-package d-mode
;;   :ensure t
;;   :config
;;   (require 'company-dcd)
;;   (add-hook 'd-mode-hook 'company-dcd-mode))

(use-package js2-mode
  :ensure t
  :config
  (require 'js2-mode)
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

(add-to-list 'auto-mode-alist '("\\.ipp\\'" . c-or-c++-mode))

(use-package cc-mode
  :config
  (require 'company-capf)
  ;; (load "/opt/homebrew/opt/llvm/share/emacs/site-lisp/llvm/clang-format.el")
  ;; (require 'clang-format)
  :hook (company-capf . c++-mode)
  ;; :hook (before-save . clang-format+-always-enable)
  )

(use-package python-black
  :ensure t
  :after python
  :hook (python-mode . python-black-on-save-mode))

(use-package emmet-mode
  :ensure t
  :after (web-mode)
  :hook (web-mode . emmet-mode))

;; (use-package scala-mode
;;   :ensure t 
;;   :interpreter ("scala" . scala-mode))

;; ;; Enable sbt mode for executing sbt commands
;; (use-package sbt-mode
;;   :ensure t
;;   :commands sbt-start sbt-command
;;   :config
;;   ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
;;   ;; allows using SPACE when in the minibuffer
;;   (substitute-key-definition
;;    'minibuffer-complete-word
;;    'self-insert-command
;;    minibuffer-local-completion-map)
;;    ;; sbt-supershell kills sbt-mode:  https://github.com/hvesalai/emacs-sbt-mode/issues/152
;;   (setq sbt:program-options '("-Dsbt.supershell=false")))

(use-package format-all
  :ensure t)

;; (use-package janet-mode
;;   :ensure t)

;; (use-package lua-mode
;;   :ensure t)

(use-package elixir-mode
  :ensure t)

;; (use-package clang-format+
;;   :ensure t
;;   :config
;;   (setq clang-format+-always-enable t)
;;   :hook
;;   (c-mode-common-mode . clang-format+-mode))

;; (use-package rubocopfmt
;;   :hook
;;   (ruby-mode . rubocopfmt-mode))

;; (use-package rubocopfmt
;;   :ensure t
;;   :hook
;;   (ruby-mode . rubocopfmt-mode)
;;   (before-save . rubocopfmt-before-save)
;;   :custom
;;   (rubocopfmt-include-unsafe-cops t))

(use-package zig-mode
  :ensure t)

(use-package php-mode
  :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(connection-local-criteria-alist
   '(((:application tramp :protocol "flatpak")
      tramp-container-connection-local-default-flatpak-profile)
     ((:application tramp :machine "localhost")
      tramp-connection-local-darwin-ps-profile)
     ((:application tramp :machine "R77-NB274.local")
      tramp-connection-local-darwin-ps-profile)
     ((:application tramp)
      tramp-connection-local-default-system-profile
      tramp-connection-local-default-shell-profile)))
 '(connection-local-profile-alist
   '((tramp-container-connection-local-default-flatpak-profile
      (tramp-remote-path "/app/bin" tramp-default-remote-path "/bin"
			 "/usr/bin" "/sbin" "/usr/sbin"
			 "/usr/local/bin" "/usr/local/sbin"
			 "/local/bin" "/local/freeware/bin"
			 "/local/gnu/bin" "/usr/freeware/bin"
			 "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin"
			 "/opt/sbin" "/opt/local/bin"))
     (tramp-connection-local-darwin-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o"
					"pid,uid,user,gid,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
					"-o" "state=abcde" "-o"
					"ppid,pgid,sess,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etime,pcpu,pmem,args")
      (tramp-process-attributes-ps-format (pid . number)
					  (euid . number)
					  (user . string)
					  (egid . number) (comm . 52)
					  (state . 5) (ppid . number)
					  (pgrp . number)
					  (sess . number)
					  (ttname . string)
					  (tpgid . number)
					  (minflt . number)
					  (majflt . number)
					  (time . tramp-ps-time)
					  (pri . number)
					  (nice . number)
					  (vsize . number)
					  (rss . number)
					  (etime . tramp-ps-time)
					  (pcpu . number)
					  (pmem . number) (args)))
     (tramp-connection-local-busybox-ps-profile
      (tramp-process-attributes-ps-args "-o"
					"pid,user,group,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
					"-o" "stat=abcde" "-o"
					"ppid,pgid,tty,time,nice,etime,args")
      (tramp-process-attributes-ps-format (pid . number)
					  (user . string)
					  (group . string) (comm . 52)
					  (state . 5) (ppid . number)
					  (pgrp . number)
					  (ttname . string)
					  (time . tramp-ps-time)
					  (nice . number)
					  (etime . tramp-ps-time)
					  (args)))
     (tramp-connection-local-bsd-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o"
					"pid,euid,user,egid,egroup,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
					"-o"
					"state,ppid,pgid,sid,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etimes,pcpu,pmem,args")
      (tramp-process-attributes-ps-format (pid . number)
					  (euid . number)
					  (user . string)
					  (egid . number)
					  (group . string) (comm . 52)
					  (state . string)
					  (ppid . number)
					  (pgrp . number)
					  (sess . number)
					  (ttname . string)
					  (tpgid . number)
					  (minflt . number)
					  (majflt . number)
					  (time . tramp-ps-time)
					  (pri . number)
					  (nice . number)
					  (vsize . number)
					  (rss . number)
					  (etime . number)
					  (pcpu . number)
					  (pmem . number) (args)))
     (tramp-connection-local-default-shell-profile
      (shell-file-name . "/bin/sh") (shell-command-switch . "-c"))
     (tramp-connection-local-default-system-profile
      (path-separator . ":") (null-device . "/dev/null"))))
 '(custom-safe-themes
   '("5185a285365a768a30ac274bdbc4437e7fd2fbe3107a1b0f2b60e900181905e0"
     default))
 '(package-archives
   '(("melpa" . "https://melpa.org/packages/")
     ("gnu" . "https://elpa.gnu.org/packages/")))
 '(package-selected-packages
   '(cider counsel dune editorconfig eglot elixir-mode emmet-mode
	   flycheck format-all geiser-guile haskell-mode
	   jetbrains-darcula-theme js2-mode magit merlin-company
	   merlin-iedit multiple-cursors nix-mode ocamlformat php-mode
	   projectile python-black racket-mode rainbow-delimiters
	   rainbow-identifiers rustic s slime-company smartparens utop
	   web-mode xterm-color yaml-mode yasnippet-snippets zig-mode))
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
;; (require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(defun my-projectile-project-find-function (dir)
  (let ((root (projectile-project-root dir)))
    (and root (cons 'transient root))))

(projectile-mode t)

(with-eval-after-load 'project
  (add-to-list 'project-find-functions 'my-projectile-project-find-function))
