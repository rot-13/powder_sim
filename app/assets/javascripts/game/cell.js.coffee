class window.Cell extends Node

  constructor: (@id, size, @type) ->
    @i = Math.floor(@id / size)
    @j = id % size

    @connectedTo =
      top: null
      bottom: null
      left: null
      right: null
      topLeft: null
      topRight: null
      bottomLeft: null
      bottomRight: null

  connect: (node, direction) ->
    return false unless node?
    node.connectedTo[Opposites[direction]] = @
    @connectedTo[direction] = node

  calculateStep: -> null

  performStep: ->
    @type = @futureType

  @initialType: -> null