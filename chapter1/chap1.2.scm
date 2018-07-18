; SICP - Chapter 1.2 - Procedures and the Processes They Generate

; ******************************************************************


; 1.2.1  Linear Recursion and Iteration

(define (factorial n)			; linear recursive process way
	if (= n 1) 
	1 
	(* n (factorial (- n 1)))
)



(define (factorial n)			; linear iterative process way
	(fact-iter 1 1 n)
)

(define (fact-iter product counter max-count)
	if (> counter max-count)
	product
	(fact-iter (* product counter) (+ counter 1) max-count)
)


; Note: both are recursive procedures




; Exercise 1.9

(define (inc x) (+ x 1))

(define (dec x) (- x 1))


; procedure 1

(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

; (+ 4 5)
; (inc (+ (dec 4) 5))
; (inc (+ 3 5))
; (inc (inc (+ (dec 3) 5)))
; (inc (inc (+ 2 5)))
; (inc (inc (inc (+ (dec 2) 5))))
; (inc (inc (inc (+ 1 5))))
; (inc (inc (inc (inc (+ (dec 1) 5)))))
; (inc (inc (inc (inc (+ 0 5)))))		; since a = 0
; (inc (inc (inc (inc 5))))
; (inc (inc (inc 6)))
; (inc (inc 7))
; (inc 8)
; 9

; So this is a recursive process


; procedure 2

(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

; (+ 4 5)
; (+ (dec 4) (inc 5))
; (+ 3 6)
; (+ (dec 3) (inc 6))
; (+ 2 7)
; (+ (dec 2) (inc 7))
; (+ 1 8)
; (+ (dec 1) (inc 8))
; (+ 0 9)				; since a = 0
; 9


; Definitely iterative



; Exercise 1.10 - Ackermann's function    O.o

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))


; Question 1
; (A 1 10)
; (A 0 (A 1 9))	 
; (A 0 (A 0 (A 1 8)))
; (A 0 (A 0 (A 0 (A 1 7))))
; (A 0 (A 0 (A 0 (A 0 (A 1 6)))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 4)))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2)))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8)))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 16))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 32)))))
; (A 0 (A 0 (A 0 (A 0 64))))
; (A 0 (A 0 (A 0 128)))
; (A 0 (A 0 256))
; (A 0 512)
; 1024								; oh boy



; Question 2
; (A 2 4)
; (A 1 (A 2 3))
; (A 1 (A 1 (A 2 2)))
; (A 1 (A 1 (A 1 (A 2 1))))
; (A 1 (A 1 (A 1 2)))
; (A 1 (A 1 (A 0 (A 1 1))))
; (A 1 (A 1 (A 0 2)))
; (A 1 (A 1 4))
; (A 1 (A 0 (A 1 3)))
; (A 1 (A 0 (A 0 (A 1 2))))
; (A 1 (A 0 (A 0 (A 0 (A 1 1)))))
; (A 1 (A 0 (A 0 (A 0 2))))
; (A 1 (A 0 (A 0 4)))
; (A 1 (A 0 8))
; (A 1 16)		; you thought it was over eh ;)
; (A 0 (A 1 15))
; (A 0 (A 0 (A 1 14)))
; (A 0 (A 0 (A 0 (A 1 13))))
; (A 0 (A 0 (A 0 (A 0 (A 1 12)))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 11))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 10)))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 9))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 8)))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 7))))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 6)))))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5))))))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 4)))))))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3))))))))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2)))))))))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8)))))))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 16))))))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 32)))))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 64))))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 128)))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 256))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 512)))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 1024))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 2048)))))
; (A 0 (A 0 (A 0 (A 0 4096))))
; (A 0 (A 0 (A 0 8192))
; (A 0 (A 0 16384))
; (A 0 32768)
; 65536					


; Question 3
; (A 3 3)
; (A 2 (A 3 2))
; (A 2 (A 2 (A 3 1)))
; (A 2 (A 2 2))
; (A 2 (A 1 (A 2 1)))
; (A 2 (A 1 2))
; (A 2 (A 0 (A 1 1)))
; (A 2 (A 0 2))
; (A 2 4)					; we just evaluated this above, not gonna do again
; 65536




; Question 4

(define (f n) (A 0 n))
; for any value n we give it, since x = 0 we will get 2 * y
; therefore (f n) computes 2*n


; Question 5

(define (g n) (A 1 n))
; as see in question 1 above,
; (g n) computes 2^n


; Question 6

(define (h n) (A 2 n))
; (h n) computes 2^2^2....(n-1) times


;Question 7

(define (k n) (* 5 n n))
; answer given (k n) computes 5*n^2


; ******************************************************************


; 1.2.2  Tree Recursion


; Fibonacci numbers

; recursive
(define (fib n)
	(cond ((= n 0) 0)
		  ((= n 1) 1)
		  (else (+ (fib (- n 1)) 
		  		   (fib (- n 2))))))

;iterative
(define (fib n) (fib-iter 1 0 n))

(define (fib-iter a b count)
	if (= count 0)
	b
	(fib-iter (+ a b) (a) (- count 1)))



; Example: Counting change

(define (count-change amount)
	(cc amount 5))

(define (cc amount kinds-of-coins)
	(cond ((= amount 0) 1)
		  ((or (< amount 0) (= kinds-of-coins 0)) 0)
		  (else (+ (cc amount (- kinds-of-coins 1))
		  		   (cc (- amount (first-denomination kinds-of-coins)) kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
	(cond ((= kinds-of-coins 1) 1)
		  ((= kinds-of-coins 2) 5)
		  ((= kinds-of-coins 3) 10)
		  ((= kinds-of-coins 4) 25)
		  ((= kinds-of-coins 5) 50)))


; to change a dollar
(count-change 100)
; 292



; Exercise 1.11 

; recursive solution

(define (f-recursive n)
	(if (< n 3)
		n
		(+ (f-recursive (- n 1))
		   (* 2 (f-recursive (- n 2)))
		   (* 3 (f-recursive (- n 3)))
		)))


; iterative solution

(define (f-iterative n) 
   (define (f-iter a b c n) 
     ;; a = f(n - 1), b = f(n - 2), c = f(n - 3). 
     ;; return a + 2b + 3c 
     (if (< n 3) 
         a 
         (f-iter (+ a (* 2 b) (* 3 c)) a b (- n 1)))) 
   (if (< n 3) 
       n 
       (f-iter 2 1 0 n))) 



; Exercise 1.12

; Pascal's triangle

(define (pt row col)			; row and col begin at 1
	(cond ((= row col) 1)
		  ((= col 1) 1)
		  (else (+ (pt (- row 1) (- col 1))
		  		   (pt (- row 1) col)))
	)
)



; Exercise 1.13
; Question - Prove that Fib(n) is the closest integer to 𝜙ⁿ/√5, 
; where 𝜙 = (1 + √5)/2. 
; Hint: Let 𝜓 = (1 - √5)/2. 
; Use induction and the definition of the Fibonacci numbers 
; to prove that Fib(n) = (𝜙ⁿ - 𝜓ⁿ)/√5.

;  Seriously? :(
; Let's try...


; As stated previously in text, 𝜙² = 𝜙 + 1 => 𝜙 = 1 + 𝜙⁻¹  ----- a
; Similarly, 					𝜓² = 𝜓 + 1 => 𝜓 = 1 + 𝜓⁻¹  ----- b

; Base Cases : 
; Fib(0) = 0 and (𝜙⁰ - 𝜓⁰)/√5 = (1 - 1)/√5 = 0 
; Fib(1) = 1 and (𝜙¹ - 𝜓¹)/√5 = (1 + √5 - 1 + √5)/2√5 = 2√5/2√5 = 1


; Now assuming Fib(n) = (𝜙ⁿ - 𝜓ⁿ)/√5 for all natural n.

; Therefore Fib(n+1) = (𝜙ⁿ⁺¹ - 𝜓ⁿ⁺¹)/√5.

; As we know, Fib(n+1) = Fib(n) + Fib(n-1)

; Now Fib(n) + Fib(n-1) = (𝜙ⁿ - 𝜓ⁿ)/√5 + (𝜙ⁿ⁻¹ - 𝜓ⁿ⁻¹)/√5
; 						= (𝜙ⁿ⁺¹(𝜙⁻¹ + 𝜙⁻²) + 𝜓ⁿ⁺¹(𝜓⁻¹ + 𝜓⁻²))/√5
; 						= (𝜙ⁿ⁺¹ * 𝜙⁻¹ * (1 + 𝜙⁻¹) + 𝜓ⁿ⁺¹ * 𝜓⁻¹ * (1 + 𝜓⁻¹))/√5 ---c
; 						= (𝜙ⁿ⁺¹  + 𝜓ⁿ⁺¹)/√5     (using a and b on c)
;						= Fib(n+1)

; 	Hence proved that Fib(n) = (𝜙ⁿ - 𝜓ⁿ)/√5			; I was able to prove till here, but going ahead had to use google
; 					  Fib(n) = 𝜙ⁿ/√5 - 𝜓ⁿ/√5 or
;	     	          Fib(n) - 𝜙ⁿ/√5 =  - 𝜓ⁿ/√5

; Now, Fib(n) is the closest integer to 𝜙ⁿ/√5 is true if difference is small

; 	ψ = -0.618304...
; and since n >= 0 and ψ < 1 therefore we know that ψⁿ ≤ 1

; and therefore,   Fib(n) is the closest integer to φⁿ/√5. 


; That was actually nice.



; ******************************************************************


; 1.2.3  Orders of Growth


;Exercise 1.14

; Order of growth of space varies linearly and is theta(n).
; Order of growth of steps for (cc n k) is theta(n^k).


; Exercise 1.15

; sin x = x if x < 0.1 radians

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
   (if (not (> (abs angle) 0.1))
       angle
       (p (sine (/ angle 3.0)))))

; Part a:
; (sine 12.15)
; (p (sine 4.05))
; (p (p (sin 1.35)))
; (p (p (p (sin 0.45))))
; (p (p (p (p (sin 0.15)))))
; (p (p (p (p (p (sin 0.05))))))
; (p (p (p (p (p 0.05)))))
; which on evaluation gives -.39980345741334
; THEREFORE p is applied 5 times


; Part b:
; After some reading on the internet, I have realised that steps and spaceboth remain same 
; if we triple the size of input, since we can divide the inputs by 3, 
; The complexity of both the space and the number of steps required 
; by this procedure can be described as O(log n), or more precisely
; O(log n) with base 3. O is theta by the way.



; ******************************************************************

; 1.2.4  Exponentiation


; linear recursive 				requires O(n) in space and steps
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))


; linear iterative 				requires O(1) in space and O(n) in steps
(define (expt b n)
  (expt-iter b n 1))

(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (expt-iter b
                (- counter 1)
                (* b product)))) 


; successive squaring 			requires O(log n) of base 2 in both space and steps
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))



; Exercise 1.16	               requires O(log n) in steps and O(1) in space

(define (even? n)
   (= (remainder n 2) 0))

(define (square x)
   (* x x))

(define (fast-iter b n a)
   (cond ((= n 0) a)
         ((even? n) (fast-iter (square b) (/ n 2) a))
         (else (fast-iter  b (- n 1) (* a b)))))

(define (fast-exp b n)
   (fast-iter b n 1))



;Exercise 1.17				  

(define (* a b)					; requires O(n) in steps and space
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))


; todo							; multiplication by halving and doubling

(define (double x) (* x 2))		
(define (halve x) (/ x 2))

(define (even? n)
  (= (remainder n 2) 0))


(define (fast-mult a b)			; now uses O(log n) space and steps
	(cond ((= b 0) 0)
		  ((even? b) (double (fast-mult a (halve b))))
		  (else (+ a (fast-mult a (- b 1))))
	)
)



; Exercise 1.18


(define (double x) (* x 2))			
(define (halve x) (/ x 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-mult a b)				; uses O(log n) in steps and O(1) in space
	(define (fast-iter a b prod)
		(cond ((= b 0) prod)
			  ((even? b) (fast-iter (double a) (halve b) prod))
			  (else (fast-iter a (- b 1) (+ prod a)))
		)
	)

	(fast-iter a b 0)
)




; Exercise 1.19

; Fibonacci in logarithmic no. of steps

(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))      ; compute p'
                   (+ (* 2 p q) (* q q))      ; compute q'
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))


; ******************************************************************


; 1.2.5  Greatest Common Divisors

; Euclid's Algorithm

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))


; Exercise 1.20

; While calculating, (gcd 206 40) using normal-order evaluation
; remainder is calculated 18 times
; opposed to 4 times in applicative-order evaluation


; ******************************************************************

; 1.2.6  Example: Testing for Primality


(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)				; steps have order of growth O(root n)
	(= n (smallest-divisor n)))



; The Fermat test 

(define (expmod base exp m)		; to calculate modulo of (base^exp)/m
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))  


(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))


(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))



; Exercise 1.21

(smallest-divisor 199)	  ; 199
(smallest-divisor 1999)   ; 1999
(smallest-divisor 19999)  ; 7


; Exercise 1.22

; due to increased speed of machines today, the runtime shows valuable results
; on inputs greater than 10^6 only.

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))



(define (search-for-primes start end)
   (if (even? start)
       (search-for-primes (+ start 1) end)
       (cond ((< start end) (timed-prime-test start)
                            (search-for-primes (+ start 2) end)))))


; 3 smallest primes after 1000 -> 1009, 1013, 1019
; 3 smallest primes after 10000 -> 10007, 10009, 10037
; 3 smallest primes after 100000 -> 100003, 100019, 100043
; 3 smallest primes after 1000000 -> 1000003, 1000033, 1000039




; Exercise 1.23

(define (next n) 
	(if (= n 2) 3 (+ n 2)))

; redefining smallest-divisor
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (divides? a b)
  (= (remainder b a) 0))

; For two specific cases,
; the times improved from 0.39 to 0.23
; 				and from 0.45 to 0.23
; This new definition does not become twice as fast because,
; while using the next procedure, an extra if is evaluated.



; Exercise 1.24

; Upon using fast-prime? for the same two cases above,
; times I got were 0.02 and 0.04 which is due to the
; O(log n) speed of fast-prime? and for large data sets,
; this time does not change much




; Exercise 1.25

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

; This runs slower than our previous expmod and the answer lies n footnote 46.
; The reduction steps in the cases where the exponent e is greater than 1 
; are based on the fact that, for any integers x, y, and m, 
; we can find the remainder of x times y modulo m 
; by computing separately the remainders of x modulo m and y modulo m, 
; multiplying these, and then taking the remainder of the result modulo m. 
; For instance, in the case where e is even, 
; we compute the remainder of b^(e/2) modulo m, square this, 
; and take the remainder modulo m. 
; This technique is useful because it means we can perform our computation 
; without ever having to deal with numbers much larger than m. 



; Exercise 1.26

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

; Our procedure was O(log n) because we divided the exp at each step by 2
; and then later square up the results, so the process was log n of base 2.

; But in this new procedure, instead of squaring when we multiply, 
; we evaluate expmod twice with halved exponents 
; which results back in O(n) complexity.



; Exercise 1.27

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))  



(define (fermat-test n a)
    (= (expmod a n n) a))


(define (carmichael-test n)
	(define (iter a)
		(cond ((= a 1) #t)
			  ((not (fermat-test n a)) #f)
			  (else (iter (- a 1)))))	
	(iter ( - n 1)))

; 561, 1105, 1729, 2465, 2821, and 6601 all test true and are Carmichael numbers




; Exercise 1.28


(define (even? n)
  (= (remainder n 2) 0))

(define (square x) (* x x))


(define (expmod base exp m)		
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square-check (expmod base (/ exp 2) m) m)
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))  


(define (square-check x m)
  (if (and (not (or (= x 1) (= x (- m 1))))
           (= (remainder (* x x) m) 1))
      0
      (remainder (* x x) m)))


(define (miller-rabin-test n)
  (define (try-it a)
     (= (expmod a (- n 1) n) 1))
  (try-it (+ 2 (random-integer (- n 2)))))




; END OF CHAPTER 1.2 ********************************************
