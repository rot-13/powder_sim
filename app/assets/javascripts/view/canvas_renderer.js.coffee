class window.DOMRenderer

  constructor: (@board, @cellSize) ->
    @totalSize = @board.size * @board.size
    @cells = new Array(@totalSize)
    @build()

  build: ->
    $('body').append(@boardTemplate())

    for i in [0...@board.size]
      $('.board').append(@rowTemplate())
      for j in [0...@board.size]
        id = i * @board.size + j
        cell = $(@cellTemplate())
        @cells[id] = cell
        $('.row').last().append(cell)

  render: ->
    for i in [0...@totalSize]
      @cells[i].toggleClass('alive', @board.cells[i].alive)

  ## TEMPLATES
  boardTemplate: ->
    @_boardTemplate ||= "<div class='board'></div>"

  rowTemplate: ->
    @_rowTemplate ||= "<div class='row' style='height: #{@cellSize}px'></div>"

  cellTemplate: ->
    @_cellTemplate ||= "<div class='cell' style='display: inline-block; width: #{@cellSize}px; height: #{@cellSize}px'></div>"
