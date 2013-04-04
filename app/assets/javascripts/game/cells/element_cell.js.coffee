class window.ElementCell extends window.Cell

  calculateStep: ->
    switch @type
      when 'stone' then @_calculateStone()
      when 'water' then @_calculateWater()
      else @_calculateEmpty()

  _calculateStone: ->
    @futureType = @type

  _calculateWater: ->
    bottomType = @connectedTo['bottom']?.type
    leftType = @connectedTo['left']?.type
    rightType = @connectedTo['right']?.type

    if bottomType is null or bottomType is 'water'
      @futureType = null
    else if bottomType is 'stone'
      @futureType = 'water'

  _calculateEmpty: ->
    topType = @connectedTo['top']?.type
    leftType = @connectedTo['left']?.type
    rightType = @connectedTo['right']?.type
    bottomLeftType = @connectedTo['bottomLeft']?.type
    bottomRightType = @connectedTo['bottomRight']?.type

    if topType is 'water'
      @futureType = 'water'

#    if leftType is 'water' and bottomLeftType is 'stone'
#      @futureType = 'water'

#    if rightType is 'water' and bottomRightType is 'stone'
#      @futureType = 'water'


  initialType: ->
    pressure = @pressure()
    random = Math.floor(Math.random() * 100) / (pressure + 1)

    if random < 17
      @type = 'stone'
    else
#      @type = 'water'

