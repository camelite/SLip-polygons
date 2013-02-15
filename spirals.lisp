(defun-js %add-div (id style)
  "var newDiv = document.createElement('div');
   newDiv.setAttribute('id', id);
   newDiv.setAttribute('style', style);
   document.getElementsByTagName('body')[0].appendChild(newDiv);")

(defun-js %set-div-text (div-id text)
  "document.getElementById(div-id).innerText = text")


(defun js-style-string (left% top%)
  (strcat "position: absolute; " "left: " left% "%;" " top: " top% "%;"))

(defun sum-to-n (n)
  (* (/ 2)
     (* n (+ n 1))))

(defun inverse-sum-to-n (k)
  (* (/ 2)
     (- (sqrt (+ 1 (* 8 k)))
        1)))

(defun integer-p (number)
  (if (= 0
         (mod number 1))
      t nil))



(defun nillify-if-not-integer (num) (if (integer-p num) num nil))

(remove nil (map #'nillify-if-not-integer (inverse-sum-list 10)))

(defun pair-input-output (fn input) ())

(defun-js pow (x y)
  "return Math.pow(x,y)")

(defun pair-input-output (fn input)
  (mapcar #'list input (map (lambda (elm) (funcall fn elm)) input)))

(defun reversed-list-of-integers (n) (cons n (if (> n 1)
                                             (reversed-list-of-integers (- n 1)) '())))

(defun list-of-integers (n) (reverse (reversed-list-of-integers n)))

(defun filter-car-by-cadar (lst) (cons (if (integer-p (cadar lst)) (car lst))
                                               (if (not (atom (cdr lst)))
                                                   (filter-car-by-cadar (cdr lst)))))

(defun kn-integer-pairs (n)
  (remove nil (filter-car-by-cadar (pair-input-output #'inverse-sum-to-n
                                                      (list-of-integers n)))))

(defun nth (n lst) (car (nthcdr n lst)))

(defun spiral (n k d)
  (dotimes (i k)
    (dotimes (i n)
      (forward d)
      (rightf (/ (+ i 1) (sum-to-n n))))))

(defun spiral (n k d)
  (dotimes (i (* k (sum-to-n n)))
    (forward d)
    (rightf)))

(clear)


(progn (clear)
       (spiral cnt 8 1)
       (setf cnt (+ cnt 1)))

(defun n-ito-k (k)
  (* (/ 2)
     (- (sqrt (+ 1 (* 8 k))) 1)))

(defun k-ito-n (n)
  (/ (* (+ n 1) n)
     2))
     
(defun nth-part-of-k (nth n-tot)
  (/ nth (k-ito-n n-tot)))

(defun spiral (n fofc d)
  (dotimes (i (k-ito-n n))
    (forward d)
    (rightf (* 2
               fofc
               (/ i (k-ito-n n))))))

(progn (clear)
       (dotimes (i 5) (spiral 35 (/ 4 5) 3)))
(spiral 35 (/ 4 5) 3)
(clear)


(defun full-spiral (n fofc d)
   (clear)
   (dotimes (i (/ 1 (mod fofc 1)))
     (spiral n fofc d)))
