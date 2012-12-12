class window.Board

  constructor: (@size) ->
    @cells = []

  build: ->
    for i in [0...(@size * @size)]
      newCell = new Cell(i, @nextCellState())

      top   = i < @size
      left  = i % @size == 0
      right = i % @size == @size - 1

      newCell.connect(@cells[i-1]) unless left
      unless top
        newCell.connect(@cells[i-@size+1]) unless right
        newCell.connect(@cells[i-@size])
        newCell.connect(@cells[i-@size-1]) unless left
      @cells.push(newCell)

  step: ->
    _.each(@cells, (cell) -> cell.calculateStep())
    _.each(@cells, (cell) -> cell.performStep())

  nextCellState: -> Math.random() > 0.5



