class window.GoLCell extends window.Cell

  defaultType: 'stone'

  calculateStep: ->
    pressure = @pressure()
    if pressure == 3
      @futureType = @defaultType
    else if pressure <= 1 or pressure > 3
      @futureType = null

  initialType: ->
    if Math.random() > 0.5 then return @defaultType else return null