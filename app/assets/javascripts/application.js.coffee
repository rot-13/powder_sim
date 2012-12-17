#= require jquery
#= require underscore
#= require_tree .

$(document).ready ->
  window.board = new Board(70)
  window.board.build()

#  window.renderer = new DOMRenderer(board, 5)
  window.renderer = new CanvasRenderer(board, 5)

  window.start()

window.start = ->
  window.lastTime = new Date()
  window.requestAnimFrame(window.loop)

window.loop = ->
  window.renderer.render()
  window.board.step()

  window.trackFPS()

  window.requestAnimFrame(window.loop)

window.trackFPS = ->
  thisTime = new Date()
#  console.log(thisTime - window.lastTime)
  window.lastTime = thisTime


# fps counter.
# copy pixels (cache) vs draw rect.
# try double buffering?
# blurry render.
# canvas renderer - traverse only living cells.

# name space.
# game control.

# board should step by dt?
# update only live cells and their neighbours.