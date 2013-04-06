class window.Entity

  constructor: (@type, @pos = new Vec(0,0), @vel = new Vec(0,0)) ->
    @color = @type

  step: ->
    @pos.add(@vel)