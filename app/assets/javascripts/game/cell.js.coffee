class window.Cell extends Node

  constructor: (@id, size) ->
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

  isEmpty: ->
    @type == null

  pressure: ->
    _.filter(_.values(@connectedTo), (value) -> value?.type).length

  initialType: -> null

  calculateInitialType: ->
    @type = @initialType()