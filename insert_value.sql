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



INSERT INTO [TABLE] (ID_Table, NumberOfSeats, StatusTable, ID_Branch)
VALUES
-- Tables for Branch B001
(1, 4, 0, 'B001'),
(2, 4, 0, 'B001'),
(3, 6, 0, 'B001'),
(4, 6, 0, 'B001'),
(5, 2, 0, 'B001'),
(6, 8, 0, 'B001'),
(7, 8, 0, 'B001'),
(8, 10, 0, 'B001'),
(9, 10, 0, 'B001'),
(10, 4, 0, 'B001'),
(11, 4, 0, 'B001'),
(12, 6, 0, 'B001'),
(13, 6, 0, 'B001'),
(14, 2, 0, 'B001'),
(15, 8, 0, 'B001'),
(16, 8, 0, 'B001'),
(17, 10, 0, 'B001'),
(18, 10, 0, 'B001'),
(19, 4, 0, 'B001'),
(20, 6, 0, 'B001'),

-- Tables for Branch B002
(21, 4, 0, 'B002'),
(22, 4, 0, 'B002'),
(23, 6, 0, 'B002'),
(24, 6, 0, 'B002'),
(25, 2, 0, 'B002'),
(26, 8, 0, 'B002'),
(27, 8, 0, 'B002'),
(28, 10, 0, 'B002'),
(29, 10, 0, 'B002'),
(30, 4, 0, 'B002'),
(31, 4, 0, 'B002'),
(32, 6, 0, 'B002'),
(33, 6, 0, 'B002'),
(34, 2, 0, 'B002'),
(35, 8, 0, 'B002'),
(36, 8, 0, 'B002'),
(37, 10, 0, 'B002'),
(38, 10, 0, 'B002'),
(39, 4, 0, 'B002'),
(40, 6, 0, 'B002'),

-- Tables for Branch B003
(41, 4, 0, 'B003'),
(42, 4, 0, 'B003'),
(43, 6, 0, 'B003'),
(44, 6, 0, 'B003'),
(45, 2, 0, 'B003'),
(46, 8, 0, 'B003'),
(47, 8, 0, 'B003'),
(48, 10, 0, 'B003'),
(49, 10, 0, 'B003'),
(50, 4, 0, 'B003'),
(51, 4, 0, 'B003'),
(52, 6, 0, 'B003'),
(53, 6, 0, 'B003'),
(54, 2, 0, 'B003'),
(55, 8, 0, 'B003'),
(56, 8, 0, 'B003'),
(57, 10, 0, 'B003'),
(58, 10, 0, 'B003'),
(59, 4, 0, 'B003'),
(60, 6, 0, 'B003'),

-- Tables for Branch B004
(61, 4, 0, 'B004'),
(62, 4, 0, 'B004'),
(63, 6, 0, 'B004'),
(64, 6, 0, 'B004'),
(65, 2, 0, 'B004'),
(66, 8, 0, 'B004'),
(67, 8, 0, 'B004'),
(68, 10, 0, 'B004'),
(69, 10, 0, 'B004'),
(70, 4, 0, 'B004'),
(71, 4, 0, 'B004'),
(72, 6, 0, 'B004'),
(73, 6, 0, 'B004'),
(74, 2, 0, 'B004'),
(75, 8, 0, 'B004'),
(76, 8, 0, 'B004'),
(77, 10, 0, 'B004'),
(78, 10, 0, 'B004'),
(79, 4, 0, 'B004'),
(80, 6, 0, 'B004'),

-- Tables for Branch B005
(81, 4, 0, 'B005'),
(82, 4, 0, 'B005'),
(83, 6, 0, 'B005'),
(84, 6, 0, 'B005'),
(85, 2, 0, 'B005'),
(86, 8, 0, 'B005'),
(87, 8, 0, 'B005'),
(88, 10, 0, 'B005'),
(89, 10, 0, 'B005'),
(90, 4, 0, 'B005'),
(91, 4, 0, 'B005'),
(92, 6, 0, 'B005'),
(93, 6, 0, 'B005'),
(94, 2, 0, 'B005'),
(95, 8, 0, 'B005'),
(96, 8, 0, 'B005'),
(97, 10, 0, 'B005'),
(98, 10, 0, 'B005'),
(99, 4, 0, 'B005'),
(100, 6, 0, 'B005');

INSERT INTO [ORDER] (ID_Order, OrderDate, TotalPrice, ActualPrice, ID_Customer, ID_Table, ID_Review, ID_Employee, ID_Branch)
VALUES
-- Orders for customer C001
('O001', '2024-12-01', 300000, 290000, 'C001', 1, NULL, 'E001', 'B001'),
('O002', '2024-12-02', 400000, 390000, 'C001', 2, NULL, 'E002', 'B001'),

-- Orders for customer C002
('O003', '2024-12-01', 350000, 340000, 'C002', 21, NULL, 'E003', 'B002'),
('O004', '2024-12-03', 450000, 440000, 'C002', 22, NULL, 'E004', 'B002'),

-- Orders for customer C003
('O005', '2024-12-02', 250000, 240000, 'C003', 41, NULL, 'E005', 'B003'),
('O006', '2024-12-03', 500000, 490000, 'C003', 42, NULL, 'E006', 'B003'),

-- Orders for customer C004
('O007', '2024-12-01', 380000, 370000, 'C004', 61, NULL, 'E007', 'B004'),
('O008', '2024-12-02', 420000, 410000, 'C004', 62, NULL, 'E008', 'B004'),

-- Orders for customer C005
('O009', '2024-12-01', 330000, 320000, 'C005', 81, NULL, 'E009', 'B005'),
('O010', '2024-12-03', 360000, 350000, 'C005', 82, NULL, 'E010', 'B005'),

-- Orders for customer C006
('O011', '2024-12-02', 300000, 290000, 'C006', 3, NULL, 'E011', 'B001'),
('O012', '2024-12-03', 400000, 390000, 'C006', 4, NULL, 'E012', 'B001'),

-- Orders for customer C007
('O013', '2024-12-01', 350000, 340000, 'C007', 23, NULL, 'E013', 'B002'),
('O014', '2024-12-02', 450000, 440000, 'C007', 24, NULL, 'E014', 'B002'),

-- Orders for customer C008
('O015', '2024-12-01', 250000, 240000, 'C008', 43, NULL, 'E015', 'B003'),
('O016', '2024-12-02', 500000, 490000, 'C008', 44, NULL, 'E016', 'B003'),

-- Orders for customer C009
('O017', '2024-12-01', 380000, 370000, 'C009', 63, NULL, 'E017', 'B004'),
('O018', '2024-12-03', 420000, 410000, 'C009', 64, NULL, 'E018', 'B004'),

-- Orders for customer C010
('O019', '2024-12-02', 330000, 320000, 'C010', 83, NULL, 'E019', 'B005'),
('O020', '2024-12-03', 360000, 350000, 'C010', 84, NULL, 'E020', 'B005'),

-- Additional orders for customers C011 to C020
('O021', '2024-12-01', 300000, 290000, 'C011', 5, NULL, NULL, 'B001'),
('O022', '2024-12-02', 450000, 440000, 'C012', 6, NULL, NULL, 'B001'),
('O023', '2024-12-01', 400000, 390000, 'C013', 25, NULL, NULL, 'B002'),
('O024', '2024-12-03', 500000, 490000, 'C014', 26, NULL, NULL, 'B002'),
('O025', '2024-12-02', 420000, 410000, 'C015', 45, NULL, NULL, 'B003'),
('O026', '2024-12-03', 470000, 460000, 'C016', 46, NULL, NULL, 'B003'),
('O027', '2024-12-01', 390000, 380000, 'C017', 65, NULL, NULL, 'B004'),
('O028', '2024-12-02', 430000, 420000, 'C018', 66, NULL, NULL, 'B004'),
('O029', '2024-12-01', 340000, 330000, 'C019', 85, NULL, NULL, 'B005'),
('O030', '2024-12-03', 370000, 360000, 'C020', 86, NULL, NULL, 'B005');

INSERT INTO ONLINE_ORDER (ID_Online, TimeOrder)
VALUES
('O021', '11:00'),
('O022', '12:30'),
('O023', '10:45'),
('O024', '14:15'),
('O025', '13:00'),
('O026', '15:45'),
('O027', '11:30'),
('O028', '13:45'),
('O029', '10:15'),
('O030', '14:00');

INSERT INTO RESERVATION_ORDER (ID_Reservation, ArrivalTime, NumberOfPeople, Notes)
VALUES
-- Reservations for orders O001 to O020
('O001', '12:00', 2, 'Birthday celebration'),
('O002', '18:30', 4, 'Family dinner'),
('O003', '11:00', 3, 'Business meeting'),
('O004', '13:45', 5, 'Friends gathering'),
('O005', '10:30', 2, 'Quick lunch'),
('O006', '19:00', 6, 'Team dinner'),
('O007', '12:15', 4, 'Anniversary lunch'),
('O008', '17:45', 3, 'Casual dinner'),
('O009', '13:00', 2, 'Lunch break'),
('O010', '20:00', 5, 'Evening outing'),
('O011', '12:30', 4, 'Friends reunion'),
('O012', '19:15', 3, 'Family outing'),
('O013', '11:45', 6, 'Team lunch'),
('O014', '18:00', 2, 'Romantic dinner'),
('O015', '10:15', 4, 'Brunch'),
('O016', '20:30', 5, 'Special event'),
('O017', '11:30', 3, 'Work meeting'),
('O018', '19:45', 2, 'Casual dining'),
('O019', '13:30', 4, 'Relaxing lunch'),
('O020', '21:00', 6, 'Night celebration');

