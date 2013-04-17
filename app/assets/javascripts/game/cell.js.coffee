class window.Cell extends Node

  constructor: (@id, size, @type) ->
    @i = Math.floor(@id / size)
    @j = id % size
    @connectedTo = []

  connect: (node) ->
    return false unless node?
    node.connectedTo.push(@)
    @connectedTo.push(node)

  calculateStep: ->
    @futureType = @type


  @initialType: ->
    if Math.random() > 0.5 then 'green' else null

  performStep: ->
    @type = @futureType

  color: ->
    return @type

