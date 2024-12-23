# ShGardi-Assignment

## 1. Overview
App Name:
Celebrity Info Viewer (Assumed name)

### Purpose:
A table-view-based app that displays a infinite list of celebrities like actors and directors as mentioned in Assignment, allowing users to view detailed information such as name, profile picture, date of birth, and place of birth.

## 2. Features
### Celebrity List: 
  Displays a list of celebrities in a table view. Each row contains the celebrity's name and an accessory button (chevron.right icon).
### Details View:
Tapping a celebrity name navigates to a details page. The details page displays the profile picture, name, date of birth, place of birth, and additional information.
### Interactive Design:
Custom-styled chevron button as a cell accessory. Elegant use of auto-layout for responsive design.
### Modern Design:
Responsive layouts with auto-layout constraints. UINavigationBarAppearance custom styling for consistent aesthetics.


## 3. Architecture: UIKit-based MVVM
### Models:
PersonBioModel represents the data structure for each celebrity's details.
PersonModel represents the data structure for list of popular person.

### Views:
Custom views such as UIImageView, UILabel, and UIButton are used for layout.
PersonListViewController: Manages the table view displaying the list of celebrities.
PersonBioViewController: Displays detailed information about the selected celebrity.

### ViewModel:
APICaller acts as intermediatary between Model and View

## 4. Code Documentation
 ### 4.1 Model: PersonBioModel
 * Description: Represents the details of a celebrity.
 * Properties: <br>
      name: Celebrity's name (String). <br>
      profile_path: Path to the profile picture (String). <br>
      birthday: Celebrity's date of birth (String). <br>
      place_of_birth: Celebrity's place of birth (String).

### 4.2 PersonListViewController
Responsible for managing the table view and navigating to the PersonBioViewController.

#### Key methods:
* viewDidLoad(): Initializes table view.
* tableView(_:cellForRowAt:): Configures cells with chevronButton and celebrity details.
* tableView(_:didSelectRowAt:): Handles navigation to PersonBioViewController.

### 4.3 PersonBioViewController
Displays the selected celebrity’s details using labels and an image view.

#### Key methods:
* setupNavigation(): Configures navigation bar styles.
* configure(with:): Fetches and displays detailed celebrity info.
* setupConstraints(): Applies layout constraints for the UI components.

## 5. APIs

#### 5.1 Normal Celebrity API for fetching ID
* URL: https://api.themoviedb.org/3/person/popular?api_key=697d439ac993538da4e3e60b54e762&page=1"
* Purpose: Retrieves the celebrity's profile image and id for retriving specific person detail.

#### 5.2 Searching API
* URL: https://api.themoviedb.org/3/search/person?api_key=697d439ac993538da4e3e60b54e762cd&query=tom%20cruise")
* Purpose: Searching and Retrieves the celebrity's profile image and id for retriving specific person detail

#### 5.3 Celebrity Detail API
* URL: https://api.themoviedb.org/3/person/500?api_key=697d439ac993538da4e3e60b54e762cd
* Purpose: Retrieves the celebrity's detail like profile image, date of birth, place and description.

#### 5.4 Image API
* URL: https://image.tmdb.org/t/p/w500/{profile_path}
* Purpose: Retrieves the celebrity's profile image.

## 6. Future Enhancements
* Add search functionality to filter celebrities.
* Include a favorites feature for saving profiles.
* Allow sharing celebrity profiles via social media.
* Refactor UI using SwiftUI for better modularity and modern designs.



# ScreenShots:

<img width="350" alt="Screenshot 2024-12-24 at 12 00 36 AM" src="https://github.com/user-attachments/assets/25270600-1e31-487f-9473-9ce0e5292293" />
<img width="350" alt="Screenshot 2024-12-24 at 12 01 06 AM" src="https://github.com/user-attachments/assets/af3a8634-37d3-43c0-8ceb-7bb10a6efea9" />
<img width="352" alt="Screenshot 2024-12-24 at 12 01 42 AM" src="https://github.com/user-attachments/assets/1c1cb9e8-a62a-4057-9ed7-8d5ead9d2122" />
<img width="347" alt="Screenshot 2024-12-24 at 12 02 11 AM" src="https://github.com/user-attachments/assets/93c0ef10-0ad3-4982-b96f-f957fbe36e72" />
<img width="354" alt="Screenshot 2024-12-24 at 12 02 32 AM" src="https://github.com/user-attachments/assets/7bc66067-288b-4d8c-9fe1-24558c2474b8" />





