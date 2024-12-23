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


# ScreenShots:

<img width="350" alt="Screenshot 2024-12-24 at 12 00 36 AM" src="https://github.com/user-attachments/assets/25270600-1e31-487f-9473-9ce0e5292293" />
<img width="350" alt="Screenshot 2024-12-24 at 12 01 06 AM" src="https://github.com/user-attachments/assets/af3a8634-37d3-43c0-8ceb-7bb10a6efea9" />
<img width="352" alt="Screenshot 2024-12-24 at 12 01 42 AM" src="https://github.com/user-attachments/assets/1c1cb9e8-a62a-4057-9ed7-8d5ead9d2122" />
<img width="347" alt="Screenshot 2024-12-24 at 12 02 11 AM" src="https://github.com/user-attachments/assets/93c0ef10-0ad3-4982-b96f-f957fbe36e72" />
<img width="354" alt="Screenshot 2024-12-24 at 12 02 32 AM" src="https://github.com/user-attachments/assets/7bc66067-288b-4d8c-9fe1-24558c2474b8" />





