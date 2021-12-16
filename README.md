<p align="center">
  <img src="https://user-images.githubusercontent.com/96119482/146383087-311879cf-c2d2-46c6-9036-26760f48ab75.png" width="300" height="200">
</p>

A cross platform mobile application :iphone: developed in flutter to keep track of daily calorie needs. The calories required are calculated using BMI for which the inputs are taken from the user :bow: and stored in the database. The application is integrated with pedometer to keep count of number of steps taken by the user :walking: which helps to determine the calories burnt.

### Features
<ul>
<li> The application uses <a href="https://cloud.google.com/vision/">Vision API</a> to determine the food item :pizza: from the picture which can be either taken from the phone camera or can be selected from the Gallery.



<li> The JSON response recieved from the Vision API containing the name of the food item is cross referenced with the <a href="https://www.nutritionix.com/business/api">nutritionix</a> database :page_facing_up: to get the nutritional facts.

<li> For each 20 steps :paw_prints: counted by pedometer we deduct one calorie from the number of calories consumed by the user per day.
</ul>

# Screenshots
<p float="left">
<img src="https://user-images.githubusercontent.com/48833965/146385089-33efa578-18d3-4982-b6f7-0ff18ea03bb6.png"  />
</p>

