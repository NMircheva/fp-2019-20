

(load "../testing/check.scm")

(check (nth-column '((1)) 0) => '(1))
(check (nth-column '((1) (2)) 0) => '(1 2))
(check (nth-column '((1 2 3)) 0) => '(1))
(check (nth-column '((1 2 3)) 1) => '(2))
(check (nth-column '((1 2 3)) 2) => '(3))
(check (nth-column '((1 2 3) (4 5 6)) 0) => '(1 4))
(check (nth-column '((1 2 3) (4 5 6)) 1) => '(2 5))
(check (nth-column '((1 2 3) (4 5 6)) 2) => '(3 6))
(check (nth-column '((1 2 3) (4 5 6) (7 8 9)) 2) => '(3 6 9))
(check (nth-column '((1 2 3 4) (5 6 7 8)) 3) => '(4 8))

(check-report)
(check-reset!)