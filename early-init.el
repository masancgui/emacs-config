;; -*- lexical-binding: t -*-

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Placed here so Emacs starts maximized
;; instead of resizing AFTER opening.
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Avoid initial white background while
;; the theme loads. Adjust as necessary.
(add-to-list 'default-frame-alist '(background-color . "#3F3F3F"))
(add-to-list 'default-frame-alist '(foreground-color . "#DCDCCC"))
