;; -*- lexical-binding: t -*-

(prefer-coding-system 'utf-8-unix)

(setq auto-save-default nil)
(setq make-backup-files nil)
;; Do NOT load customizations. Move them
;; to another file though.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(setq-default indent-tabs-mode nil)
(setq-default require-final-newline t)
(setq-default show-trailing-whitespace t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-to-list 'default-frame-alist '(font . "JetBrains Mono-11"))
;; Emacs starts maximized as per the
;; early init, but set a fallback size.
(add-to-list 'default-frame-alist '(width . 80))
(add-to-list 'default-frame-alist '(height . 28))

(blink-cursor-mode -1)
(electric-pair-mode 1)

(global-display-line-numbers-mode 1)
(column-number-mode 1)

(require 'package)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t))

(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)
  :init
  (global-corfu-mode))

(use-package eglot
  :ensure nil)

(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
