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

    if bottomType == null or bottomType == 'water'
      @futureType = null
    else if bottomType == 'stone'
      @futureType = 'water'

  _calculateEmpty: ->
    topType = @connectedTo['top']?.type

    if topType == 'water'
      @futureType = 'water'


  @initialType: ->
    random = Math.floor(Math.random() * 100)

    if random < 25
      @type = 'stone'
    else if random < 45
      @type = 'water'
    else
      @type = null

