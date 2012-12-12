class window.Node

  constructor: ->
    @connectedTo = []

  connect: (node) ->
    return unless node?
    node.connectedTo.push(@)
    @connectedTo.push(node)