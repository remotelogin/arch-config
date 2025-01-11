(global-display-line-numbers-mode 1)

;; Add MELPA repository if not already added
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Install lsp-mode if not already installed
(unless (package-installed-p 'lsp-mode)
  (package-refresh-contents)
  (package-install 'lsp-mode))

(unless (package-installed-p 'centered-cursor-mode)
  (package-refresh-contents)
  (package-install 'centered-cursor-mode))

;; Install lsp-ui for better UI features (optional)
(unless (package-installed-p 'lsp-ui)
  (package-refresh-contents)
  (package-install 'lsp-ui))

;; Install company-mode for autocompletion (optional)
(unless (package-installed-p 'company)
  (package-refresh-contents)
  (package-install 'company))

;; Enable lsp-mode for C/C++ files
(add-hook 'c++-mode-hook #'lsp)
(add-hook 'c-mode-hook #'lsp)

;; Optional: Enable lsp-ui features
(add-hook 'lsp-mode-hook 'lsp-ui-mode)

;; Optional: Enable company-mode for autocompletion
(add-hook 'lsp-mode-hook 'company-mode)

;; Set the path to clangd if it's not in your PATH
;;(setq lsp-clangd-executable "/bin/clangd")  ;; Adjust this path if necessary
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(company lsp-ui lsp-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
