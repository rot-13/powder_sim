class window.Cell extends Node

  constructor: (@id, size, @type) ->
    @i = Math.floor(@id / size)
    @j = id % size
    @connectedTo = []

  connect: (node) ->
    return false unless node?
    node.connectedTo.push(@)
    @connectedTo.push(node)

  calculateStep: -> null

  performStep: ->
    @type = @futureType

  @initialType: -> null