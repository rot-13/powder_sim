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

    for i in [0...@board.size]
      for j in [0...@board.size]
        cell = @board.matrix[i][j]
        @renderCell(ctx, i, j, cell.color()) if cell.isFull()

    ctx.restore()

  renderCell: (ctx, i, j, color) ->
    x = i * @cellSize
    y = j * @cellSize

    @ctx.fillStyle = color
    ctx.fillRect(x, y, @cellSize, @cellSize)

  ## BUILD
  setContext: (id, size) ->
    template = "<canvas id='#{id}' width='#{size}' height='#{size}'></canvas>"
    $('body').append(template)
    @canvas = document.getElementById(id)
    @ctx    = @canvas.getContext("2d")