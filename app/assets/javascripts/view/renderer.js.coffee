class window.Renderer

  constructor: (@board, @cellSize) ->
    @totalSize = @board.size * @board.size
    @cells = new Array(@totalSize)
    @build()

  build: ->

  render: ->
