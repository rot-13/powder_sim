#= require jquery
#= require underscore
#= require_tree .

$(document).ready ->
  window.board = new Board(100)
  window.board.build()

  window.renderer = new CanvasRenderer(board, 4)

  window.start()

window.start = ->
  window.lastTime = new Date()
  window.requestAnimFrame(window.loop)

window.loop = ->
  thisTime = new Date()
  dt = thisTime - window.lastTime
  window.lastTime = thisTime

  window.board.step(dt)
  window.renderer.render()

#  console.log(1000/dt)

  window.requestAnimFrame(window.loop)



# fps counter.
# copy pixels (cache) vs draw rect.
# try double buffering?
# blurry render.
# canvas renderer - traverse only living cells.

# name space.
# game control.

# board should step by dt?
# update only live cells and their neighbours.