;; colours.scm - playing with ANSI color codes
;;

;; set the background colour (0-7) using ANSI codes
(define (set-bgd! color)
  (begin
    (display "\x1b[")
    (display (number->string (+ 40 color)))
    (display "m")))

;; reset the ANSI terminal codes to default values
(define (reset-ANSI)
  (display "\x1b[0m"))

;; display an ANSI (0-7) coloured space character.
(define (square color)
  (begin
    (set-bgd! color)
    (display " ")))

;; display a row of coloured squares from list of 0-7 values
(define (row row-list)
  (begin
    (for-each square row-list)
    (reset-ANSI)
    (display "\n")))

;; -----------------------------------------------------------
;; display a generic sprite (a list of lists)
(define (display-sprite sprite)
  (for-each row sprite))

;; -----------------------------------------------------------
;; test sprite which is not even rectangular!
(define sprite '((1 2 3) (4 5 6 4) (1 2 3 4 5)))

;; 8x8 checkerboard
(define checkerboard '((0 7 0 7 0 7 0 7)
		       (7 0 7 0 7 0 7 0)
		       (0 7 0 7 0 7 0 7)
		       (7 0 7 0 7 0 7 0)
		       (0 7 0 7 0 7 0 7)
		       (7 0 7 0 7 0 7 0)
		       (0 7 0 7 0 7 0 7)
		       (7 0 7 0 7 0 7 0)))

;; -----------------------------------------------------------
;; create a row-list of length >0 containing random colours
(define (rand-row length)
  (if (< length 1)
      '()
      (cons (random-integer 8)
	    (rand-row (- length 1)))))

;; output a random colour checker pattern of given size
(define (display-pattern size)
  (let loop ((i 0))
    (row (rand-row size))
    (if (< i size)
	(loop (+ i 1)))))
;; -----------------------------------------------------------

