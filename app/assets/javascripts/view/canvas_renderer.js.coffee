#= require ./renderer

class window.CanvasRenderer extends window.Renderer

  BOARD:  'board'

  build: ->
    @setContext(@BOARD,  @boardSize, true)
    @ctx.fillStyle = 'gray'
    @counter = 0

  render: ->
    ctx = @ctx
    ctx.save()
    window.stackBlur(ctx, @boardSize, @boardSize, 1)
    for cell in @board.alive
      @renderCell(ctx, cell)
    ctx.restore()
    @counter += 1

  renderCell: (ctx, cell) ->
    x = cell.i * @cellSize
    y = cell.j * @cellSize
    ctx.fillRect(x, y, @cellSize, @cellSize)


  ## BUILD
  setContext: (id, size) ->
    template = "<canvas id='#{id}' width='#{size}' height='#{size}'></canvas>"
    $('body').append(template)
    @ctx = document.getElementById(id).getContext("2d");
