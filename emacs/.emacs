;; Add MELPA repository if not already added
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;;styling

(load-theme 'wombat t)

(global-display-line-numbers-mode 1)

(menu-bar-mode -1)

(tool-bar-mode -1)

(scroll-bar-mode -1)

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

;; Enable lsp-mode for C/C++ files
(add-hook 'c++-mode-hook #'lsp)
(add-hook 'c-mode-hook #'lsp)

(add-hook 'lsp-mode-hook 'lsp-ui-mode)

(add-hook 'lsp-mode-hook 'company-mode)

(setq org-file-apps
      '((auto-mode . emacs)
        ("\\.pdf\\'" . "evince %s")
        ("\\.x?html?\\'" . "firefox %s")))  

(custom-set-variables
 '(package-selected-packages '(company lsp-ui lsp-mode)))
(custom-set-faces)

;; keybinds

(defun my-lsp-mode-setup ()
  (define-key lsp-mode-map (kbd "C-x C-a") 'lsp-signature-help)
  (define-key lsp-mode-map (kbd "C-x C-d") 'lsp-describe-session))

(add-hook 'lsp-mode-hook 'my-lsp-mode-setup)
