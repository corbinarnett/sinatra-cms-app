# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (e.g. User, Post, Category)
        User and DiningSpot
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
        User has_many DiningSpots
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
        DiningSpot belongs_to User
- [x] Include user accounts with unique login attribute (username or email)
        User includes an email
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
        User is able to create a dining_spot, view all dining spots created as well as view a specific dining spot, user can also delete their dining_spots
- [x] Ensure that users can't modify content created by other users
        User is not able to edit or delete other users dining_spots
- [x] Include user input validations
        Users cannot enter empty forms, all params are required
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
