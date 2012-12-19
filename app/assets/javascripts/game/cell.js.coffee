#= require ./node

class window.Cell extends Node

  constructor: (id, size, @alive) ->
    super(id, size)

  calculateStep: ->
    pressure = _.select(@connectedTo, (cells) -> cells.alive).length
    if pressure == 3
      @willBeAlive = true
    else if pressure <= 1 or pressure > 3
      @willBeAlive = false

  performStep: ->
    @alive = @willBeAlive



