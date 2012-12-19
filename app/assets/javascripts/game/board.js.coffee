class window.Board

  constructor: (@size, @stepEvery) ->
    @accumulator = 0
    @cells = []
    @alive = []

  build: ->
    for i in [0...(@size * @size)]
      newCell = new Cell(i, @size, @nextCellState())

      top   = i < @size
      left  = i % @size == 0
      right = i % @size == @size - 1

      newCell.connect(@cells[i-1]) unless left
      unless top
        newCell.connect(@cells[i-@size+1]) unless right
        newCell.connect(@cells[i-@size])
        newCell.connect(@cells[i-@size-1]) unless left
      @cells.push(newCell)

  step: (dt) ->
    @accumulator += dt
    while @accumulator > @stepEvery
      @alive = []
      @cells.forEach((cell) -> cell.calculateStep())
      @cells.forEach((cell) => @alive.push(cell) if cell.performStep())
      @accumulator -= @stepEvery

  nextCellState: -> Math.random() > 0.5



