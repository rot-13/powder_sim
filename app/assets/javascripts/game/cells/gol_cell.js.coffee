class window.GoLCell extends window.Cell

  @defaultType: 'stone'

  calculateStep: ->
    pressure = 0
    _.each(_.values(@connectedTo), (value) -> if value?.type then pressure++)
    if pressure == 3
      @futureType = @constructor.defaultType
    else if pressure <= 1 or pressure > 3
      @futureType = null

  @initialType: ->
    if Math.random() > 0.5 then @type = @defaultType else null