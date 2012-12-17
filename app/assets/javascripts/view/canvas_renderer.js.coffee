#= require ./renderer

class window.CanvasRenderer extends window.Renderer

  BOARD:  'board'
  BUFFER: 'buffer'
  CACHE:  'cache'

  ctx: {}

  build: ->
    @setContext(@BOARD,  @boardSize, true)
    @setContext(@BUFFER, @boardSize)
    @setContext(@CACHE,  @cellSize)

  render: ->


  setContext: (id, size, displayed = false) ->
    displayedString = if displayed then 'block' else 'none'
    template = "<canvas id='#{id}' width='#{size}' height='#{size}' style='display:#{displayedString}'></canvas>"
    $('body').append(template)
    @ctx[id] = document.getElementById(id).getContext("2d");