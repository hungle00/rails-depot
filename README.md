# Rails online store

## Functionalities
- Regular User (Buyer)  
  - Sign in/ sign up/ change password / forgot password ( with email )  
  - View, comment, rating product  
  - Add product in cart, select pay type and order  
  - After confirm, order email is send to buyer  
- Admin User (Seller)  
  - CRUD products  
  - View all orders, users  
  - Export orders, users to CSV  
  - Add/remove admin access for other regular user  


## Dependencies

* Devise - For implementing authentication  

* cancancan - For authorization(restricts what resources a given user is allowed to access)  

* will_paginate - For paginate products  

* geocoder - Geocoding address to latitude/longitude coordinates  


### Database schema
