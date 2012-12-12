class window.Board

  constructor: (@size) ->
    @cells = []

  build: ->
    for i in [0...(@size * @size)]
      newCell = new Cell(i, @nextCellState())
      newCell.connect(@cells[i-1])
      newCell.connect(@cells[i-@size+1])
      newCell.connect(@cells[i-@size])
      newCell.connect(@cells[i-@size-1])
      @cells.push(newCell)

  step: ->
    _.each(@cells, (cell) -> cell.calculateStep())
    _.each(@cells, (cell) -> cell.performStep())

  nextCellState: -> Math.random() > 0.5



