class window.CanvasRenderer

  BOARD: 'board'

  constructor: (@board, @cellSize) ->
    @boardSize = @cellSize * @board.size
    @build()

  build: ->
    @setContext(@BOARD,  @boardSize, true)
    @ctx.fillStyle = 'gray'

  draw: ->
    ctx = @ctx
    ctx.save()
    for cell in @board.alive
      @renderCell(ctx, cell)
    ctx.restore()

  renderCell: (ctx, cell) ->
    x = cell.i * @cellSize
    y = cell.j * @cellSize
    ctx.fillRect(x, y, @cellSize, @cellSize)


  ## BUILD
  setContext: (id, size) ->
    template = "<canvas id='#{id}' width='#{size}' height='#{size}'></canvas>"
    $('body').append(template)
    @canvas = document.getElementById(id)
    @ctx    = @canvas.getContext("2d")
