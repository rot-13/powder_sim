class window.CanvasRenderer

  BOARD: 'board'

  constructor: (@board, @cellSize) ->
    @boardSize = @cellSize * @board.size
    @build()

  build: ->
    @setContext(@BOARD,  @boardSize, true)

  draw: ->
    ctx = @ctx
    ctx.save()
    for cell in @board.cells
      @renderCell(ctx, cell)
    ctx.restore()

  renderCell: (ctx, cell) ->
    x = cell.i * @cellSize
    y = cell.j * @cellSize
    if cell.type
      @ctx.fillStyle = CellTypes[cell.type]
    else
      @ctx.fillStyle = 0x000
    ctx.fillRect(x, y, @cellSize, @cellSize)


  ## BUILD
  setContext: (id, size) ->
    template = "<canvas id='#{id}' width='#{size}' height='#{size}'></canvas>"
    $('body').append(template)
    @canvas = document.getElementById(id)
    @ctx    = @canvas.getContext("2d")
