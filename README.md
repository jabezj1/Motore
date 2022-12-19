# Motore

This is an app made with Flutter for CSCI 499 (Prof. Artjom Plaunov).

The app is meant to help people become more confident and organized
with owning a car. It can track expenses, mileage, and other details,
while also allowing users to find nearby gas stations and making it
easier to shop for parts with the Autozone website.

## Research Topics

One of the constraints for this project was researching and implementing 
two research topics of our choosing. 

### Prediciting Car Maintenance Intervals

The app must be able to tell users when their particular
vehicle needs to have a system maintained. This is implemented
on the Dash screen.

### App-Friendliness for Elderly & Computer Illiterate Users

The app must be designed to be easy for elderly and computer
illiterate users to use. This will also help the app reach and 
satisfy more "clients". 

## Known Issues

### Dash

- The buttons for refreshing maintenance intervals and deleting To-Do list items do not function.
- The lists of maintenance items and To-Do list items does not load until their references are defined. This can be done by going to the Bio screen and then going back to the Dash screen. 
- The "miles remaining" fields and the "days remaining" fields on the Upcoming Maintenance and To-Do List objects respectively do not update.

### Parts

- Tapping on a part tile will open a general query for the part on the Autozone website, but does not get the exact list of parts that is needed. This is because the Autozone website requires an "engine" field to get an "exact fit" query running, however, the API we are using to retrieve car information does not supply this data. So, we had to settle for a less precise method.

### History

- Adding an entry in Gas & Trips will not decrease the miles remaining on the intervals in the Upcoming Maintenance list (Dash). 

### Bio

- While users have the choice to pick an exact model year for their car, the API can only display pictures of cars from the latest model year. This is because we are using the free version of the API and accessing other model years will cost $150/month.
- Not all cars have trim levels associated with them.
- Users still have the ability to type in the form boxes even though they are supposed to be choosing from a list.
- Even when all the details on the form are supplied, the API might not have the image of the car that was added.

## Instructions
For instructions on running this app, see [this Google Docs file](https://docs.google.com/document/d/1Tks2RXYu23HHJSm72SixqWXBSfz9cF1nErPYE46e_-c/edit?usp=sharing).
