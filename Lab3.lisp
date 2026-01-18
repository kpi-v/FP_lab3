;1 task

(defun swap-adjacent (list)
  (cond
    ((null (cdr list)) list)
    ((> (car list) (cadr list))  
     (cons (cadr list) (swap-adjacent (cons (car list) (cddr list)))))
    (t
     (cons (car list) (swap-adjacent (cdr list))))))

(defun bubble-sort-functional (list)
  (let ((swapped-list (swap-adjacent list)))
    (if (equal swapped-list list)  
        list
      (bubble-sort-functional swapped-list))))



(defun run-bubble-sort-functional-tests ()
  (format t "Test 1: bubble-sort-functional ~%")
  (format t "~a~%" (equal (bubble-sort-functional '(4 2 5 1 3)) '(1 2 3 4 5)))
  (format t "Test 2: bubble-sort-functional ~%")
  (format t "~a~%" (equal (bubble-sort-functional '(1 2 3 4 5)) '(1 2 3 4 5)))
  (format t "Test 3: bubble-sort-functional (empty list) ~%")
  (format t "~a~%" (equal (bubble-sort-functional '()) '())))


(run-bubble-sort-functional-tests)


;2 task

(defun bubble-sort-imperative (lst)
  (copy-list lst)
  (dotimes (i (1- (length lst)))
    (dotimes (j (- (length lst) i 1))
      (let ((current (nth j lst))
            (next (nth (1+ j) lst)))
        (when (> current next)
          (setf (nth j lst) next)
          (setf (nth (1+ j) lst) current)))))
  lst)


(defun run-bubble-sort-imperative-tests ()
  (format t "Test 1: bubble-sort-imperative ~%")
  (format t "~a~%" (equal (bubble-sort-imperative '(4 2 5 1 3)) '(1 2 3 4 5)))
  (format t "Test 2: bubble-sort-imperative ~%")
  (format t "~a~%" (equal (bubble-sort-imperative '(1 2 3 4 5)) '(1 2 3 4 5)))
  (format t "Test 3: bubble-sort-imperative (empty list) ~%")
  (format t "~a~%" (equal (bubble-sort-imperative '()) '())))

(run-bubble-sort-imperative-tests)
