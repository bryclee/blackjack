class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button>
    <button class="stand-button">Stand</button>
    <button class="newGame-button">New Game</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '
  #register click events on the buttons and use them to trigger events on the playerHand
  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()
    'click .newGame-button': -> @model.newGame()


  initialize: ->
    @render()
    #listen for endgame event
    @model.on 'endGame', =>
      console.log 'endGame log'
      @$el.find('.hit-button').css display:'none'
      @$el.find('.stand-button').css display:'none'
      @$el.find('.newGame-button').css display:'inline'
    @model.on 'newGame', =>
      console.log 'newGame log'
      @$el.find('.hit-button').css display:'inline'
      @$el.find('.stand-button').css display:'inline'
      @$el.find('.newGame-button').css display:'none'

  render: ->
    @$el.children().remove()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
