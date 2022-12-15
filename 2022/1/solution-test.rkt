#lang racket

(require "solution1.rkt")

(module+ test
  (require rackunit rackunit/text-ui)
  (define example-lines (file->lines "data/example"))

  (define aoc-solution
    (test-suite "highest-calorie"
        (test-equal?
            "solution vs single value"
            (highest-calorie-sum '("100") 0 0)
            100)

        (test-equal?
            "solution vs multilist"
            (highest-calorie-sum '("100" "200") 0 0)
            300)

        (test-equal?
            "mulitple single value elves"
            (highest-calorie-sum '("100" "" "200") 0 0)
            200)
        (test-equal?
            "mulitple multi value elves"
            (highest-calorie-sum '("100" "200" "" "200" "50") 0 0)
            300)
        (test-equal?
            "mulitple uneven value elves"
            (highest-calorie-sum '("200" "" "200" "50") 0 0)
            250)
        (test-equal?
            "mulitple uneven value elves (reversed)"
            (highest-calorie-sum '("100" "50" "" "200") 0 0)
            200)
        (test-equal?
            "from examples file"
            (highest-calorie-sum example-lines 0 0)
            24000)))

  (define highest-x-calories-tests
    (test-suite "highest-x-calories"
      (test-equal?
        "when x is 1 it returns the highest sum"
        (highest-x-calories '("1" "" "2" "" "3") 1)
        3)
      (test-equal?
        "when x is greater than 1 it sums up the highest sum"
        (highest-x-calories '("1" "" "2" "" "3") 2)
        5)
      (test-equal?
        "when given the example file"
        (highest-x-calories example-lines 3)
        45000)))

    (begin
        (run-tests aoc-solution)
        (run-tests highest-x-calories-tests)))
