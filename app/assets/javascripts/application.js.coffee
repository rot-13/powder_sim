#= require jquery
#= require underscore
#= require_tree .

$(document).ready ->
  console.log('ready')
  window.board = new Board(50)
  window.board.build()
