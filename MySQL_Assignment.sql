-- create sales people table
CREATE TABLE SalesPeople (
  Snum INTEGER PRIMARY KEY,
  Sname TEXT NOT NULL unique,
  City TEXT NOT NULL,
  Comm INTEGER NOT NULL
);

-- insert some values
INSERT INTO SalesPeople VALUES (1001, 'Peel','London',12);
INSERT INTO SalesPeople VALUES (1002, 'Serres','Sanjose',13);
INSERT INTO SalesPeople VALUES (1004, 'Motika','London',11);
INSERT INTO SalesPeople VALUES (1007, 'Rifkin','Barcelona',15);
INSERT INTO SalesPeople VALUES (1003, 'Axelrod','Newyork',10);

-- create customers table
CREATE TABLE Customers (
  Cnum INTEGER PRIMARY KEY,
  Cname TEXT NOT NULL,
  City TEXT NOT NULL,
  Snum INTEGER,
  CONSTRAINT FK_Snum FOREIGN KEY(Snum)
  REFERENCES SalesPeople(Snum));
  
-- insert some values 
INSERT INTO Customers VALUES (2001, 'Hoffman','London',1001); 
INSERT INTO Customers VALUES (2002, 'Giovanni','Rome',1003);
INSERT INTO Customers VALUES (2003, 'Liu','Sanjose',1002);
INSERT INTO Customers VALUES (2004, 'Grass','Berlin',1002);
INSERT INTO Customers VALUES (2006, 'Clemens','London',1001);
INSERT INTO Customers VALUES (2008, 'Cisneros','Sanjose',1007);
INSERT INTO Customers VALUES (2007, 'Pereira','Rome',1004);

-- create orders table
CREATE TABLE Orders (
  Onum INTEGER PRIMARY KEY,
  Amt DECIMAL,
  Odate varchar(255),
  Cnum INTEGER,
  Snum INTEGER,
  CONSTRAINT FK_Cnum FOREIGN KEY(Cnum)
  REFERENCES Customers(Cnum),
  CONSTRAINT FK_Snum FOREIGN KEY(Snum)
  REFERENCES SalesPeople(Snum));

-- insert some values 
INSERT INTO Orders VALUES (3001,18.69,'3-10-1990',2008,1007); 
INSERT INTO Orders VALUES (3003,767.19,'3-10-1990',2001,1001);
INSERT INTO Orders VALUES (3002,1900.10,'3-10-1990',2007,1004);
INSERT INTO Orders VALUES (3005,5160.45,'3-10-1990',2003,1002);
INSERT INTO Orders VALUES (3006,1098.16,'3-10-1990',2008,1007);
INSERT INTO Orders VALUES (3009,1713.23,'4-10-1990',2002,1003);
INSERT INTO Orders VALUES (3007,75.75,'4-10-1990',2002,1002);
INSERT INTO Orders VALUES (3008,4267.00,'5-10-1990',2006,1001);
INSERT INTO Orders VALUES (3010,1309.95,'6-10-1990',2004,1002);
INSERT INTO Orders VALUES (3011,9891.88,'6-10-1990',2006,1001); 

-- count the number of Salesperson whose name begin with 'a'/'A'
select count(*) from SalesPeople where Sname LIKE 'a%' OR 'A%';

-- Display all the Salesperson whose all orders worth is more than Rs.2000
select * from SalesPeople INNER JOIN Orders ON SalesPeople.Snum=Orders.Snum where Orders.Amt>2000 group by SalesPeople.Sname;

-- count the number of Salesperson belonging to Newyork
select count(*) from SalesPeople where City='Newyork';

-- Display the number of Salesperson belonging to London and belonging to paris
select count(*),Sname from SalesPeople where City='London' and 'Paris';

-- Display the number of orders taken by each Salesperson and their date of orders
select count(Orders.Onum),Orders.Odate from Orders INNER JOIN SalesPeople ON Orders.Snum=SalesPeople.Snum group by Sname;

