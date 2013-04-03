#= require jquery
#= require underscore
#= require_tree .

$(document).ready ->
  app = new Application(cellType: GoLCell, boardSize: 90, cellSize: 4, desiredFPS: 10)
  app.run()

class window.Application

  constructor: (@options) ->
    @board = new Board(size: options.boardSize, cellType: options.cellType)
    @board.build()
    @renderer = new Renderer(@board, options.cellSize)

  run: ->
    loops = 0
    skipTicks = 1000 / @options.desiredFPS
    maxFrameSkip = 10
    nextGameTick = new Date().getTime()

    loopFunction = (=>
      loops = 0
      while (new Date().getTime() > nextGameTick) and (loops < maxFrameSkip)
        @board.step()
        nextGameTick += skipTicks
        loops++

      @renderer.draw()
      window.requestAnimFrame(loopFunction, @renderer.canvas)
    )

    window.requestAnimFrame(loopFunction, @renderer.canvas)