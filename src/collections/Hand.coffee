class window.Hand extends Backbone.Collection
  #collection of Cards
  model: Card

  #initially takes in an array, this.deck, and this.isDealer.
  #doesn't do anything.
  initialize: (array, @deck, @isDealer) ->

  #pop a card from this deck and add it to this hand
  hit: ->
    @add(@deck.pop())
    @trigger 'hit'

  #stand tells game that this hand is standing
  stand: ->
    @trigger 'stand'


  hasAce: -> @reduce (memo, card) ->
    if card.get 'revealed' then (memo or card.get('value') is 1) else 0
  , 0

  #
  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    if (@minScore() + 10 * @hasAce() <= 21) then (@minScore() + 10 * @hasAce()) else (@minScore())
