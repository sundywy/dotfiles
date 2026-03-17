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

(use-package treesit-auto
  :ensure t
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(use-package tree-sitter
  :ensure t
  :config
  ;; activate tree-sitter on any buffer containing code for which it has a parser available
  (global-tree-sitter-mode)
  ;; you can easily see the difference tree-sitter-hl-mode makes for python, ts or tsx
  ;; by switching on and off
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(use-package tree-sitter-langs
  :ensure t
  :after tree-sitter)

(use-package eglot
  ;; :hook((
  ;; 	 ;; c-mode
  ;; 	 ;; c++-mode
  ;; 	 ;; python-mode
  ;; 	 ;; ruby-mode
  ;; 	 ;; rust-mode
  ;; 	 ;; go-mode
  ;; 	 ;; elixir-mode
  ;; 	 ;; cmake-mode
  ;; 	 ;; zig-mode 
  ;; 	 ) . eglot-ensure)
  :config
  ;; (add-hook 'eglot-managed-mode-hook (lambda () (flymake-mode -1)))
  (add-to-list 'eglot-server-programs '((python-mode python-ts-mode) . ("ty" "server")))
  (add-to-list 'eglot-server-programs '((ruby-mode ruby-ts-mode) . ("ruby-lsp")))
  (add-to-list 'eglot-server-programs '(d-mode . ("serve-d")))
  (add-to-list 'eglot-server-programs '((php-mode php-ts-mode web-mode) .
					("intelephense" "--stdio"
					 :initializationOptions (:globalStoragePath "~/.tmp"))))
  (add-to-list 'eglot-server-programs '(flix-mode . flix-mode-server-path))
  (add-to-list 'eglot-server-programs '(scala-ts-mode . ("metals")))
  (add-to-list 'eglot-server-programs '(c3-ts-mode . ("c3lsp")))
  (add-to-list 'eglot-server-programs '((elixir-mode elixir-ts-mode) . ("elixir-ls")))
  (add-to-list 'eglot-server-programs '(sml-mode . ("millet-ls")))
  (add-to-list 'eglot-server-programs '(vue-ts-mode . ("bunx" "vue-language-server" "--stdio")))
  (add-to-list 'eglot-server-programs '((svelte-mode svelte-ts-mode) . ("svelteserver" "--stdio")))
  (add-to-list 'eglot-server-programs '((haskell-mode haskell-ts-mode) . ("haskell-language-server-wrapper")))
  (add-to-list 'eglot-server-programs '((v-mode) . ("vls"))))

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

(use-package rust-mode
  :ensure t
  :init
  (setq rust-mode-treesitter-derive t))

(use-package rustic
  :ensure t
  :after (rust-mode)
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

;; (use-package nix-mode
;;   :ensure t)

(use-package racket-mode
  :ensure t)

;; (use-package cmake-mode
;;   :ensure t)

(use-package geiser
  :ensure t
  :config
  (use-package geiser-guile
    :ensure t))

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

(use-package lsp-haskell
  :ensure t
  :config
   (setq lsp-haskell-server-path "haskell-language-server-wrapper")
   (setq lsp-haskell-server-args ())
   (setq lsp-log-io t))

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

(use-package company-dcd
  :ensure t)

(use-package d-mode
  :ensure t
  :config
  (require 'company-dcd)
  (add-hook 'd-mode-hook 'company-dcd-mode))

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
  :hook ((web-mode tsx-ts-mode) . emmet-mode))

(use-package scala-mode
  :ensure t 
  :interpreter ("scala" . scala-mode)
  :hook (scala-mode . tree-sitter-hl-mode))

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
  :ensure t
  :hook ((ruby-ts-mode . format-all-mode)
         (ruby-ts-mode . format-all-ensure-formatter)
	 (python-ts-mode . format-all-mode)
	 (python-ts-mode . format-all-ensure-formatter)
	 (typescript-ts-mode . format-all-mode)
	 (typescript-ts-mode . format-all-ensure-formatter)
	 (js-ts-mode . format-all-mode)
	 (js-ts-mode . format-all-ensure-formatter)
	 (tsx-ts-mode . format-all-mode)
	 (tsx-ts-mode . format-all-ensure-formatter))
  :config
  (setq format-all-formatters
	'(("Ruby" (standardrb))
	  ("Python" (ruff))
	  ("Typescript" (prettier))
	  ("Javascript" (prettier))))) 

;; (add-hook 'before-save-hook #'my/format-svelte-ts)

;; (use-package janet-mode
;;   :ensure t)

;; (use-package lua-mode
;;   :ensure t)

;; (use-package apheleia
;;   :ensure t
;;   :config
;;   (add-to-list 'apheleia-formatters
;;                '(standardrb . ("standardrb" "--fix" "--format" "quiet" "--stderr" filepath)))  
;;   (add-to-list 'apheleia-mode-alist '(ruby-mode . standardrb))
;;   (add-to-list 'apheleia-mode-alist '(ruby-ts-mode . standardrb)))

(use-package elixir-mode
  :ensure t)

(use-package zig-mode
  :ensure t)

(use-package php-mode
  :ensure t)

(use-package haskell-ts-mode
  :ensure t
  :custom
  (haskell-ts-font-lock-level 4)
  (haskell-ts-use-indent t)
  (haskell-ts-ghci "ghci"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(connection-local-criteria-alist
   '(((:application eshell) eshell-connection-default-profile)
     ((:application tramp :protocol "flatpak")
      tramp-container-connection-local-default-flatpak-profile)
     ((:application tramp :machine "localhost")
      tramp-connection-local-darwin-ps-profile)
     ((:application tramp :machine "R77-NB274.local")
      tramp-connection-local-darwin-ps-profile)
     ((:application tramp)
      tramp-connection-local-default-system-profile
      tramp-connection-local-default-shell-profile)))
 '(connection-local-profile-alist
   '((eshell-connection-default-profile (eshell-path-env-list))
     (tramp-container-connection-local-default-flatpak-profile
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
     ("gnu" . "https://elpa.gnu.org/packages/")
     ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
 '(package-selected-packages
   '(alchemist c3-mode cabal-mode cider company-dcd counsel d-mode dune
	       editorconfig eglot eglot-fsharp elixir-mode emmet-mode
	       ess flix-mode flycheck flymake-haskell-multi format-all
	       fsharp-mode geiser-guile haskell-mode haskell-ts-mode
	       jetbrains-darcula-theme js2-mode kotlin-ts-mode
	       lean4-mode lsp-haskell lsp-mode magit merlin-company
	       merlin-iedit multiple-cursors nasm-mode nix-mode
	       ocamlformat odin-mode php-mode projectile python-black
	       racket-mode rainbow-delimiters rainbow-identifiers
	       realgud-lldb reason-mode rustic s scala-mode
	       scala-ts-mode slime-company smartparens sml-mode
	       svelte-mode toml tree-sitter tree-sitter-langs
	       treesit-auto utop uv-mode v-mode vue-mode web-mode
	       xterm-color yaml-mode yasnippet-snippets zig-mode))
 '(package-vc-selected-packages
   '((lean4-mode :url
		 "https://github.com/leanprover-community/lean4-mode.git")))
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

(setq treesit-language-source-alist
      '((c3 "https://github.com/c3lang/tree-sitter-c3")
	(go "https://github.com/tree-sitter/tree-sitter-go")
	(php "https://github.com/tree-sitter/tree-sitter-php" "master" "php/src")
	(python "https://github.com/tree-sitter/tree-sitter-python")
	(javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
	(typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
	(tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
	(rust "https://github.com/tree-sitter/tree-sitter-rust" "v0.23.2")
	(zig "https://github.com/maxxnino/tree-sitter-zig")
	(julia "https://github.com/tree-sitter/tree-sitter-julia")
	(scala "https://github.com/tree-sitter/tree-sitter-scala")
	(cpp "https://github.com/tree-sitter/tree-sitter-cpp")
	(haskell "https://github.com/tree-sitter/tree-sitter-haskell")
	(c-sharp "https://github.com/tree-sitter/tree-sitter-c-sharp")
	(kotlin "https://github.com/fwcd/tree-sitter-kotlin")
	(c "https://github.com/tree-sitter/tree-sitter-c" "v0.23.2")
	(hare "https://git.sr.ht/~ecs/tree-sitter-hare")
	(odin "https://github.com/tree-sitter-grammars/tree-sitter-odin")
	(d "https://github.com/gdamore/tree-sitter-d")
	(gomod "https://github.com/camdencheek/tree-sitter-go-mod")
	(svelte "https://github.com/Himujjal/tree-sitter-svelte")
	(css "https://github.com/tree-sitter/tree-sitter-css")
	(json "https://github.com/tree-sitter/tree-sitter-json")
	(vue "https://github.com/ikatyang/tree-sitter-vue")
	(elixir "https://github.com/elixir-lang/tree-sitter-elixir")
	(cmake "https://github.com/uyha/tree-sitter-cmake")))

(add-to-list 'load-path "~/.emacs.d/c3-ts-mode")
(require 'c3-ts-mode)

(load "~/.emacs.d/odin-mode.el")
(require 'odin-mode)

(add-to-list 'load-path "~/.emacs.d/odin-ts-mode/")
(require 'odin-ts-mode)


(add-to-list 'load-path "~/.emacs.d/hare-ts-mode")
(require 'hare-ts-mode)

(use-package kotlin-ts-mode
  :ensure t)

(use-package scala-ts-mode
  :ensure t)

(use-package realgud-lldb
  :ensure t)

;; (add-to-list 'auto-mode-alist
;;              '("\\(\\.ii\\|\\.\\(CC?\\|HH?\\)\\|\\.[ch]\\(pp\\|xx\\|\\+\\+\\)\\|\\.\\(cc\\|hh\\)\\)\\'"
;;                . c++-ts-mode))
;; ;; optional
;; (add-hook 'c++-ts-mode-hook 'lsp-deferred)
;; (add-hook 'c++-ts-mode-hook #'highlight-indent-guides-mode)

(add-to-list 'major-mode-remap-alist '(c++-mode . c++-ts-mode))
(add-to-list 'major-mode-remap-alist '(c-mode . c-ts-mode))
(add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))
(add-to-list 'major-mode-remap-alist '(ruby-mode . ruby-ts-mode))
(add-to-list 'major-mode-remap-alist '(php-mode . php-ts-mode))
(add-to-list 'major-mode-remap-alist '(odin-mode . odin-ts-mode))
(add-to-list 'major-mode-remap-alist '(zig-mode . zig-ts-mode))
(add-to-list 'major-mode-remap-alist '(rust-mode . rust-ts-mode))

(add-to-list 'load-path "~/.emacs.d/svelte-ts-mode")
(require 'svelte-ts-mode)

(add-to-list 'load-path "~/.emacs.d/vue-ts-mode")
(require 'vue-ts-mode)

(use-package reason-mode
  :ensure t
  :mode ("\\.rei?\\'" . reason-mode))

(use-package lsp-mode
  :ensure t
  :hook ((lsp-mode . lsp-diagnostics-mode)
         (lsp-mode . lsp-enable-which-key-integration)
	 ((tsx-ts-mode
	   typescript-ts-mode
	   js-ts-mode) . lsp-deferred)))

(add-to-list 'load-path "~/.emacs.d/lsp-tailwindcss")

;; (use-package lsp-tailwindcss
;;   :after lsp-mode
;;   :custom
;;   (lsp-tailwindcss-add-on-mode t)
;;   (lsp-tailwindcss-skip-config-check t)
;;   (lsp-tailwindcss-server-path "tailwindcss-language-server")
;;   :init
;;   (add-hook 'before-save-hook 'lsp-tailwindcss-rustywind-before-save)
;;   :config
;;   (dolist (tw-major-mode
;;            '(css-mode
;;              css-ts-mode
;;              typescript-mode
;;              typescript-ts-mode
;;              tsx-ts-mode
;;              js2-mode
;;              js-ts-mode
;;              clojure-mode
;; 	     vue-ts-mode
;; 	     svelte-ts-mode))
;;     (add-to-list 'lsp-tailwindcss-major-modes tw-major-mode)))

(add-to-list 'load-path "~/.emacs.d/zig-ts-mode")
(require 'zig-ts-mode)

(use-package toml
  :ensure t)

;; (use-package flix-mode
;;   :mode "\\.flix\\'"
;;   :hook ((flix-mode . flix-mode-ensure))
;;   :commands flix-mode)

(use-package lean4-mode
  :commands lean4-mode
  :vc (:url "https://github.com/leanprover-community/lean4-mode.git"
	    :rev :last-release))

;; (use-package format-all
;;   :ensure t 
;;   :commands format-all-mode
;;   :hook (prog-mode . format-all-mode)
;;   :config
;;   (setq-default format-all-formatters
;;                 '(("C"     (astyle "--mode=c"))
;;                   ("Shell" (shfmt "-i" "4" "-ci")))))

(use-package alchemist
  :ensure t)

(use-package sml-mode
  :ensure t 
  :mode ("\\.\\(sml\\|sig\\)\\'" . sml-mode))

(use-package fsharp-mode
  :ensure t
  :defer t)

(use-package eglot-fsharp
  :ensure t
  :after fsharp-mode
  :config
  (setq eglot-fsharp-server-install-dir nil))

(use-package uv-mode
  :ensure t
  :hook (python-ts-mode . uv-mode-auto-activate-hook))

(use-package svelte-mode 
  :ensure t
  :mode ("\\.\\(svelte\\)\\'" . svelte-mode))

(use-package vue-mode 
  :ensure t)

(use-package ess
  :ensure t)

(use-package v-mode
  :ensure t
  :config
  :mode ("\\(\\.v?v\\|\\.vsh\\)$" . 'v-mode))
