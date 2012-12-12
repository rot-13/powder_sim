#= require jquery
#= require underscore
#= require_tree .

$(document).ready ->
  window.board = new Board(50)
  window.board.build()

  window.renderer = new Renderer(board, 10)
  window.renderer.render()

  setInterval(window.step, 100)

window.step = ->
  window.board.step()
  window.renderer.render()