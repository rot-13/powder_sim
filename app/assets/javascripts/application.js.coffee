#= require jquery
#= require underscore
#= require_tree .

$(document).ready ->
  app = new Application(boardSize: 60, cellSize: 5, maxFPS: 100)
  app.start()


class window.Application

  constructor: (options) ->
    @board = new Board(options.boardSize, 1000/options.maxFPS)
    @board.build()

    @renderer   = new CanvasRenderer(@board, options.cellSize)
    @fpsTracker = new FPSTracker(100)

  start: ->
    @lastTime = new Date()
    window.requestAnimFrame(@loop)

  loop: =>
    thisTime = new Date()
    dt = thisTime - @lastTime
    @lastTime = thisTime

    @board.step(dt)
    @renderer.render()

    @fpsTracker.step(dt)

    window.requestAnimFrame(@loop)


# fix max fps and tracker.
# copy pixels (cache) vs draw rect.
# try double buffering?
# blurry render.
# update only live cells and their neighbours.