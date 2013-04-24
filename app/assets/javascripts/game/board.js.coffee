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

    @matrix[Math.ceil(@size/2.0)][3][window.emitterType] = 1 if window.emitterType

  calculateStep: (i, j) ->
    @calculateSoil(i, j)
    @calculateWater(i, j)

  calculateSoil: (i, j) ->
    source = @matrix[i][j]
    target = source.temp
    ourSoil = source.soil
    if ourSoil > QUANTA
      below = @matrix[i][j+1]
      if below && below.soil < below.maxSoil()
        toTransfer = Math.min(QUANTA*target.soilFallRate(), target.soil)
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

  calculateWater: (i, j) ->
    source = @matrix[i][j]
    target = source.temp
    ourWater = source.water
    if ourWater > QUANTA
      below = @matrix[i][j+1]
      if below && below.water < below.maxWater()
        toTransfer = Math.min(QUANTA*target.waterFallRate(), target.water)
        target.water -= toTransfer
        @matrix[i][j+1].temp.water += toTransfer
      else if source.water > source.stableWater()
        left = @matrix[i-1]?[j]
        right = @matrix[i+1]?[j]
        spillCell = if Math.random() > 0.5 then left else right
        spillCell = left if !right || right.water >= right.maxWater()
        spillCell = right if !left || left.water >= left.maxWater()
        if (spillCell && spillCell.water < spillCell.maxWater())
          toTransfer = Math.min(QUANTA*30, target.water)
          target.water -= toTransfer
          spillCell.temp.water += toTransfer

