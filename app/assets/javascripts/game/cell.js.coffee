window.QUANTA = 0.015
class window.Cell

  constructor: ->
    @soil = 0 #if Math.random() > 0.5 then Math.random() else 0
    @water = 0 #if Math.random() > 0.5 then Math.random() else 0
    @plant = 0 #if Math.random() > 0.5 then Math.random() else 0
    @temp = undefined

  maxSoil: ->
    @lerp(0.5, 0.8, @water)

  stableSoil: ->
    @lerp(0.5, 0.85, @water)

  soilFallRate: ->
    @lerp(10, 2, @water)

  maxWater: ->
    @lerp(0.5, 0.05, @soil)

  stableWater: ->
    @lerp(0.05, 0.45, @soil)

  waterFallRate: ->
    @lerp(10, 1, @soil)

  color: ->
    @rgbToHex(@soil * 255.0, @water * 255.0, @water * 255.0)

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

  lerp: (min, max, percent) ->
    min + (max - min) * percent
