#= require jquery
#= require underscore
#= require_tree .

$(document).ready ->
  app = new Application(boardSize: 100, cellSize: 4)
  app.run()

class window.Application

  constructor: (options) ->
    @board = new Board(options.boardSize)
    @board.build()
    @renderer = new CanvasRenderer(@board, options.cellSize)

  loop: ->
    @board.step()
    @renderer.draw()

  run: ->
    loopFunction = =>
      @loop()
      window.requestAnimFrame(loopFunction, @renderer.canvas)

    window.requestAnimFrame(loopFunction, @renderer.canvas)