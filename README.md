#  README

## Architecture

**I have used a standard MVVM architecture for this project. The reason is to decouple the Views from the business logic for maximum reusability and separation of concerns. In summary, here is how the app functions**

### Views

The View (Collection and Cell) owns displaying itself according to the mockup specifications. It displays whatever the ViewModel returns it. When the View loads, it asks the ViewModel to get its data using a closure. When the closure returns, the View reloads and pulls its data from the ViewModel.

- `CollectionView` is the main view with all Items. Its job is to display a collection of items according to specifications.
- `ItemCell` is a cell that represents one Item within the CollectionView. The view is defined there according to mockups
- When the view is ready to display data, the main images are set and downloaded asynchronously from HTTP using SDWebImage. They are individually downloaded concurrently in the background and displayed whenever one is ready.

### View Models

- `CollectionViewModel`is responsible for returning data to display to the View. It simply asks a Helper class for the data to display. 

### Helpers

- `DataFetcher` retrieves and parses data to be displayed. It currently reads and parses a local JSON file, but is ready to download a file from HTTP from Network without changing anything to the ViewModel.
- Called by the ViewModel, and returns an array of Items ready to be displayed. The ViewModel doesn't need to know the data source.

### Model

`Item` is where we define what an Item to display contains: name, picture, price, etc. It's codable so as to be parsed from JSON easily



