class window.Node

  constructor: (@id) ->
    @connectedTo = []

  connect: (node) ->
    return unless node?
    node.connectedTo.push(@)
    @connectedTo.push(node)