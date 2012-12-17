#= require ./renderer

class window.CanvasRenderer extends window.Renderer

  BOARD:  'board'
  BUFFER: 'buffer'
  CACHE:  'cache'

  ctx: {}

  build: ->
    @setContext(@BOARD,  @boardSize, true)
    @setContext(@BUFFER, @boardSize)
    @setContext(@CACHE,  @cellSize)
    @buildCache()

  render: ->

  ## BUILD
  setContext: (id, size, displayed = false) ->
    hiddenClass = if displayed then '' else 'hidden'
    template = "<canvas id='#{id}' class='#{hiddenClass}' width='#{size}' height='#{size}'></canvas>"
    $('body').append(template)
    @ctx[id] = document.getElementById(id).getContext("2d");

  buildCache: ->
    ctx = @ctx[@CACHE]
    ctx.fillStyle = 'yellow'
    ctx.fillRect(0, 0, @cellSize, @cellSize)
