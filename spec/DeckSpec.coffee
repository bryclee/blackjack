assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()
    dealer = deck.dealDealer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 48
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 47

  describe 'scoring', ->
    it 'should return the right score', ->
      hand = new Hand([new Card(rank:1, suit:0),new Card(rank:10, suit:0)], deck)
      assert.strictEqual hand.scores(), 21
      hand.add(new Card rank:10, suit:1)
      assert.strictEqual hand.scores(), 21
      hand.add((new Card rank:9, suit:4).flip())
      assert.strictEqual hand.scores(), 21

  describe 'stand', ->
    it 'should stand', ->
      hasHit = false
      hand.on('stand', -> hasHit = true)
      hand.stand()
      assert.strictEqual hasHit, true
