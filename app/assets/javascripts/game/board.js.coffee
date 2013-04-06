class window.Board

  constructor: (options) ->
    @size = options.size
    @entities = []
    @build()

  build: ->
    @entities.push(new Entity('white', new Vec(10, 10), new Vec(1, 2)))

  step: ->
    for entity in @entities
      entity.step()
