Author: Stephen Ajayi<br />
Program: SKA, Museum Exibits <br />
Description: "SKA Museum Tracker" is a sinatra app that uses Museum and Artwork classes to create museums and the artwork on display at each, uses PSQL.<br />
Set up: bundle to get required gems and set up Database as follows:<br />
  Databases: museum_tracker(Production) and museum_tracker_test(Development), tables shared by both databases.<br />
  Tables:museums (name varchar, id serial PRIMARY KEY)) and artworks(name varchar, description varchar, museum_id int, id serial PRIMARY KEY).<br />
License: Mit license, feel free to use for whatever you like! Images are the property of there rightful owners, no copyright infirgment intende.<br /> 
Known bugs: None. <br />
demo: A working demo of the app con be found here: http://polar-wave-1929.herokuapp.com/<br