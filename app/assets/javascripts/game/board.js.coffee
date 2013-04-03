class window.Board

  constructor: (options) ->
    @size = options.size
    @cellType = options.cellType
    @cells = []

  build: ->
    for i in [0...(@size * @size)]
      newCell = new @cellType(i, @size, @cellType.initialType())

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
    for cell in @cells
      cell.calculateStep()
    for cell in @cells
      cell.performStep()