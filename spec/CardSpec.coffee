assert = chai.assert

describe "deck constructor", ->

  it "should create a card collection", ->
    collection = new Deck()
    assert.strictEqual collection.length, 52

  it "should deal hands", ->
    collection = new Deck()
    playerHand = collection.dealPlayer()
    dealerHand = collection.dealDealer()
    assert.strictEqual playerHand.length, 2
    assert.strictEqual dealerHand.length, 2

  it "dealer should have a dealer property", ->
    collection = new Deck()
    dealerHand = collection.dealDealer()
    assert.strictEqual dealerHand.isDealer, true
