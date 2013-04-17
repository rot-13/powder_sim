class window.Renderer

  BOARD: 'board'
  emptyColor: 'black'

  constructor: (@board, @cellSize) ->
    @boardSize = @cellSize * @board.size
    @build()

  build: ->
    @setContext(@BOARD,  @boardSize, true)

  draw: ->
    ctx = @ctx
    ctx.save()

    @ctx.fillStyle = @emptyColor
    ctx.fillRect(0, 0, @boardSize, @boardSize)

    for cell in @board.cells
      console.log(cell.type)
      @renderCell(ctx, cell) if cell.type

    ctx.restore()

  renderCell: (ctx, cell) ->
    x = cell.i * @cellSize
    y = cell.j * @cellSize

    @ctx.fillStyle = cell.color()
    ctx.fillRect(x, y, @cellSize, @cellSize)

  ## BUILD
  setContext: (id, size) ->
    template = "<canvas id='#{id}' width='#{size}' height='#{size}'></canvas>"
    $('body').append(template)
    @canvas = document.getElementById(id)
    @ctx    = @canvas.getContext("2d")