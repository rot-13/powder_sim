#= require jquery
#= require underscore
#= require_tree .

$(document).ready ->
  window.board = new Board(75)
  window.board.build()

  window.renderer = new Renderer(board, 5)

  window.start()

window.start = ->
  window.renderer.render()