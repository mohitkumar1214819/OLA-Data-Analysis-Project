CREATE DATABASE Ola;
USE Ola;
-- ## 1. Retrieve all successful bookings

Select * From bookings
where Booking_status = 'Success'; 

-- ## 2 Find the average ride distance for each vehicle type
Create View ride_distance_for_each_vehicle as
SELECT 
Vehicle_Type,
AVG(Ride_Distance) as average_distance
FROM bookings
GROUP BY Vehicle_Type;

select * from ride_distance_for_each_vehicle;

-- ## 3 Get the total number of canceled rides by customer
Create View Canceled_rides_by_customer as
SELECT
COUNT(*) as Canceled_ride_by_Customer
FROM bookings
WHERE Booking_Status = 'Canceled_rides_by_Customer';

select * from canceled_rides_by_customer;

-- ## List the top 5 customers who booked the highest number of rides:

SELECT
Customer_ID, COUNT(Booking_ID)AS total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;

-- ## 5. Get the number of rides canceled by drivers due to personal and car-related issuess:

SELECT 
COUNT(*) as rides_canceled_by_drivers
FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

-- ## 6 Find the maximum and minimum driver rating for prime sedan booking

SELECT
MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM bookings
WHERE Vehicle_Type = 'Prime Sedan';

-- ## 7. Retrieve all rides where payment was made using upi

SELECT *
FROM bookings
WHERE Payment_Method = 'UPI';

--  ## 8. Find the average customer rating per vehicle type

SELECT 
Vehicle_Type,
AVG(Customer_Rating)as average_customer_rating
FROM bookings
GROUP BY Vehicle_Type;

-- ## 9. Calculate the total booking value of rides completed successfully:

SELECT
SUM(Booking_Value)as total_successful_value
FROM bookings
WHERE Booking_Status = 'Success'; 

-- ## 10. List all incomplete rides along with the reason:

SELECT 
Booking_ID, 
Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';




























