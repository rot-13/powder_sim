#= require ./node

class window.Cell extends Node

  constructor: (id, @alive) ->
    @cycles = 0
    super(id)

  calculateStep: ->
    pressure = _.count(@connectedTo, (cells) -> cells.alive)

    if pressure == 3
      @willBeAlive = true
    else if pressure <= 1 or pressure > 3
      @willBeAlive = false

  performStep: ->
    @alive = @willBeAlive
    @cycles++



