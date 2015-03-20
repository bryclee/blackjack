# Card Model
class window.Card extends Backbone.Model
  initialize: (params) ->
    #this set is an object with the values...
    @set
      #is the card revealed
      revealed: true
      #value: 10 if face card, same as rank otherwise
      value: if !params.rank or 10 < params.rank then 10 else params.rank
      #suitName: index 0-4 on array
      suitName: ['Spades', 'Diamonds', 'Clubs', 'Hearts'][params.suit]
      #rankName: grab from rank.
      rankName: switch params.rank
        when 0 then 'King'
        when 1 then 'Ace'
        when 11 then 'Jack'
        when 12 then 'Queen'
        else params.rank

  flip: ->
    #flip sets revealed as the opposite of it's value
    @set 'revealed', !@get 'revealed'
    @
