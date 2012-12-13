class window.Renderer

  constructor: (@board, @cellSize) ->
    @cells = new Array(@board.size * @board.size)
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
    _.each(@board.cells, (cell) =>
      @cells[cell.id].toggleClass('alive', cell.alive)
    )
    @board.step()
    window.requestAnimFrame(=> @render())

  ## TEMPLATES
  boardTemplate: ->
    @_boardTemplate ||= "<div class='board'></div>"

  rowTemplate: ->
    @_rowTemplate ||= "<div class='row' style='height: #{@cellSize}px'></div>"

  cellTemplate: ->
    @_cellTemplate ||= "<div class='cell' style='display: inline-block; width: #{@cellSize}px; height: #{@cellSize}px'></div>"
