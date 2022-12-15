#lang racket

(module+ test
  (require rackunit rackunit/text-ui)
  (define example-lines (file->lines "data/example"))

  (define test
    (test-suite "testing"
      (test-eq? "test" "test" "test")))

  (begin (run-test test)))
