
(use-package flycheck
  ;; Enable for only languages
  :init
  ;; (add-hook 'after-init-hook 'global-flycheck-mode)
  ;; (add-hook 'emacs-lisp-mode-hook 'flycheck-mode)
  (add-hook 'html-mode-hook 'flycheck-mode)
  (add-hook 'js2-mode-hook 'flycheck-mode)
  (add-hook 'js-mode-hook 'flycheck-mode)
  (add-hook 'web-mode-hook 'flycheck-mode)
  :config
  ;; support web-mode with PHP
  (flycheck-define-checker mix-php
    "A PHP syntax checker using the PHP command line interpreter.
    See URL `https://php.net/manual/en/features.commandline.php'."
    :command ("php" "-l" "-d" "error_reporting=E_ALL" "-d" "display_errors=1"
              "-d" "log_errors=0" source)
    :error-patterns
    ((error line-start (or "Parse" "Fatal" "syntax") " error" (any ":" ",") " "
            (message) " in " (file-name) " on line " line line-end))
    :modes (php-mode php+-mode web-mode))

  (add-to-list 'flycheck-checkers 'mix-php)
  )

(provide 'init-flycheck)
