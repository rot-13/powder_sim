#= require ./renderer

class window.CanvasRenderer extends window.Renderer

  CANVAS: 'canvas'
  BUFFER: 'buffer'
  CACHE:  'cache'

  build: ->
    @ctx = {}

    $('body').append(@boardTemplate(@CANVAS))
    @ctx[@CANVAS] = $(CANVAS).getContext("2d");

    ## see if works with dom fragment.

  render: ->

  ## TEMPLATES
  boardTemplate: (id) ->
    @_boardTemplate ||= "<canvas id='#{id}' width='#{@canvasSize()}' height='#{@canvasSize()}'</div>"

  ## HELPERS
  canvasSize: ->
    @_canvasSize ||= @cellSize * @board.size
