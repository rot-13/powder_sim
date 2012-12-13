#= require jquery
#= require underscore
#= require_tree .

$(document).ready ->
  window.board = new Board(100)
  window.board.build()

  window.renderer = new Renderer(board, 5)

  window.start()

window.start = ->
  window.requestAnimFrame(window.loop)

window.loop = ->
  window.renderer.render()
  window.board.step()
  window.requestAnimFrame(window.loop)

# board should step by dt?
# canvas.
# update only live cells and their neighbours.