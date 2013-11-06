window.QUANTA = 0.015
class window.Cell

  constructor: ->
    @soil = 0 #if Math.random() > 0.5 then Math.random() else 0
    @water = 0 #if Math.random() > 0.5 then Math.random() else 0
    @plant = 0 #if Math.random() > 0.5 then Math.random() else 0
    @plantDirection = Math.floor(Math.random()*3)-1
    @temp = undefined

  maxSoil: ->
    Math.max(0, @lerp(0.5, 0.8, @water) - @plant)

  stableSoil: ->
    @lerp(0.5, 0.85, @water)

  soilFallRate: ->
    @lerp(10, 2, @water)

  maxWater: ->
    Math.max(0, @lerp(0.5, 0.05, @soil) - @plant)

  stableWater: ->
    @lerp(0.05, 0.45, @soil)

  waterFallRate: ->
    @lerp(10, 1, @soil)

  maxPlant: ->
    0.6

  stablePlant: ->
    0.4

  minPlant: ->
    0.25

  requiredWater: ->
    0.05

  getDirection: ->
    if (Math.random() > 0.99)
      @plantDirection = Math.floor(Math.random()*3)-1
    @plantDirection

  color: ->
    @rgbToHex(Math.min(255, @lerp(64, 255, @soil)), Math.min(255, @lerp(64, 255, @plant)), Math.min(255, @lerp(64, 255, @water)))

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