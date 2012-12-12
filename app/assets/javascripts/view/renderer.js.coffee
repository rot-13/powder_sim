class window.Renderer

  constructor: (@board, @cellSize) ->
    $('body').append(@_boardTemplate())

    for i in [0...@board.size]
      $('.board').append(@_rowTemplate())
      for j in [0...@board.size]
        $('.row').last().append(@_cellTemplate(@board.cells[i * @board.size + j].id))

  render: ->
    _.each(@board.cells, (cell) ->
      $("#cell_#{cell.id}").css('background', if cell.alive then 'yellow' else 'black')
    )

  ## TEMPLATES
  _boardTemplate: ->
    "<div class='board'></div>"

  _rowTemplate: ->
    "<div class='row' style='height: #{@cellSize}px'></div>"

  _cellTemplate: (id) ->
    "<div class='cell' id='cell_#{id}' style='display: inline-block; width: #{@cellSize}px; height: #{@cellSize}px'></div>"
