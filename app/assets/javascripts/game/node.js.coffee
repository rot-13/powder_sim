class window.Node

  constructor: (@id, size) ->
    @i = Math.floor(@id / size)
    @j = id % size
    @connectedTo = []

  connect: (node) ->
    return false unless node?
    node.connectedTo.push(@)
    @connectedTo.push(node)