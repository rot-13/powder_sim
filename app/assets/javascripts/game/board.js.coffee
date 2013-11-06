class window.Board

  constructor: (options) ->
    @size = options.size
    @matrix = []
    window.emitterPosition = 0.5

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

    @matrix[Math.ceil(@size*window.emitterPosition)][3]["_#{window.emitterType}"] = 1 if window.emitterType

  calculateStep: (i, j) ->
    @calculate('soil', i, j)
    @calculateWater(i, j)
    @calculatePlant(i, j)

  calculate: (type, i, j) ->
    source = @matrix[i][j]
    target = source.temp
    ours = source.get(type)
    if ours > 0.0
      below = @matrix[i][j+1]
      if below && below.get(type) < below.max(type)
        toTransfer = Math.min(QUANTA*target.fallRate(type), target.get(type))
        target.transfer(type, -toTransfer)
        @matrix[i][j+1].temp.transfer(type, toTransfer)
      else if source.get(type) > source.stable(type)
        left = @matrix[i-1]?[j]
        right = @matrix[i+1]?[j]
        spillCell = if Math.random() > 0.5 then left else right
        spillCell = left if !right || right.get(type) >= right.max(type)
        spillCell = right if !left || left.get(type) >= left.max(type)
        if spillCell && spillCell.get(type) < spillCell.max(type)
          target.transfer(type, -QUANTA)
          spillCell.temp.transfer(type, QUANTA)

  calculateWater: (i, j) ->
    source = @matrix[i][j]
    target = source.temp
    ourWater = source.water
    if ourWater > 0.0
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

  calculatePlant: (i, j) ->
    source = @matrix[i][j]
    target = source.temp
    if target.plant < target.maxPlant()
      # spawn
      if 1.2 > target.water/target.soil > 0.8
        target.plant += QUANTA*2
        target.water -= QUANTA
        target.soil -= QUANTA

      # regenerate
      if target.plant > target.minPlant() && target.water > target.requiredWater()
        target.plant += QUANTA
        target.water -= QUANTA

      # reproduce
      if target.plant > target.stablePlant()
        possiblePlant = @matrix[i+target.getDirection()]?[j-1]
        if possiblePlant
          possiblePlant.temp.plant += QUANTA
          target.plant -= QUANTA
          if (Math.random() > 0.99)
            possiblePlant.temp.plantDirection = target.plantDirection

$(document).ready ->
  $('#soil').change( -> window.emitterType = 'soil')
  $('#water').change( -> window.emitterType = 'water')
  $('#range').change( -> window.emitterPosition = $('#range').val())