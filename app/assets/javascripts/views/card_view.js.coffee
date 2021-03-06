#= require_tree ../templates

app = @Kototan
app.Views ?= {}

app.Views.CardView = Backbone.View.extend
  tagName: 'article'
  id: -> "card-#{@model.cid}"
  className: 'card-item'
  template: JST['cards/item']

  initialize: ->
    @listenTo @model, 'destroy', @remove

  render: ->
    context = @model.toJSON()
    _.extend(context, id: @id())
    @$el.html(@template(context))
    @el
