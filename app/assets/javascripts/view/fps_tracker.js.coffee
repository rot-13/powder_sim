class window.FPSTracker

  constructor: (@refreshEvery) ->
    @accumulator = 0
    @tracker = $(@_template())
    $('body').append(@tracker)

  step: (dt) ->
    @accumulator += dt

    if @accumulator >= @refreshEvery
      @tracker.text((1000/dt).toFixed())
      @accumulator = 0

  _template: ->
    "<p class='fps'></p>"