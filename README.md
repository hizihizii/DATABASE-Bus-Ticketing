Bus Tour Ticketing System Database
Overview
A comprehensive database management system designed for bus tour operations, focusing on efficient ticket booking, route management, and passenger tracking. This system aims to streamline bus tour operations while enhancing customer experience through organized data management.
Features

Bus Management: Track bus details, capacity, and type
Driver Management: Maintain driver information and assignments
Route Planning: Manage bus routes with terminals and estimated times
Schedule Management: Organize departure and arrival times
Ticket Booking: Handle passenger reservations and seat assignments
Payment Processing: Track payment information and methods
Passenger Management: Store and manage passenger details

Database Structure
Tables
Bus

bus_id (PK)
bus_name
capacity
bus_type
driver_id (FK)


Driver

driver_id (PK)
first_name
last_name
license_number
phone


Route

route_id (PK)
source_city
destination_city
terminal_keberangkatan
terminal_kehadiran
distance
estimasi_waktu
bus_id (FK)


Schedule

schedule_id (PK)
bus_id (FK)
route_id (FK)
departure_time
arrival_time
day_of_week


Passenger

passenger_id (PK)
first_name
last_name
email
phone
address


Ticket

ticket_id (PK)
schedule_id (FK)
passenger_id (FK)
seat_number
status
booking_date


Payment

payment_id (PK)
ticket_id (FK)
amount
payment_date
payment_method



Key Features
Automated Capacity Management

Trigger system to automatically update bus capacity when tickets are booked
Real-time tracking of available seats

Stored Procedures

GetTicketInfoByPassengerID: Retrieve detailed ticket information for specific passengers
Various reporting procedures for business analytics

Data Integrity

Foreign key constraints to maintain referential integrity
Check constraints for data validation
ID format validation using regular expressions

Installation

Create a new database:

sqlCopyCREATE DATABASE bus_ticketing;

Run the table creation scripts in the following order:

Driver
Bus
Route
Schedule
Passenger
Ticket
Payment


Execute the trigger creation scripts
Import sample data if needed

Usage Examples
Get Ticket Information
sqlCopyCALL GetTicketInfoByPassengerID('PG001');
Check Available Seats
sqlCopySELECT b.bus_id, b.bus_name, b.capacity, 
       (b.capacity - COUNT(t.ticket_id)) AS available_seats
FROM Bus b
LEFT JOIN Schedule s ON b.bus_id = s.bus_id
LEFT JOIN Ticket t ON s.schedule_id = t.schedule_id
GROUP BY b.bus_id;
Development Team

Technologies Used

MySQL Database
SQL Triggers
Stored Procedures
Foreign Key Constraints
Check Constraints

Future Improvements

Implementation of real-time booking system
Integration with payment gateways
Mobile application integration
Advanced reporting and analytics
Route optimization algorithms
