var newDiv = document.createElement('div')
newDiv.setAttribute('style', 'position:absolute; bottom: 0; right: 0')

var newCanvas = document.createElement('canvas')
newCanvas.setAttribute('id', 'myCanvas')
newCanvas.setAttribute('width', '300')
newCanvas.setAttribute('height', '100')
newCanvas.setAttribute('style', 'border: 1px solid #000000')

newDiv.appendChild(newCanvas)

document.getElementsByTagName('body')[0].appendChild(newDiv)
