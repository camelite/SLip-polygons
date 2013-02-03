(setf pi 3.14159)
(setf tau (* 2 pi))
 
(defun fraction-to-radians (fraction) (* fraction tau))
(defun fraction-to-degrees (fraction) (* fraction 360))
(defun cosf (fraction) (cos (fraction-to-radians fraction)))
(defun sinf (fraction) (sin (fraction-to-radians fraction)))
(defun rightf (fraction) (right (fraction-to-degrees fraction)))
(defun leftf (fraction) (left (fraction-to-degrees fraction)))

(defun pentagon-arc-length (n r)
  (* (sqrt 2)
     r
     (sqrt (- 1 (cosf (/ 1 n))))))
 
(defun perpendicular-distance-to-pentagon-centre (n r)
  (* r (cosf (/ 1 (* 2 n)))))

 
(defun polygon (n r)
  (let ((l (pentagon-arc-length n r))
        (d (perpendicular-distance-to-pentagon-centre n r)))
    (without-pen
      (rightf (/ (- n 2) (* n 4)))
      (backward r)
      (leftf (/ (- n 2) (* n 4))))
    (dotimes (i n)
      (forward l)
      (rightf (/ 1 n)))
    (without-pen
      (rightf (/ (- n 2) (* n 4)))
      (forward r)
      (leftf (/ (- n 2) (* n 4))))))

(defun poly-circle-recursive (n r)
          (if (> r 30) (progn (polygon n r)
                              (polygon 100 (perpendicular-distance-to-pentagon-centre n r))
                              (poly-circle-recursive n (perpendicular-distance-to-pentagon-centre n r)))))
(defun poly-recursive (n r)
          (if (> r 10) (progn (polygon n r)
                              (rightf (/ 1 (* 2 n)))
                              (poly-recursive n (perpendicular-distance-to-pentagon-centre n r)))))

(setf pi 3.14159)
(setf tau (* 2 pi))
 
(defun fraction-to-radians (fraction) (* fraction tau))
(defun fraction-to-degrees (fraction) (* fraction 360))
(defun cosf (fraction) (cos (fraction-to-radians fraction)))
(defun sinf (fraction) (sin (fraction-to-radians fraction)))
(defun rightf (fraction) (right (fraction-to-degrees fraction)))
(defun leftf (fraction) (left (fraction-to-degrees fraction)))

(defun pentagon-arc-length (n r)
  (* (sqrt 2)
     r
     (sqrt (- 1 (cosf (/ 1 n))))))
 
(defun perpendicular-distance-to-pentagon-centre (n r)
  (* r (cosf (/ 1 (* 2 n)))))

 
(defun polygon (n r)
  (let ((l (pentagon-arc-length n r))
        (d (perpendicular-distance-to-pentagon-centre n r)))
    (without-pen
      (rightf (/ (- n 2) (* n 4)))
      (backward r)
      (leftf (/ (- n 2) (* n 4))))
    (dotimes (i n)
      (forward l)
      (rightf (/ 1 n)))
    (without-pen
      (rightf (/ (- n 2) (* n 4)))
      (forward r)
      (leftf (/ (- n 2) (* n 4))))))

(defun poly-circle-recursive (n r)
          (if (> r 30) (progn (polygon n r)
                              (polygon 100 (perpendicular-distance-to-pentagon-centre n r))
                              (poly-circle-recursive n (perpendicular-distance-to-pentagon-centre n r)))))

(defun pie (n) ((progn (forward 50)
                       (rightf (/ 1 4))
                       (dotimes (i (/ 360 n))
                       (rightf (/ 1 360))
                       (forward (* 50
                                   (/ tau n)
                                   (/ 1 (/ 360 n)))))
                       (rightf (/ 1 4))
                       (forward 50)
                       (rightf (/ 1 (* 2 n))))))

(defun slice (n) ((progn (forward 50)
                         (rightf (/ 1 4))
                         (dotimes (i (/ 360 n))
                         (rightf (/ 1 360))
                         (forward (* 50
                                     (/ tau n)
                                     (/ 1 (/ 360 n)))))
                         (rightf (/ 1 4))
                         (forward 50)
                         (rightf (/ 1 (* 2 n))))))

