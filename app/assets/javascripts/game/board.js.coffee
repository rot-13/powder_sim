class window.Board

  stepEvery: 50

  constructor: (@size) ->
    @accumulator = 0
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

  step: (dt) ->
    @accumulator += dt
    while @accumulator > @stepEvery
      @cells.forEach((cell) -> cell.calculateStep())
      @cells.forEach((cell) -> cell.performStep())
      @accumulator -= @stepEvery

  nextCellState: -> Math.random() > 0.5



