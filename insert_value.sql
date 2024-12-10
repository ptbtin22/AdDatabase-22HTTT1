-- Insert to AREA
INSERT INTO AREA (ID_Area, AreaName)
VALUES
('A001', 'Downtown'),
('A002', 'Suburbs'),
('A003', 'Riverside');

-- Insert to BRANCH
INSERT INTO BRANCH (ID_Branch, BranchName, Address, PhoneNumber, OpeningHour, CloseHour, ID_Employee, ID_Area)
VALUES
('B001', 'Main Branch', '123 Main St', '0123456789', '08:00', '22:00', 'E001', 'A001'),
('B002', 'Suburb Branch', '456 Suburb Rd', '0234567890', '09:00', '21:00', 'E002', 'A002'),
('B003', 'Riverside Branch', '789 Riverside Ave', '0345678901', '10:00', '23:00', 'E003', 'A003'),
('B004', 'Central Branch', '101 Central Blvd', '0456789012', '07:00', '20:00', 'E004', 'A001'),
('B005', 'East Branch', '202 East St', '0567890123', '08:30', '22:30', 'E005', 'A002');

-- Insert to PARKING
INSERT INTO PARKING (ID_Parking, Address, OpeningHour, CloseHour, ParkingType, ID_Branch)
VALUES
('P001', '123 Main St Parking', '08:00', '22:00', 1, 'B001'),
('P002', '456 Suburb Rd Parking', '09:00', '21:00', 0, 'B002'),
('P003', '789 Riverside Ave Parking', '10:00', '23:00', 1, 'B003'),
('P004', '101 Central Blvd Parking', '07:00', '20:00', 0, 'B004');

-- Insert to FOOD_TYPE
INSERT INTO FOOD_TYPE (ID_Type, TypeName)
VALUES 
('T001', 'Nigiri'),
('T002', 'Sashimi'),
('T003', 'Rolls'),
('T004', 'Tempura'),
('T005', 'Appetizers');

-- Insert to FOOD_ITEM
INSERT INTO FOOD_ITEM (ID_Food, FoodName, Price, IsAreaRestricted, DeliverySafe, ID_Type)
VALUES 
('F001', 'Salmon Nigiri', 150000, 0, 1, 'T001'),
('F002', 'Tuna Nigiri', 160000, 0, 1, 'T001'),
('F003', 'Salmon Sashimi', 180000, 0, 1, 'T002'),
('F004', 'Tuna Sashimi', 190000, 0, 1, 'T002'),
('F005', 'California Roll', 120000, 0, 1, 'T003'),
('F006', 'Spicy Tuna Roll', 130000, 0, 1, 'T003'),
('F007', 'Dragon Roll', 200000, 0, 1, 'T003'),
('F008', 'Tempura Udon', 160000, 0, 1, 'T004'),
('F009', 'Ebi Tempura', 170000, 0, 1, 'T004'),
('F010', 'Vegetable Tempura', 140000, 0, 1, 'T004'),
('F011', 'Miso Soup', 50000, 0, 1, 'T005'),
('F012', 'Edamame', 60000, 0, 1, 'T005'),
('F013', 'Seaweed Salad', 70000, 0, 1, 'T005'),
('F014', 'Unagi Don', 220000, 0, 1, 'T001'),
('F015', 'Kani Salad', 80000, 0, 1, 'T005')
('F016', 'Chirashi Bowl', 230000, 0, 1, 'T006'),
('F017', 'Hamachi Nigiri', 170000, 0, 1, 'T001'),
('F018', 'Ikura Gunkan', 180000, 0, 1, 'T001'),
('F019', 'Spicy Salmon Roll', 140000, 0, 1, 'T003'),
('F020', 'Rainbow Roll', 210000, 0, 1, 'T003'),
('F021', 'Shrimp Tempura Roll', 150000, 0, 1, 'T003'),
('F022', 'Takoyaki', 90000, 0, 1, 'T005'),
('F023', 'Okonomiyaki', 170000, 0, 1, 'T005'),
('F024', 'Yakisoba', 130000, 0, 1, 'T004'),
('F025', 'Beef Sukiyaki', 240000, 0, 1, 'T004'),
('F026', 'Green Tea Ice Cream', 60000, 0, 1, 'T005'),
('F027', 'Mochi Ice Cream', 70000, 0, 1, 'T005'),
('F028', 'Matcha Latte', 80000, 0, 1, 'T005'),
('F029', 'Tamago Nigiri', 120000, 0, 1, 'T001'),
('F030', 'Shoyu Ramen', 150000, 0, 1, 'T004');

-- Insert to AREA_SPECIFIC_FOOD
INSERT INTO AREA_SPECIFIC_FOOD (ID_Area, ID_Food)
VALUES
('A001', 'F001'),
('A002', 'F002'),
('A003', 'F003'),
('A001', 'F004'),
('A002', 'F005'),
('A003', 'F006'),
('A001', 'F007'),
('A002', 'F008'),
('A003', 'F009'),
('A001', 'F010');

-- F001, F004, F007, F010 in B001 and B004
INSERT INTO BRANCH_FOOD (ID_BranchFood, Available, ID_Branch, ID_Food)
VALUES
('BF001', 1, 'B001', 'F001'),
('BF002', 1, 'B001', 'F004'),
('BF003', 1, 'B001', 'F007'),
('BF004', 1, 'B001', 'F010'),
('BF005', 1, 'B004', 'F001'),
('BF006', 1, 'B004', 'F004'),
('BF007', 1, 'B004', 'F007'),
('BF008', 1, 'B004', 'F010');

-- F002, F005, F008 in B002 and B005
INSERT INTO BRANCH_FOOD (ID_BranchFood, Available, ID_Branch, ID_Food)
VALUES
('BF009', 1, 'B002', 'F002'),
('BF010', 1, 'B002', 'F005'),
('BF011', 1, 'B002', 'F008'),
('BF012', 1, 'B005', 'F002'),
('BF013', 1, 'B005', 'F005'),
('BF014', 1, 'B005', 'F008');

-- F003, F006, F009 in B003
INSERT INTO BRANCH_FOOD (ID_BranchFood, Available, ID_Branch, ID_Food)
VALUES
('BF015', 1, 'B003', 'F003'),
('BF016', 1, 'B003', 'F006'),
('BF017', 1, 'B003', 'F009');

-- Remaining food items (F011 to F030) in all branches
DECLARE @Branch TABLE (BranchID CHAR(5));
INSERT INTO @Branch VALUES ('B001'), ('B002'), ('B003'), ('B004'), ('B005');

DECLARE @Food TABLE (FoodID CHAR(5));
INSERT INTO @Food VALUES ('F011'), ('F012'), ('F013'), ('F014'), ('F015'), 
                         ('F016'), ('F017'), ('F018'), ('F019'), ('F020'),
                         ('F021'), ('F022'), ('F023'), ('F024'), ('F025'), 
                         ('F026'), ('F027'), ('F028'), ('F029'), ('F030');
DECLARE @ID INT = 18;

INSERT INTO BRANCH_FOOD (ID_BranchFood, Available, ID_Branch, ID_Food)
SELECT 
    CONCAT('BF', RIGHT('000' + CAST(@ID AS VARCHAR), 3)), 
    1, 
    B.BranchID, 
    F.FoodID
FROM 
    @Branch B
CROSS JOIN 
    @Food F
CROSS APPLY 
    (SELECT @ID += 1) Counter;

-- Insert to CUSTOMER
INSERT INTO CUSTOMER (ID_Customer, CustomerName, PhoneNumber, Gender, Email, SSID, ID_Card)
VALUES
('C001', 'John Doe', '0123456789', 'M', 'john.doe@example.com', '1234567890', 'ID001'),
('C002', 'Jane Smith', '0234567890', 'F', 'jane.smith@example.com', '2234567890', 'ID002'),
('C003', 'David Brown', '0345678901', 'M', 'david.brown@example.com', '3234567890', 'ID003'),
('C004', 'Emily Davis', '0456789012', 'F', 'emily.davis@example.com', '4234567890', 'ID004'),
('C005', 'Michael Wilson', '0567890123', 'M', 'michael.wilson@example.com', '5234567890', 'ID005'),
('C006', 'Sarah Lee', '0678901234', 'F', 'sarah.lee@example.com', '6234567890', 'ID006'),
('C007', 'James Taylor', '0789012345', 'M', 'james.taylor@example.com', '7234567890', 'ID007'),
('C008', 'Olivia Anderson', '0890123456', 'F', 'olivia.anderson@example.com', '8234567890', 'ID008'),
('C009', 'William Harris', '0901234567', 'M', 'william.harris@example.com', '9234567890', 'ID009'),
('C010', 'Sophia Martin', '1012345678', 'F', 'sophia.martin@example.com', '1034567890', 'ID010'),
('C011', 'Benjamin Clark', '1123456789', 'M', 'benjamin.clark@example.com', '1134567890', 'ID011'),
('C012', 'Ava Rodriguez', '1234567890', 'F', 'ava.rodriguez@example.com', '1234567890', 'ID012'),
('C013', 'Lucas Walker', '1345678901', 'M', 'lucas.walker@example.com', '2134567890', 'ID013'),
('C014', 'Mia Lewis', '1456789012', 'F', 'mia.lewis@example.com', '3134567890', 'ID014'),
('C015', 'Ethan Young', '1567890123', 'M', 'ethan.young@example.com', '4134567890', 'ID015'),
('C016', 'Charlotte King', '1678901234', 'F', 'charlotte.king@example.com', '5134567890', 'ID016'),
('C017', 'Henry Scott', '1789012345', 'M', 'henry.scott@example.com', '6134567890', 'ID017'),
('C018', 'Amelia Green', '1890123456', 'F', 'amelia.green@example.com', '7134567890', 'ID018'),
('C019', 'Alexander Adams', '1901234567', 'M', 'alexander.adams@example.com', '8134567890', 'ID019'),
('C020', 'Isabella Nelson', '2012345678', 'F', 'isabella.nelson@example.com', '9134567890', 'ID020');

-- Insert to EMPLOYEE
INSERT INTO EMPLOYEE (ID_Employee, EmployeeName, DoB, PhoneNumber, Gender, ID_Department)
VALUES
('E001', 'Alice Walker', '1990-01-15', '0123456789', 'F', 'D001'),
('E002', 'Benjamin Harris', '1985-05-20', '0234567890', 'M', 'D002'),
('E003', 'Charlie Green', '1982-11-10', '0345678901', 'M', 'D003'),
('E004', 'Daniela Brown', '1993-03-25', '0456789012', 'F', 'D004'),
('E005', 'Ethan Moore', '1988-07-30', '0567890123', 'M', 'D005'),
('E006', 'Fiona Clark', '1991-02-10', '0678901234', 'F', 'D001'),
('E007', 'George Robinson', '1987-08-05', '0789012345', 'M', 'D002'),
('E008', 'Hannah Lewis', '1994-06-18', '0890123456', 'F', 'D003'),
('E009', 'Isaac Martinez', '1989-04-12', '0901234567', 'M', 'D004'),
('E010', 'Jasmine Walker', '1992-12-22', '1012345678', 'F', 'D005'),
('E011', 'Kevin Anderson', '1990-09-14', '1123456789', 'M', 'D001'),
('E012', 'Lily White', '1986-11-01', '1234567890', 'F', 'D002'),
('E013', 'Mason Scott', '1995-05-30', '1345678901', 'M', 'D003'),
('E014', 'Nina Harris', '1993-07-25', '1456789012', 'F', 'D004'),
('E015', 'Oscar Johnson', '1984-10-17', '1567890123', 'M', 'D005'),
('E016', 'Paula King', '1991-01-03', '1678901234', 'F', 'D001'),
('E017', 'Quincy Young', '1987-04-27', '1789012345', 'M', 'D002'),
('E018', 'Riley Thomas', '1992-06-09', '1890123456', 'F', 'D003'),
('E019', 'Samuel Lee', '1994-08-15', '1901234567', 'M', 'D004'),
('E020', 'Tessa Mitchell', '1996-10-12', '2012345678', 'F', 'D005');



