#= require jquery
#= require underscore
#= require_tree .

$(document).ready ->
  window.board = new Board(100)
  window.board.build()

  window.renderer = new Renderer(board, 3)
  window.renderer.render()

  setInterval(window.step, 20)

window.step = ->
  window.board.step()
  window.renderer.render()