#= require ./renderer

class window.DOMRenderer extends window.Renderer

  build: ->
    @cells = new Array(@board.size * @board.size)
    $('body').append(@boardTemplate())
    for i in [0...@board.size]
      $('.board').append(@rowTemplate())
      for j in [0...@board.size]
        id = i * @board.size + j
        cell = $(@cellTemplate())
        @cells[id] = cell
        $('.row').last().append(cell)

  render: ->
    for i in [0...@cells.length]
      @cells[i].toggleClass('alive', @board.cells[i].alive)

  ## TEMPLATES
  boardTemplate: ->
    @_boardTemplate ||= "<div id='board' class='board' style='height:#{@boardSize}px; width:#{@boardSize}px'></div>"

  rowTemplate: ->
    @_rowTemplate ||= "<div class='row' style='height: #{@cellSize}px'></div>"

  cellTemplate: ->
    @_cellTemplate ||= "<div class='cell' style='width: #{@cellSize}px; height: #{@cellSize}px'></div>"
