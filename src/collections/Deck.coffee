class window.Deck extends Backbone.Collection
  #inherit card model
  model: Card

  #initialize function
  initialize: ->
    #randomize numbers between 0-52
    @add _([0...52]).shuffle().map (card) ->
      new Card
        #rank: number between 0 and 12
        rank: card % 13
        #suit: number between 0-3 (51/13 < 1)
        suit: Math.floor(card / 13)

  #pop two cards from the deck and make a hand out of them.
  #pass in context
  dealPlayer: -> new Hand [@pop(), @pop()], @

  #pop two cards from the deck, flip one, and make a hand out of them.
  #pass in context
  #let the hand know that it's the dealer
  dealDealer: -> new Hand [@pop().flip(), @pop()], @, true
