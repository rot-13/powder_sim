#= require ./node

class window.Cell extends Node

  constructor: (id, size, @type) ->
    super(id, size)

  calculateStep: -> null

  performStep: ->
    @type = @futureType

  @initialType: -> null