class window.Node

  constructor: (@id) ->
    @connectedTo = []

  connect: (node) ->
    return false unless node?
    node.connectedTo.push(@)
    @connectedTo.push(node)