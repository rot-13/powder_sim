#= require ./renderer

class window.CanvasRenderer extends window.Renderer

  BOARD:  'board'

  build: ->
    @setContext(@BOARD,  @boardSize, true)

  render: ->
    ctx = @ctx
    ctx.clearRect(0, 0, @boardSize, @boardSize);
    ctx.fillStyle = 'yellow'
    for cell in @board.alive
      @renderCell(ctx, cell)

  renderCell: (ctx, cell) ->
    x = cell.i * @cellSize
    y = cell.j * @cellSize
    ctx.fillRect(x, y, @cellSize, @cellSize)


  ## BUILD
  setContext: (id, size) ->
    template = "<canvas id='#{id}' width='#{size}' height='#{size}'></canvas>"
    $('body').append(template)
    @ctx = document.getElementById(id).getContext("2d");
