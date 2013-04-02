class window.Board

  constructor: (options) ->
    @size = options.size
    @cellType = options.cellType
    @cells = []
    @alive = []

  build: ->
    for i in [0...(@size * @size)]
      newCell = new @cellType(i, @size, @nextCellState())

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
    @alive = []
    for cell in @cells
      cell.calculateStep()
    for cell in @cells
      @alive.push(cell) if cell.performStep()

  nextCellState: -> Math.random() > 0.5



