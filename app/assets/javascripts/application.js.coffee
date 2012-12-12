#= require jquery
#= require underscore
#= require_tree .

$(document).ready ->
  window.board = new Board(50)
  window.board.build()

  window.renderer = new Renderer(board, 20)
  window.renderer.render()

  setInterval(window.step, 200)

window.step = ->
  window.board.step()
  window.renderer.render()