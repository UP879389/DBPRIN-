CREATE DATABASE CrazyCat;

CREATE TABLE Venue (
Venue_ID int auto_increment primary key,
Venue_Name varchar(30) not null,
Venue_Street varchar(30) not null,
Venue_City varchar(30) not null,
Venue_PostCode varchar(15) not null,
Venue_Phone varchar(20) not null
);

CREATE TABLE Loyalty_Card (
Loyalty_Card_ID int primary key,
Cardholder_Name varchar(30) not null,
Cardholder_Surname varchar(30) not null,
Cardholder_Email varchar(50) not null,
Points int not null,
Sart_Date date
);


ALTER TABLE Loyalty_Card DROP Start_Date;

ALTER TABLE Loyalty_Card ADD Cardholder_Email varchar(50);

CREATE TABLE Payment (
Payment_ID int auto_increment primary key,
Transaction_Price decimal (10,2) not null,
Payment_Type varchar(5) not null,
foreign key (Transaction_Price) references  Transaction(Transaction_Price)
);

CREATE TABLE Card (
Payment_ID int auto_increment,
CVC int not null,
Card_Name varchar(30) not null,
Card_Number int not null primary key,
Cardholder_Surname varchar(30) not null,
Cardholder_Email varchar(50) not null,
foreign key (Payment_ID) references Payment(Payment_ID),
);

CREATE TABLE Cash (
Payment_ID int auto_increment not null,
foreign key (Payment_ID) references Payment(Payment_ID)
);

CREATE TABLE Transaction (
Transaction_ID int auto_increment primary key,
Food_Order_ID int auto_increment,
Drink_Order_ID int auto_increment,
Venue_ID int auto_increment not null,
Transaction_Date datetime not null,
Transaction_Price decimal (10,2) not null,
foreign key (Food_Order_ID) references Food_Order(Food_OrderID),
foreign key (Drink_Order_ID) references Drink_Order(Drink_Order_ID),
foreign key (Venue_ID) references Venue(Venue_ID)
);

SEPARATE TRANSACTION DATE AND TIME
TIME BETWEEN 8 AM - 12 PM

CREATE TABLE Food_Order (
Food_Order_ID int  key auto_increment primary key,
Food_Name varchar(30) not null,
foreign key (Food_Name) references Food_Menu(Food_Name)
);

CREATE TABLE Food_Menu (
Food_ID int auto_increment primary key,
Food_Name varchar(30) not null,
Food_Description varchar(50) not null,
Food_Price decimal(10,2) not null
);

CREATE TABLE Drink_Menu (
Drink_ID int auto_increment primary key,
Drink_Name varchar(30) not null,
Drink_type varchar(30) not null,
Drink_Price decimal (10,2) not null
);

CREATE TABLE Drink_Order(
Drink_Order_ID int auto_increment primary key,
Drink_Name varchar(30) not null,
foreign key (Drink_Name) references Drink_Menu(Drink_Name)
);


CREATE TABLE Staff (
Staff_ID int auto_increment primary key,
Staff_Type varchar(30) not null,
Venue_ID int auto_increment,
foreign key (Venue_ID) references Venue(Venue_ID)
);

CREATE TABLE Permanent_Staff (
Permanent_ID int auto_increment primary key,
Permanent_Name varchar(30) not null,
Permanent_Surname varchar(30) not null,
Permanent_Number varchar(30) not null,
Permanent_Address varchar(50) not null,
Permanent_Role  varchar(40) not null,
Staff_ID int auto_increment not null,
foreign key (Staff_ID) references Staff(Staff_ID)
);

CREATE TABLE Temporary_Staff (
Temporary_ID int auto_increment primary key,
Temporary_Name varchar(30) not null,
Temporary_Surname varchar(30) not null,
Temporary_Number varchar(30) not null,
Temporary_Address varchar(50) not null,
Temporary_Role varchar(40) not null,
Staff_ID int auto_increment not null,
foreign key (Staff_ID) references Staff(Staff_ID)
);

CREATE TABLE Staff_Shift (
Staff_Shift_ID int auto_increment primary key,
Staff_ID int auto_increment not null,
Shift_ID int auto_increment not null,
foreign key (Staff_ID) references Staff(Staff_ID),
foreign key (Shift_ID) references Shift(Shift_ID)
);

CREATE TABLE Shift (
Shift_ID int auto_increment primary key,
Shift_Start_Time datetime not null,
Shift_End_Time datetime not null
);
