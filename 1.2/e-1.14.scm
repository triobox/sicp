; Exercise 1.14.  Draw the tree illustrating the process generated by the count-change procedure of 
; section 1.2.2 in making change for 11 cents. What are the orders of growth of the space and number 
; of steps used by this process as the amount to be changed increases?

; As a reminder defined proceures
;
; (define (count-change amount)
;   (cc amount 5))
; (define (cc amount kinds-of-coins)
;   (cond ((= amount 0) 1)
;         ((or (< amount 0) (= kinds-of-coins 0)) 0)
;         (else (+ (cc amount
;                      (- kinds-of-coins 1))
;                  (cc (- amount
;                         (first-denomination kinds-of-coins))
;                      kinds-of-coins)))))
; (define (first-denomination kinds-of-coins)
;   (cond ((= kinds-of-coins 1) 1)
;         ((= kinds-of-coins 2) 5)
;         ((= kinds-of-coins 3) 10)
;         ((= kinds-of-coins 4) 25)
;         ((= kinds-of-coins 5) 50)))

; In applicative order of substitution part of the execution for the amount of 11 cents
; It is much better presented as graph.
;
; (cc 11 5)
; (+ (cc 11 4) (cc -39 5))
; (+ (+ (cc 11 3) (cc -14 4)) 0)
; (+ (+ (+ (cc 11 2) (cc 1 3)) 0) 0)
; (+ (+ (+ (+ (cc 11 1) (cc 6 2)) (+ (cc 1 2) (cc -9 3))) 0) 0)
; (+ (+ (+ (+ (+ (cc 11 0) (cc 10 1)) (+ (cc 6 1) (cc 1 2))) (+ (+ (cc 1 1) (cc -4 2)) 0)) 0) 0)
;
; This algorithm for solving Coins problem is greedy type.
;
; Orders of growth:
;   time: 
;     Time complexity can be derived by following reasoning which is explained here 
;     http://eli.thegreenplace.net/2007/06/28/sicp-section-123/
;
;     For 1 coin of value 1 cent it takes n steps to figure out that there is only one way to change them.
;
;     For 2 coins of {1, 5} cents we can use n/5 coins of 5 cents and fill the rest with 1 cent coins.
;     In average it will take n/5 steps to fill 5 coins and n/2 steps to fill 1 cent coins.
;     Therefore, for big n it takes O(n^2) order of growth
;
;     This way we can go and recursivelly iterate until any amount of coins and we will get that if 
;     there are 5 types of coins (as we have in our case) it will have order of growth of O(n^5) for
;     big values of n.
;
;
;   space: 
;       If we draw graphs of the calls for 11 and 22 cents, we can see that depth of graph is linearly
;       dependant on the size of the problem. So lets say order of growth in space is O(n)
