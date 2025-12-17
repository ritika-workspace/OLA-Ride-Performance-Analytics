-- create database Ola;
use ola;

select * from bookings;
-- SQL Questions:

-- 1. Retrieve all successful bookings:
create view successful_bookings as
select * from bookings
where booking_status = 'success';

select * from successful_bookings;


-- 2. Find the average ride distance for each vehicle type:
select Vehicle_Type , avg(Ride_Distance) as  average_distance
from bookings
group by Vehicle_Type;

-- 3. Get the total number of cancelled rides by customers:
select count(*)
from bookings
where Booking_Status = 'Canceled by Customer';

-- 4. List the top 5 customers who booked the highest number of rides:
select Customer_ID ,count(Booking_ID) as total_rides
from bookings
group by Customer_ID
order by total_rides desc
limit 5;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select Booking_Status , count(*)
from bookings
where Booking_Status = 'Canceled by Driver' and Canceled_Rides_by_Driver = 'Personal & Car related issue';

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select Vehicle_type, max(Driver_Ratings) as max_ratings ,min(Driver_Ratings) as min_ratings
from bookings
where Vehicle_type = 'Prime Sedan';

-- 7. Retrieve all rides where payment was made using UPI:
select * from bookings 
where Payment_Method = 'UPI';

-- 8. Find the average customer rating per vehicle type:
select vehicle_type, avg(Customer_Rating) as cust_rating
from bookings
group by vehicle_type;

-- 9. Calculate the total booking value of rides completed successfully:
select booking_status , sum(booking_value) as total_booking_value
from bookings
where booking_status = 'Success';

-- 10. List all incomplete rides along with the reason:
select Booking_ID, Incomplete_Rides , Incomplete_Rides_Reason
from bookings
where Incomplete_Rides = 'Yes';