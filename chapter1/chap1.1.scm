; SICP - Chapter 1.1 - The Elements of Programming



; 1.1.1  Expressions


(+ 137 349)

(- 1000 334)

(* 5 99)

(/ 10 5)

(+ 2.7 10)

(+ 21 35 12 7)

(* 25 4 12)

(+ (* 3 5) (- 10 6))

(+ (* 3
      (+ (* 2 4)
         (+ 3 5)))
   (+ (- 10 7)
      6))



; 1.1.2  Naming and the Environment


(define size 2)

(* 5 size)

(define pi 3.14159)

(define radius 10)

(* pi (* radius radius))

(define circumference (* 2 pi radius))



; 1.1.3  Evaluating Combinations

(* (+ 2 (* 4 6))
   (+ 3 5 7))



; 1.1.4  Compound Procedures

;(define (<name> <formal parameters>) <body>)

(define (square x) (* x x))

(square 21)

(square (+ 2 5))

(square (square 3))


(define (sum-of-squares x y)
  (+ (square x) (square y)))

(sum-of-squares 3 4)

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))

(f 5)



; 1.1.6  Conditional Expressions and Predicates


(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))


(define (abs x)
  (cond ((< x 0) (- x))
        (else x)))


(define (abs x)
  (if (< x 0)
      (- x)
      x))





; EXERCISE 1.1


(+ 5 3 4)		; 12

(- 9 1)			; 8

(/ 6 2)			; 3

(+ (* 2 4) (- 4 6))		; 6

(define a 3)			; a = 3

(define b (+ a 1))	 	; b = 4

(+ a b (* a b))			; 19	

(= a b)					; #f

(if (and (> b a) (< b (* a b)))		; 4
    b
    a)

(cond ((= a 4) 6)					; 16
      ((= b 4) (+ 6 7 a))
      (else 25))

(+ 2 (if (> b a) b a))				; 6

(* (cond ((> a b) a)				; 16
         ((< a b) b)
         (else -1))
   (+ a 1))




; EXERCISE 1.2


( / 
	(+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
	(* 3 (- 6 2) (- 2 7))
)



; EXERCISE 1.3

(define (square x) (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))


(define (greater x y) 
	(if (> x y) x y))


(define (sqsum-of-three a b c)
	(if (= a (greater a b))
		(sum-of-squares a (greater b c))
		(sum-of-squares b (greater a c))
	)
)


; EXERCISE 1.4

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; if b is positive we would perfom normal addition
; but is b is negative we would subtract it from a which would result in addition instead.



;Exercise 1.5

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))


; normal-order evaluation

; expressions are plugged in, condition evaluates to 0 so answer is 0


; applicative-order evaluation - applies procedures then proceeds to compare

; (test 0 (p)) becomes
; (if (= x 0) 0 (p))
; the procedure p keeps calling itself and we got the good old infinite loop 



;1.1.7  Example: Square Roots by Newton's Method


(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))


(define (improve guess x)
  (average guess (/ x guess)))


(define (average x y)
  (/ (+ x y) 2))


(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))


(define (sqrt x)
  (sqrt-iter 1.0 x))




; EXERCISE 1.6


(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))


; Applicative-order strikes again as the new-if procedure first evaluates 
; all its parametric expressions and improve again gives us sqrt-iter
; causing the infinite loop



; EXERCISE 1.7

(define (sqrt-iter guess x change)
  (if (good-enough? change)
      guess
      (sqrt-iter (improve guess x)
                 x
                 (abs (- guess (improve guess x))))))


(define (improve guess x)
  (average guess (/ x guess)))


(define (average x y)
  (/ (+ x y) 2))


(define (good-enough? change)
  (< change 0.001))


(define (sqrt x)
  (sqrt-iter 1.0 x 1.0))


 
; EXERCISE 1.8


(define (cube-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-iter (improve guess x)
                 x)))


(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (square x) (* x x)) 

(define (cube x) (* x x x))

(define (average x y)
  (/ (+ x y) 2))


(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))


(define (cubert x)
  (cube-iter 1.0 x))




; 1.1.8  Procedures as Black-Box Abstractions


; normal 

(define (sqrt x)
  (sqrt-iter 1.0 x))
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (improve guess x)
  (average guess (/ x guess)))



; internal definitions - block structure

(define (sqrt x)
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess x)
    (average guess (/ x guess)))
  (define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))
  (sqrt-iter 1.0 x))


; lexical scoping

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))






; THE END of chapter 1.1 -------------------------------------------------------------------