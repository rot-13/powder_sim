class window.Renderer

  BOARD: 'board'
  emptyColor: 'black'

  constructor: (@board, @cellSize) ->
    @boardSize = @cellSize * @board.size
    @bounds = new Rect(0, 0, @board.size, @board.size)
    @build()

  build: ->
    @setContext(@BOARD,  @boardSize, true)

  draw: ->
    ctx = @ctx
    ctx.save()

    @ctx.fillStyle = @emptyColor
    ctx.fillRect(0, 0, @boardSize, @boardSize)

    for entity in @board.entities
      @renderEntity(ctx, entity)

    ctx.restore()

  renderEntity: (ctx, entity) ->
    if entity.pos.isInsideRect(@bounds)
      ctx.fillStyle = entity.color
      ctx.fillRect(entity.pos.x * @cellSize, entity.pos.y * @cellSize, @cellSize, @cellSize)

  ## BUILD
  setContext: (id, size) ->
    template = "<canvas id='#{id}' width='#{size}' height='#{size}'></canvas>"
    $('body').append(template)
    @canvas = document.getElementById(id)
    @ctx    = @canvas.getContext("2d")
