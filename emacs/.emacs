;; Add MELPA repository if not already added
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;;config

(global-display-line-numbers-mode 1)

(menu-bar-mode -1)

(setq-default line-spacing 0.4)

(tool-bar-mode -1)

(scroll-bar-mode -1)

(global-set-key (kbd "C-x t") #'lsp-clangd-find-other-file)

;; Install lsp-mode if not already installed
(unless (package-installed-p 'lsp-mode)
  (package-refresh-contents)
  (package-install 'lsp-mode))

(unless (package-installed-p 'centered-cursor-mode)
  (package-refresh-contents)
  (package-install 'centered-cursor-mode))

;; Install lsp-ui for better UI features
(unless (package-installed-p 'lsp-ui)
  (package-refresh-contents)
  (package-install 'lsp-ui))

;; pdf me to death
(unless (package-installed-p 'pdf-tools)
  (package-refresh-contents)
  (package-install 'pdf-tools))

(pdf-tools-install)

;; Install orgmode
(unless (package-installed-p 'org)
  (package-install 'org))

;; Install company-mode for autocompletion
(unless (package-installed-p 'company)
  (package-refresh-contents)
  (package-install 'company))

;; Enable lsp-mode for C++ files
(add-hook 'c++-mode-hook #'lsp)
(add-hook 'c-mode-hook #'lsp)

(add-hook 'lsp-mode-hook 'lsp-ui-mode)

(add-hook 'lsp-mode-hook 'company-mode)

(setq org-file-apps
      '((auto-mode . emacs)
        ("\\.pdf\\'" . "evince %s")
        ("\\.x?html?\\'" . "firefox %s")))  

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e68e3e9e25753d18ee87743b315538b7c5dd3299319fea1eb1c3d4d588fa6a71"
     "1952e0d6376807f78ffc6f17bb0aa2a21029a1f83414d47791b03997c8e538f1"
     default))
 '(package-selected-packages '(company fish-theme lsp-mode lsp-ui)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Create the new autosave directory if it doesn't exist
(unless (file-exists-p "~/autosave/")
  (make-directory "~/autosave/"))

;; Set the autosave directory
(setq auto-save-file-name-transforms
      `((".*" "~/autosave/" t)))

;; keybinds

(defun my-lsp-mode-setup ()
  (define-key lsp-mode-map (kbd "C-x C-a") 'lsp-signature-help)
  (define-key lsp-mode-map (kbd "C-x C-d") 'lsp-describe-session))

(add-hook 'lsp-mode-hook 'my-lsp-mode-setup)

;; STYLING : warning very long: dont bother scrolling down, all important config above :3

;;; fish-theme.el --- fish
;;; Version: 1.0
;;; Commentary:
;;; A theme called fish
;;; Code:

(deftheme fish "DOCSTRING for fish")
  (custom-theme-set-faces 'fish
   '(default ((t (:foreground "#FFFFFF" :background "#000000" ))))
   '(cursor ((t (:background "#e500ff" ))))
   '(fringe ((t (:background "#000000" ))))
   '(mode-line ((t (:foreground "#282828" :background "#b9a4c3" ))))
   '(region ((t (:background "#bd2f54" ))))
   '(secondary-selection ((t (:background "#3e3834" ))))
   '(font-lock-builtin-face ((t (:foreground "#7fd7ea" ))))
   '(font-lock-comment-face ((t (:foreground "#6d98ec" ))))
   '(font-lock-function-name-face ((t (:foreground "#ea54d2" ))))
   '(font-lock-keyword-face ((t (:foreground "#cea4ff" ))))
   '(font-lock-string-face ((t (:foreground "#6fddcf" ))))
   '(font-lock-type-face ((t (:foreground "#d3869b" ))))
   '(font-lock-constant-face ((t (:foreground "#d3869b" ))))
   '(ansi-color-blue ((t (:foreground "deep sky blue" :background "black"))))
   '(font-lock-variable-name-face ((t (:foreground "#83a598" ))))
   '(minibuffer-prompt ((t (:foreground "#f279f4" :bold t ))))
   '(font-lock-warning-face ((t (:foreground "red" :bold t ))))
   )

;;;###autoload
(and load-file-name
    (boundp 'custom-theme-load-path)
    (add-to-list 'custom-theme-load-path
                 (file-name-as-directory
                  (file-name-directory load-file-name))))
;; Automatically add this theme to the load path

(provide-theme 'fish)

(enable-theme 'fish)
;;; fish-theme.el ends here
