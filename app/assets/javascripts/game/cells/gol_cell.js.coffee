class window.GOLCell extends window.Cell

  calculateStep: ->
    pressure = _.select(@connectedTo, (cells) -> cells.alive).length
    if pressure == 3
      @willBeAlive = true
    else if pressure <= 1 or pressure > 3
      @willBeAlive = false

  performStep: ->
    @alive = @willBeAlive



