# CardGame
A Star Wars themed card game designed to see if you know your sith vs jedi.

#### Learning Objectives: Alert Controllers, Protocol/Delegate communication pattern, and an introduction to UICollectionView

### Model
We will start by constructing a `Character` model with three properties:
  - Name of type `String`
  - Photo of type optional `UIImage`
  - Faction of type `String`
  
`Character` will also need to conform the the `Equatable` protocol

### ModelController
The `CharacterController` will have two static arrays, one for Jedi and one for Sith. Reference the photo assets in the `Assets` folder to see what characters can be created with photos. We need to use the string value of the photo asset to initialize the UIImage for model objects.

### Views: CollectionViewController
Add a UICollectionViewController to the `Main.storyboard` canvas and embed it in a Navigation Controller. 
  - With the CollectionView selected, navigate to the Size Inspector and change the Estimate Size to `None`. This will allow us to better control the size of our cells.
  - Add a Bar Button Item to the navigation bar, change the image in the attributes inspector to `line.horizontal.3.decrease`.
    - This would be a good time to mention SFSymbols being available natively in swift. 
  
Create a new CocoTouchClass file, subclass UICollectionView, and title it CharacterCollectionViewController. Delete all the boiler plate code aside from `numberOfItemsInSection`, `cellForItemAt`, `didSelectItemAt`, and `prepare(for segue:)`

For now, we will focus on displaying characters on the collection view.
  - We will need an array to store the displayed faction of characters, a property to hold the target character, and a property to help us determine what faction is selected
    - Create the `displayedCharacters` array
    - Create the `selectedFaction` proterty with the default value of jedi
    - Create the `targetCharacter` property 
    
We now need to populate our `displayedCharacters` array with 3 characters of the selected faction, and one from the other. 
Write the `shuffleCharacters(for faction:)` method.
  - Walk through the conditional, explaining we need grab from the different arrays on our model controller for whatever faction is currenlty selected
  - We are using the `.prefix()` method on `Array` which returns an `ArraySlice` that we then need to transform back into an Array
  - We are using the `.randomElement()` method on `Array` to grab a random character out of the oposite faction array to set as our 
  - We will then call `updateViews()`
  
Write the `updateViews()` method
  - Unwrap the target character and append it to the displayedCharacters array
  - We will then call `.shuffle()` on the `displayedCharacters` array to randomize the order of our Character objects
  - Assign the `title` to the `targetCharacter`'s name property
  - Finally, call `collectionView.reloadData()`
  
CollectionViewDataSource
  - For `numberOfItemsInSection` we will use `displayedCharacters.count` 
  - For `cellForItemAt` we will need to crete a custom collectionViewCell
  
### Views: CollectionViewCell
In the `Main.storyboard`, add a prototype cell to the CollectionView of the `CharacterCollectionViewController` there isn't one already.
  - Add An image to the cell, and constrain it to 0 to the top, leading, bottom, and trailing edges

Create a CocoTouchClass file, subclass UICollectionViewCell, and title the file CharacterCollectionViewCell. Delete all the starting code in the file. 
  - Give the cell a reuseIdentifier
  - Create the needed outlet for the UIImageView
  - Create the helper function `displayImage(for character:)` to take the given character and set the image on the cell. 
  
### Views: CollectionViewController Part 2
Add the needed code to populate the `cellForItemAt` method
  - Dequeue a reusable collectionViewCell as the `CharacterCollectionViewCell`
  - Subscript into the array of characters, `displayedCharacters[indexPath.row]`, to get the character for a given cell
  - Call `cell.displayImage(for:)` and pass in the character
  - Return the cell
  
Running the app at this point will display four characters. However, the sizing of the cells will be off. Time to fix that by extending the `CharacterCollectionViewController` and adopting the `UICollectionViewDelegateFlowLayout` protocol. 
  - Implement the `sizeForItemAt` method
  - Size the cells however you see fit. 
  
Running the app now will display the character cell properly. We still can't play the game without implementing the `didSelectItemAt` to let us know if we selected the correct target.
  - In `didSelectItemAt`, subscritpt into the `displayedCharacters` to grab the selected character at the selected IndexPath
  - Now create the `presentAlert(for character:)` method
    - Be sure to outline initializing the UIAlertController, initializing the UIAlertActions, and adding the alert actions to the UIAlertController. 
  
### Views: FilterViewController
