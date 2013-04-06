class window.Rect

  constructor: (@x0, @y0, @width, @height) ->
    @x1 = @x0 + @width
    @y1 = @y0 + @height
