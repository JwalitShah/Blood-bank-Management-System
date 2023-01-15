create DATABASE BBMS;
USE BBMS;
CREATE table Donor(
Donor_id numeric(20) Primary Key,
First_name varchar(20) Not Null,
Last_name varchar(20) Not Null,
Donor_blood_group Enum('A+','A-','B+','B-','AB+','AB-','O+','O-') Not Null,
Zip_code numeric(20) Not Null,
Contact_no numeric(10) Unique,
Gender Enum('Male','Female','Other') Not Null,
Weight numeric (20) Not Null,
Age numeric(20) Not Null,
Quantity_donated numeric(20) Not Null,
Disease varchar(20),
Last_donation_date date,
Last_alcohol_consumption_date date
);


CREATE table Recipient(
Recipient_id numeric(20) Primary Key,
First_name varchar(20) Not Null,
Last_name varchar(20) Not Null,
Recipient_blood_group Enum('A+','A-','B+','B-','AB+','AB-','O+','O-') Not Null,
Zip_code numeric(20) Not Null,
Contact_no numeric(10) Unique,
Gender Enum('Male','Female','Other') Not Null,
Weight numeric (20) Not Null,
Age numeric(20) Not Null,
Quantity_required numeric(20) Not Null,
Transaction_id numeric(20) Not Null unique,
date_of_requirement date Not Null
);


CREATE table Analysis(
Donation_id numeric(20) Primary Key,
Quality varchar(20) Not Null,
Haemoglobin_level numeric(20) Not Null,
Iron_level numeric(20) Not Null,
RBC_Count numeric(20) Not Null,
WBC_Count numeric(20)Not Null,
Platelet_Count numeric(20) Not Null,
Donor_id numeric(20) Not Null,
Blood_id numeric(20) Not Null,
Foreign Key (Blood_id) references Blood(Blood_id)
);


CREATE table Blood(
Blood_id numeric(20) Primary Key,
Blood_type Enum('Positive','Negative') Not Null,
Blood_group Enum('A','B','AB','O') Not Null,
Collection_date date Not Null,
Donor_id numeric(20) Not Null,
Event_code numeric(20) Not Null,
Foreign Key (Donor_id) references Donor(Donor_id),
Foreign Key (Event_code) references Events(Event_code)
);

CREATE table Events(
Event_code numeric(20) Primary Key,
Event_name varchar(20) Not Null,
location varchar(20) Not Null,
Event_type Enum('School','University','Company') Not Null,
Bloodbank_id numeric(20) Not Null,
Foreign Key (Bloodbank_id) references Bloodbanks(Bloodbank_id)
);

CREATE table Hospitals(
Hospital_id numeric(20) Primary Key,
Hospital_name varchar(20) Not Null Unique,
Amount_available numeric(20),
Bloodbank_id numeric(20) Not Null,
Payment_id numeric(20) Not Null,
Recipient_id numeric(20) Not Null,
Foreign Key (Bloodbank_id) references Bloodbanks(Bloodbank_id),
Foreign Key (Recipient_id) references Recipient(Recipient_id),
Foreign Key (Payment_id) references Payment(Payment_id) 
);


CREATE table Payment(
Payment_id numeric(20) Primary Key,
Amount numeric(20) Not Null,
Payment_date date Not Null,
Recipient_id numeric(20) Not Null,
Foreign Key (Recipient_id) references Recipient(Recipient_id)
);


CREATE table Bloodbanks(
Bloodbank_id numeric(20) Primary Key,
Bloodbank_name varchar(20) Not Null Unique,
Zip_code numeric(20) Not Null,
Quantity_available numeric(20)
);


CREATE table Stocks(
Stock_id numeric(20) Primary Key Not Null,
Blood_group varchar(20) Not Null,
Blood_available numeric(20),
status varchar(20),
best_before date Not Null,
Bloodbank_id numeric(20) Not Null,
Foreign Key (Bloodbank_id) references Bloodbanks(Bloodbank_id)
);

select * from Bloodbanks;
select * from Stocks;
select * from Payment;