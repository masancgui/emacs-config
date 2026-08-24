;; -*- lexical-binding: t -*-

(prefer-coding-system 'utf-8-unix)

(setq auto-save-default nil)
(setq make-backup-files nil)

;; Move customizations to a temp file,
;; effectively disabling them.
(setq custom-file (make-temp-file "emacs-custom"))

;; Enable fuzzy completions too.
(setq completion-styles '(basic
                          partial-completion
                          emacs22
                          flex))

(setq-default indent-tabs-mode nil)
(setq-default require-final-newline t)

;; Only show trailing whitespace in
;; certain buffers.
(dolist (hook '(prog-mode-hook text-mode-hook))
  (add-hook hook (lambda () (setq show-trailing-whitespace t))))

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

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)
  (corfu-auto-prefix 2)
  (corfu-popupinfo-delay '(1.0 . 0.5))
  :init
  (global-corfu-mode)
  (corfu-popupinfo-mode))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

(use-package eglot
  :ensure nil
  :hook ((c-mode . eglot-ensure)
         (c++-mode . eglot-ensure)))
