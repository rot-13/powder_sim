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
    ctx = @ctx[@BOARD]
    ctx.clearRect(0, 0, @boardSize, @boardSize);
    ctx.fillStyle = 'yellow'
    for index in [0...@board.cells.length]
      @renderCellAt(ctx, index) if @board.cells[index].alive

  renderCellAt: (ctx, index) ->
    x = Math.floor(index / @board.size) * @cellSize
    y = (index % @board.size) * @cellSize
    ctx.fillRect(x, y, @cellSize, @cellSize)


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
