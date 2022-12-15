#lang racket

(require math/base)

(provide highest-calorie-sum elf-calories highest-x-calories)

(define (highest-calorie-sum seq current-sum highest-sum) (if
    (empty? seq)
    (max current-sum highest-sum)
    (let (
        [head (car seq)]
        [tail (cdr seq)]
    ) (cond
        [(and (not (non-empty-string? head)) (> current-sum highest-sum)) (highest-calorie-sum
            tail
            0
            current-sum)]
        [(not (non-empty-string? head)) (highest-calorie-sum
            tail
            0
            highest-sum)]
        [else (highest-calorie-sum
            tail
            (+ current-sum (string->number head))
            highest-sum)]))))

(define (elf-calories seq [acc '(0)]) (if
    (empty? seq)
    acc
    (let (
        [head (car seq)]
        [current-calories (car acc)]
        [other-calories (cdr acc)]
        [tail (cdr seq)]
    ) (cond
        [(non-empty-string? head) (elf-calories tail
                                                (cons (+ current-calories
                                                           (string->number head))
                                                        other-calories))]
        [else (elf-calories tail (append '(0) `(,current-calories) other-calories))]))))

(define (highest-x-calories seq x) (sum (take (elf-calories seq) x)))
