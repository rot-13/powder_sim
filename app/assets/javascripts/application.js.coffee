#= require jquery
#= require underscore
#= require_tree .

$(document).ready ->
  app = new Application(boardSize: 150, cellSize: 3, desiredFPS: 60)
  app.run()

class window.Application

  constructor: (@options) ->
    @board = new Board(size: options.boardSize)
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
        for i in [0..1]
          @board.step()
        nextGameTick += skipTicks
        loops++

      @renderer.draw()
      window.requestAnimFrame(loopFunction, @renderer.canvas)
    )

    window.requestAnimFrame(loopFunction, @renderer.canvas)