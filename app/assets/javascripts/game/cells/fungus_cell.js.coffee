class window.FungusCell extends window.Cell

  @defaultType: 'plant'

  calculateStep: ->
    pressure = _.select(@connectedTo, (cells) -> cells.type).length
    if pressure == 3
      @futureType = @constructor.defaultType
    else if pressure <= 1 or pressure > 3
      @futureType = null

  @initialType: ->
    if Math.random() > 0.5 then @type = @defaultType else null