;;; fish-theme.el --- A custom theme called fish -*- lexical-binding: t; -*-
;;; Commentary:
;; A dark, neon-accented theme created from your face specifications.

;;; Code:
(deftheme fish "A neon-dark theme inspired by your custom settings.")

(custom-theme-set-faces
 'fish
 ;; Base
 '(default ((t (:foreground "#FFFFFF" :background "#000000"))))
 '(cursor ((t (:background "#e500ff"))))
 '(fringe ((t (:background "#000000"))))
 '(mode-line ((t (:foreground "#cfcfcf" :background "#282828"))))
 '(region ((t (:background "#bd2f54"))))
 '(secondary-selection ((t (:background "#3e3834"))))

 ;; Syntax
 '(font-lock-builtin-face ((t (:foreground "#7fd7ea"))))
 '(font-lock-comment-face ((t (:foreground "#6d98ec"))))
 '(font-lock-function-name-face ((t (:foreground "#ea54d2"))))
 '(font-lock-keyword-face ((t (:foreground "#cea4ff"))))
 '(font-lock-string-face ((t (:foreground "#6fddcf"))))
 '(font-lock-type-face ((t (:foreground "#d3869b"))))
 '(font-lock-constant-face ((t (:foreground "#d3869b"))))
 '(font-lock-variable-name-face ((t (:foreground "#83a598"))))

 ;; Misc
 '(ansi-color-blue ((t (:foreground "deep sky blue" :background "black"))))
 '(minibuffer-prompt ((t (:foreground "#ffffff" :background "#000000" :bold t))))
 '(font-lock-warning-face ((t (:foreground "red" :bold t))))

 ;; Flymake
 '(flymake-error ((t (:underline (:style wave :color "red")))))
 '(flymake-warning ((t (:underline (:style wave :color "orange")))))
 '(flymake-note ((t (:underline (:style wave :color "green")))))

 ;; LSP semantic highlighting
 '(lsp-face-semhl-error ((t (:underline (:style wave :color "red")))))
 '(lsp-face-semhl-warning ((t (:underline (:style wave :color "orange")))))
 '(lsp-face-semhl-information ((t (:underline (:style wave :color "green")))))
)

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-directory load-file-name)))

(provide-theme 'fish)
;;; fish-theme.el ends here
