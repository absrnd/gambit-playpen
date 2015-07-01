;; colours.scm - playing with ANSI color codes
;;

(define (set-bgd! color)
  "set the background colour (0-7) using ANSI codes"
  (begin
    (display "\x1b[")
    (display (number->string (+ 40 color)))
    (display "m")))

(define (reset-ANSI)
  "reset the ANSI terminal codes to default values"
  (display "\x1b[0m"))


(define (square color)
  "display an ANSI (0-7) coloured space character."
  (begin
    (set-bgd! color)
    (display " ")))

(define (row row-list)
  "display a row of coloured squares from list of 0-7 values"
  (begin
    (for-each square row-list)
    (reset-ANSI)
    (display "\n")))

(define (rand-row length)
  "create a row-list of length >0 containing random colours"
  (if (< length 1)
      '()
      (cons (random-integer 8)
	    (rand-row (- length 1)))))

(define (display-pattern size)
  "output a random colour checker pattern of given size"
  (let loop ((i 0))
    (row (rand-row size))
    (if (< i size)
	(loop (+ i 1)))))
