# Magma iOS Code Test

- Using the Deck of Cards API (api endpoints provided below) in Xcode, create an iPhone application thatcreates a deck of cards on the API, then pulls all fifty two cards from that deck into a tableview withmultiple sections.
- Ability to display preview of the card image.

### Minimum Requirements

- Load images async.
- Architect the application in MVVM.
- Show an example of KVO implementation.
- Create a repo on your github, push your code when completed, and send us the github repo link.

### Initial View Controller

- Embed the Initial View Controller inside a navigation controller with the title "Deck of Cards".
- Card data should be presented on a tableview with a custom cell which contains the card name & image.
- Sort the card values in every section from Ace to King _(ie: Ace ,Two, Three etc.)_
- Separate the tableview sections into Clubs, Hearts, Spades, Diamonds.
- Make sure the section header title is visible.

### Preview View Controller

- When a table cell is selected from the Initial View Controller, MODALLY display a Preview View controllerwith a navigation bar that displays the card title in the navigation bar.
- Preview View Controller should also be implemented in MVVM.
- Preview View Controller should contain a full screen imageView displaying the selected card image.
- Add a left bar button item in the navigation bar that dismisses the Preview View Controller.
- Add a left bar button item in the navigation bar that dismisses the Preview View controller.

## API

### Create Deck on API (returns a deckID)

- `https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1`

### Draw cards from deck on API

- `https://deckofcardsapi.com/api/deck/<deckID>/draw/?count=52`

## Extra Credit

- Implement the whole application in RxSwift without using Storyboards/ XIBs
