window.QUANTA = 0.015
class window.Cell

  constructor: ->
    @_soil = 0
    @_water = 0 #if Math.random() > 0.5 then Math.random() else 0
    @_plant = 0 #if Math.random() > 0.5 then Math.random() else 0
    @plantDirection = Math.floor(Math.random()*3)-1
    @temp = undefined

  # MATERIALS

  soil: ->
    val:      -> @_soil
    max:      -> Math.max(0, @lerp(0.5, 0.8, @_water) - @_plant)
    stable:   -> @lerp(0.5, 0.85, @_water)
    fallRate: -> @lerp(10, 2, @_water)

  # GETTERS

  get: (type) ->
    @[type]().val.apply(@)

  max: (type) ->
    @[type]().max.apply(@)

  stable: (type) ->
    @[type]().stable.apply(@)

  fallRate: (type) ->
    @[type]().fallRate.apply(@)

  transfer: (type, quantity) ->
    @["_#{type}"] += quantity

  maxWater: ->
    Math.max(0, @lerp(0.5, 0.05, @_soil) - @_plant)

  stableWater: ->
    @lerp(0.05, 0.45, @_soil)

  waterFallRate: ->
    @lerp(10, 1, @_soil)

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
    @rgbToHex(Math.min(255, @lerp(64, 255, @_soil)), Math.min(255, @lerp(64, 255, @_plant)), Math.min(255, @lerp(64, 255, @_water)))

  isFull: ->
    if (@_soil || @_water || @_plant) then true else false

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
    @_soil = cell._soil
    @_water = cell._water
    @_plant = cell._plant

  lerp: (min, max, percent) ->
    min + (max - min) * percent
