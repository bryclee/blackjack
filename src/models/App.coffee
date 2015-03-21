# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()


    @get('playerHand').on 'hit', =>
      if @get('playerHand').scores() > 21
        @endGame "The player has busted!"

    @get('playerHand').on 'stand', =>

      #find upside down card and flip card
      @get('dealerHand').at(0).flip()

      #hit until dealer has 17 or more points
      @get('dealerHand').hit() while @get('dealerHand').scores() < 17

      #game is now over.  Count points.
      if @get('dealerHand').scores() > 21
        @endGame "The dealer has busted!"
      else if @get('dealerHand').scores() > @get('playerHand').scores()
        @endGame "The dealer has more points!"
      else if @get('dealerHand').scores() < @get('playerHand').scores()
        @endGame "The player has more points!"
      else
        @endGame "The player and dealer have the same amount of points!  Push!"


  endGame: (winner)->
    @trigger "endGame"

  newGame: ->
    @trigger "newGame"
