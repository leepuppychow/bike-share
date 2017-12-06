### General 
* [x] Navigation to all links
* [ ] Simple styling present

### Iteration 1

* [x ] See all stations 
* [x] See one station 
* [x] Create a new station 
* [x] Update a station 
* [x] Delete a station (from either index or show)
* [x] Cannot save without name, dock count, city, installation date

### Iteration 2

* [x] 70 Stations Load from CSV

### Iteration 3

On `/station-dashboard`:

* [x] Total count of stations
* [ ] Average bikes available per station (based on docks).
* [x] Most bikes available at a station (based on docks).
* [x] Station(s) where the most bikes are available (based on docks).
* [x] Fewest bikes available at a station (based on docks).
* [x] Station(s) where the fewest bikes are available (based on docks).
* [x] Most recently installed station.
* [x] Oldest station.

### Iteration 4

* [ ] See all trips 
* [x] See one trip
* [x] Create a new trip 
* [ ] Update a trip 
* [x] Delete a trip (from either index or show)
* [ ] All attributes (except zip code) must be present: duration, start date, start station, end date, end station, bike ID, subscription type)
* [x] Trips are paginated in groups of 30 

### Iteration 5

* [x] Trips load from CSV

### Iteration 6

On `/trips-dashboard`:

* [x] Average duration of a ride.
* [x] Longest ride.
* [x] Shortest ride.
* [x] Station with the most rides as a starting place.
* [x] Station with the most rides as an ending place.
* [x] Month by Month breakdown of number of rides with subtotals for each year.
* [x] Most ridden bike with total number of rides for that bike.
* [x] Least ridden bike with total number of rides for that bike.
* [x] User subscription type breakout with both count and percentage.
* [x] Single date with the highest number of trips with a count of those trips.
* [x] Single date with the lowest number of trips with a count of those trips.

On an individual station show page the additional information should be present:

* [x] Number of rides started at this station.
* [x] Number of rides ended at this station.
* [x] Most frequent destination station (for rides that began at this station).
* [x] Most frequent origination station (for rides that ended at this station).
* [x] Date with the highest number of trips started at this station.
* [x] Most frequent zip code for users starting trips at this station.
* [x] Bike ID most frequently starting a trip at this station.

### Iteration 7

* [x] See all conditions
* [x] See one condition
* [x] Create a new condition
* [x] Update a condition
* [x] Delete a station (from both index or show)
* [x] Attributes include: duration, start date, start station, end date, end station, bike ID, subscription type
* [x] Conditions are paginated by groups of 30

### Iteration 8

* [x] Weathers load from CSV

### Iteration 9

On `/weather-dashboard`:

* [x] Breakout of average number of rides, highest number of rides, and lowest number of rides on days with a high temperature in 10 degree chunks (e.g. average number of rides on days with high temps between fifty and sixty degrees)
* [ ] Breakout of average number of rides, highest number of rides, and lowest number of rides on days with precipitation in half-inch increments.
* [ ] Breakout of average number of rides, highest number of rides, and lowest number of rides on days with mean wind speeds in four mile increments.
* [ ] Breakout of average number of rides, highest number of rides, and lowest number of rides on days with mean visibility in miles in four mile increments.

Additional information on the `trip-dashboard`:

* [ ] Weather on the day with the highest rides.
* [ ] Weather on the day with the lowest rides.
