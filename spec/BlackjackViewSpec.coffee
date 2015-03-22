assert = chai.assert

describe 'views', ->
    it "cards should have correct names", ->
      collection = new Deck()
      playerHand = new Hand([
        new Card(rank:0, suit:0)
        new Card(rank:1, suit:1)
        new Card(rank:11, suit:2)
        new Card(rank:12, suit:3)
      ])
      assert.strictEqual new CardView(model: playerHand.at 0).$el.html(), 'King of Spades'
      assert.strictEqual new CardView(model: playerHand.at 1).$el.html(), 'Ace of Diamonds'
      assert.strictEqual new CardView(model: playerHand.at 2).$el.html(), 'Jack of Clubs'
      assert.strictEqual new CardView(model: playerHand.at 3).$el.html(), 'Queen of Hearts'
### sinon version not correct
    it "should have buttons that react", ->
      appView = new AppView(model: new App())
      playerHand = appView.model.get('playerHand')
      console.dir sinon
      console.dir sinon.spy
      spy = sinon.spy(playerHand, 'hit')
      appView.$el.find('.hit-button').click()

      assert spy.calledOnce
###
