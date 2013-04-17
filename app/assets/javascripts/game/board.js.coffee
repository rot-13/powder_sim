class window.Board

  constructor: (options) ->
    @size = options.size
    @matrix = []

  build: ->
    for i in [0...@size]
      @matrix[i] = new Array(@size)

      for j in [0...@size]
        @matrix[i][j] = new Cell()
        @matrix[i][j].temp = new Cell()

  step: ->
    for i in [0...@size]
      for j in [0...@size]
        @matrix[i][j].reset()
    for i in [0...@size]
      for j in [0...@size]
        @calculateStep(i, j)
    for i in [0...@size]
      for j in [0...@size]
        @matrix[i][j].step()

    @matrix[Math.ceil(@size/2.0)][3].soil = 1

  calculateStep: (i, j) ->
    source = @matrix[i][j]
    target = source.temp
    ourSoil = source.soil
    if ourSoil > QUANTA
      below = @matrix[i][j+1]
      if below && below.soil < below.maxSoil()
        toTransfer = Math.min(QUANTA*10, target.soil)
        target.soil -= toTransfer
        @matrix[i][j+1].temp.soil += toTransfer
      else if source.soil > source.stableSoil()
        left = @matrix[i-1]?[j]
        right = @matrix[i+1]?[j]
        spillCell = if Math.random() > 0.5 then left else right
        spillCell = left if !right || right.soil >= right.maxSoil()
        spillCell = right if !left || left.soil >= left.maxSoil()
        if (spillCell && spillCell.soil < spillCell.maxSoil())
          target.soil -= QUANTA
          spillCell.temp.soil += QUANTA

