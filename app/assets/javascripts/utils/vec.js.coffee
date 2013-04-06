class window.Vec

  @Polar: (r, ang) ->
    x = r * Math.cos(ang)
    y = r * Math.sin(ang)
    new Vect(x, y)

  constructor: (@x, @y) ->

  add: (vec) ->
    @x += vec.x
    @y += vec.y

  isInsideRect: (rect) ->
    (rect.x0 <= @x < rect.x1) and (rect.y0 <= @y < rect.y1)

  toString: ->
    "#{@x}, #{@y}"