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

(setf xy-global-multiplier 10)

(defun xy-square (w)
  (dotimes (i 4)
    (forward (* w xy-global-multiplier))
    (rightf (/ 4))))

(defun xy-rect (h w)
  (dotimes (i 2)
    (forward (* h xy-global-multiplier))
    (rightf (/ 4))
    (forward (* w xy-global-multiplier))
    (rightf (/ 4))))

(defun xy-axis ()
  (dotimes (i 2)
    (forward 200)
    (backward 400)
    (forward 200)
    (rightf (/ 4)))
    (rightf (/ 2)))

(defun shiftr (d)
  (without-pen
    (rightf (/ 4))
    (forward (* d xy-global-multiplier))
    (leftf (/ 4))))

(defun shiftl (d)
  (without-pen
    (leftf (/ 4))
    (forward (* d xy-global-multiplier))
    (rightf (/ 4))))

(defun xy-draw-f1 (a b)
  (set-color "black")
  (xy-square a)
  (xy-rect b a)
  (shiftr a)
  (xy-square b)
  (shiftl (/ a 2))
  (set-color "grey")
  (set-thickness (* a xy-global-multiplier))
  (forward (* b xy-global-multiplier))
  (backward (* b xy-global-multiplier))
  (set-color "black")
  (set-thickness 1)
  (shiftl (/ a 2)))

(setf iterator 0)

(defun test-one-more (a b db)
  (clear)
  (xy-draw-f1 a b)
  (setf iterator (+ b db))
  (%console-log (+ (* a a)
                   (- (* a b))
                   (* b b))))

(test-one-more 1 iterator (/ 1 20))

(hide-turtle)

(defun-js %console-log (string)
  "console.log(string);")

(defun-js %add-canvas-mouse-listener ()
  "function getMousePos(canvas, evt) {
        var rect = canvas.getBoundingClientRect();
        return {
          x: evt.clientX - rect.left,
          y: evt.clientY - rect.top
        };
      }

  var canvas = document.getElementById('thy-canvas');
  var context = canvas.getContext('2d');

  canvas.addEventListener('mousemove', function(evt) {
    var mousePos = getMousePos(canvas, evt);
    var message = 'Mouse position: ' + mousePos.x + ','
      + mousePos.y;
    console.log(message);
    console.log('Hello World')
  }, false);")

(defun-js %add-frame-mouse-listener ()
  "function init_listener() {
 if (window.Event) {
	document.captureEvents(Event.MOUSEMOVE);
	}
    document.onmousemove = getCursorXY;
}

function getCursorXY(e) {   
    CurX = (window.Event) ? e.pageX : event.clientX + (document.documentElement.scrollLeft ? document.documentElement.scrollLeft : document.body.scrollLeft);
    CurY = (window.Event) ? e.pageY : event.clientY + (document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop);
    CurX = CurX - 12;
    CurY = CurY - 12;
    writeMessage(newCanvas, CurX + ', ' + CurY);
    //console.log(CurX + ', ' + CurY);
}")
