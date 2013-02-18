(defun-js %add-div (id style)
  "var newDiv = document.createElement('div');
   newDiv.setAttribute('id', id);
   newDiv.setAttribute('style', style);
   document.getElementsByTagName('body')[0].appendChild(newDiv);")

(defun-js %set-div-text (div_id text)
  "document.getElementById(div_id).innerText = text")


(defun js-style-string (left% top%)
  (strcat "position: absolute; " "left: " left% "%;" " top: " top% "%;"))

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
    //console.log(CurX + ', ' + CurY);
}

init_listener();")

(defun-js %getMouseXY ()
  "return [CurX, CurY];")

(defun mouseXY ()
  (as-list (%getMouseXY)))

(defun-js %consolelog (msg)
  "console.log(msg);")

(defun check-if-mouse-in-box (mxy)
  (if (< (car mxy) 100)
      (if (< (cadr mxy) 100)
          (console.log "You're in my box!!!"))))

(console.log (mousexy))
(check-if-mouse-in-box (mousexy))
