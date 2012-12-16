#= require jquery
#= require underscore
#= require_tree .

$(document).ready ->
  window.board = new Board(70)
  window.board.build()

  window.renderer = new DOMRenderer(board, 5)

  window.start()

window.start = ->
  window.lastTime = new Date()
  window.requestAnimFrame(window.loop)

window.loop = ->
  window.renderer.render()
  window.board.step()

  thisTime = new Date()
  console.log(thisTime - window.lastTime)
  window.lastTime = thisTime

  window.requestAnimFrame(window.loop)

# board should step by dt?
# update only live cells and their neighbours.