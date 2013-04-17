window.QUANTA = 0.015
class window.Cell

  constructor: ->
    @soil = 0 #if Math.random() > 0.5 then Math.random() else 0
    @water = 0 #if Math.random() > 0.5 then Math.random() else 0
    @plant = 0 #if Math.random() > 0.5 then Math.random() else 0
    @temp = undefined

  maxSoil: ->
    0.5

  stableSoil: ->
    0.49

  color: ->
    @rgbToHex(@soil * 255.0, @plant * 255.0, @water * 255.0)

  isFull: ->
    if (@soil || @water || @plant) then true else false

  componentToHex: (c) ->
    hex = parseInt(c.toString()).toString(16)
    if hex.length == 1 then "0" + hex else hex

  rgbToHex: (r, g, b) ->
    "#" + @componentToHex(r) + @componentToHex(g) + @componentToHex(b)


  step: ->
    @setAll(@temp)

  reset: ->
    @temp.setAll(@)

  setAll: (cell) ->
    @soil = cell.soil
    @water = cell.water
    @plant = cell.plant
