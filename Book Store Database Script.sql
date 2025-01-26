---------------------------------------------------------------

--					Table Creation

---------------------------------------------------------------
CREATE TABLE Publishers
(
	Publisher_ID INT NOT NULL PRIMARY KEY,
	Publisher_Name VARCHAR(50)
);

----------------------------------------------------------


CREATE TABLE Books
(
	ISBN INT NOT NULL PRIMARY KEY,
	Book_Title VARCHAR(100),
	Publisher INT FOREIGN KEY REFERENCES Publishers(Publisher_ID),
	Pages INT,
	Genre VARCHAR(50)
);

----------------------------------------------------------

CREATE TABLE Prices
(
	ISBN INT FOREIGN KEY REFERENCES Books(ISBN),
	Price DECIMAL(6, 2)
);

-- Publisher foreign key in Books (Queries can run using simple retrieve commands)


----------------------------------------------------------

CREATE TABLE Authors
(
	Author_ID INT NOT NULL PRIMARY KEY,
	Author_Name VARCHAR(50)
);

-- Authors & Books have many to many relation
-- Hence a third table with the foreign keys from these 2 tables


-------------------------------------------------------------

CREATE TABLE Author_Books
(
	Author_ID INT FOREIGN KEY REFERENCES Authors(Author_ID),
	ISBN INT FOREIGN KEY REFERENCES Books(ISBN)
);

-------------------------------------------------------------


CREATE TABLE Discounted_Books
(
	ISBN INT FOREIGN KEY REFERENCES Books(ISBN),
	Discount_Rate DECIMAL(3,2)
);

-- This table holds the discount percentage
-- Subqueries can be used to retrieve the books, price, discount
-- & discounted price

--------------------------------------------------------------

CREATE TABLE Customers
(
	Customer_ID INT NOT NULL PRIMARY KEY,
	Customer_Name VARCHAR(50),
	Customer_Address VARCHAR(50),
);



--------------------------------------------------------------

CREATE TABLE Orders
(
	Order_ID INT NOT NULL PRIMARY KEY,
	Customer_ID INT FOREIGN KEY REFERENCES Customers(Customer_ID)
);

-- Books_Order
-- This table holds the information of all the books ordered
-- within a particular order
-- Books to Orders (Many to One Relation)

---------------------------------------------------------------


CREATE TABLE Books_Order
(
	Order_ID INT FOREIGN KEY REFERENCES Orders(Order_ID),
	ISBN INT FOREIGN KEY REFERENCES Books(ISBN)
);

-- Order History holds the details of all the 
-- previous orders associated to the customers


----------------------------------------------------------------


CREATE TABLE  Inventory
(
	ISBN INT NOT NULL FOREIGN KEY REFERENCES Books(ISBN),
	Quantity INT
);

-- 'IS A' relation tables for Invetory



------------------------------------------------------------------
CREATE TABLE New_Arrivals
(
	ISBN INT NOT NULL FOREIGN KEY REFERENCES Books(ISBN)
);

--------------------------------------------------------------

CREATE TABLE Signed_By_Author
(
	ISBN INT NOT NULL FOREIGN KEY REFERENCES Books(ISBN)
);


-------------------------------------------------------------

CREATE TABLE Demanded
(
	ISBN INT NOT NULL FOREIGN KEY REFERENCES Books(ISBN)
);


-------------------------------------------------------------

--					Data Insertions

-------------------------------------------------------------

SELECT * FROM Publishers;


INSERT INTO Publishers VALUES
(221, 'Readings'),
(222, 'Vintage'),
(223, 'Allen Lane'),
(224, 'Ballantine Books'),
(225, 'Orient Black Swan'),
(226, 'Bantam Books'),
(227, 'Darussalam'),
(228, 'Oxford Press'),
(229, 'Abacus'),
(230, 'John Murray'),
(231, 'Penguin Books');


-------------------------------------------------------------

SELECT * FROM Books;

INSERT INTO Books VALUES
(111, 'The Trial', 221, 220, 'Fiction'),
(112, 'The Stranger', 221, 150, 'Fiction'),
(113, 'Talking To Strangers', 223, 420, 'Non-Fiction'),
(114, 'Homo Deus', 222, 440, 'Non-Fiction'),
(115, 'Born A Crime', 230, 345, 'Non-Fiction'),
(116, 'The Autobiography Of Malcolm X', 224, 540, 'Non-Fiction'),
(117, 'India Wins Freedom', 225, 345, 'Non-Fiction'),
(118, 'The Sealed Nectar', 227, 541, 'Non-Fiction'),
(119, 'The Picture Of Dorian Gray', 221, 254, 'Fiction'),
(120, 'Jinnah Of Pakistan', 228, 650, 'Non-Fiction'),
(121, 'Sapiens', 222, 470, 'Non-Fiction'),
(122, '21 Lessons For The 21st Century', 222, 570, 'Non-Fiction'),
(123, 'The Plague', 221, 170, 'Fiction'),
(124, 'The Myth Of Sisyphus', 221, 320, 'Fiction'),
(125, 'The Fall', 221, 175, 'Fiction'),
(126, 'Outliers', 231, 333, 'Non-Fiction'),
(127, 'The Tipping Point', 231, 570, 'Non-Fiction'),
(128, 'The Bomber Mafia', 231, 324, 'Non-Fiction'),
(129, 'Metamorphosis', 221, 120, 'Fiction'),
(130, 'Roots', 222, 770, 'Non-Fiction'),
(131, 'Maps Of Meaning', 223, 1170, 'Non-Fiction'),
(132, '12 Rules For Life', 223, 560, 'Non-Fiction'),
(133, '12 More Rules For Life', 223, 750, 'Non-Fiction');

-------------------------------------------------------------

SELECT * FROM Authors;

INSERT INTO Authors VALUES
(331, 'Alex Haley'),
(332, 'Yuval Noah Harari'),
(333, 'Trevor Noah'),
(334,'Malcolm Gladwell'),
(335, 'Oscar Wilde'),
(336, 'Franz Kafka'),
(337, 'Albert Camus'),
(338, 'Stanley Wolpert'),
(339, 'Abul Kalam Azad'),
(340, 'Safiur Rehman Al-Mubarakpuri'),
(341, 'Jordan B. Peterson');

-------------------------------------------------------------

SELECT * FROM Author_Books;

INSERT INTO Author_Books VALUES
(336 ,111),
(337 ,112),
(334, 113),
(332, 114),
(333 ,115),
(331 ,116),
(339,117) ,
(340,118) ,
(335 ,119),
(338 ,120),
(332 ,121),
(332 ,122),
(337 ,123),
(337 ,124),
(337 ,125),
(334 ,126),
(334 ,127),
(334 ,128),
(336 ,129),
(331 ,130),
(341, 131),
(341, 132),
(341, 133);



-------------------------------------------------------------

SELECT * FROM Prices;


INSERT INTO Prices VALUES
(111, 270),
(112, 250),
(113, 750),
(114, 1100),
(115, 850),
(116, 850),
(117, 750),
(118, 1200),
(119, 450),
(121, 800),
(123, 1800),
(125, 400),
(127, 1200),
(129, 3800),
(132, 4800);


-------------------------------------------------------------

SELECT * FROM Inventory

INSERT INTO Inventory VALUES
(111, 50),
(112, 25),
(113, 100),
(114, 500),
(115, 150),
(116, 243),
(117, 15),
(118, 54),
(119, 2),
(120, 0);


-------------------------------------------------------------

SELECT * FROM Customers;


INSERT INTO Customers VALUES
(1, 'Murtaza', '200 - Kaer Morhen, Kaedwen'),
(2, 'Noctis', ' 210 - Insonmia, Eon '),
(3, 'Momin', '111 - Al Khalil Street'),
(4, 'Sheheryar', '820 - Mountain View'),
(5, 'Zwaib', '420 - Al Wahab Colony'),
(6, 'Asim', '666 - Ani Mation Society'),
(7, 'Felix', '101 - Brixton Street'),
(8, 'Shakil', '121 - Agrics Town'),
(9, 'Zaryab', '781 - Nawab Town'),
(10, 'Bilal', '190 - Newburry Street');


-------------------------------------------------------------

SELECT * FROM Orders;

INSERT INTO Orders VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(5, 4),
(6, 10),
(7, 7),
(8, 3),
(9, 10),
(10, 1);

-------------------------------------------------------------

SELECT * FROM Books_Order;

INSERT INTO Books_Order VALUES
(1, 111),
(1, 112),
(2, 115),
(3, 120),
(3, 116),
(4, 114),
(5, 113),
(6, 118),
(6, 117),
(7, 116),
(8, 114),
(9, 111),
(10, 111),
(10, 112),
(10, 119);


-------------------------------------------------------------

SELECT * FROM Demanded;


INSERT INTO Demanded VALUES
(111),
(112),
(119),
(120),
(117),
(118),
(124),
(122),
(128),
(130),
(131);


-------------------------------------------------------------

SELECT * FROM New_Arrivals;

INSERT INTO New_Arrivals VALUES
(114),
(115),
(113),
(112),
(114),
(133),
(124),
(128),
(132),
(125);


-------------------------------------------------------------

SELECT * FROM Discounted_Books;


INSERT INTO Discounted_Books VALUES
(111, 10.0),
(112, 5.0),
(118, 5.0),
(121, 5.0),
(123, 5.0),
(125, 35.0),
(127, 25.0),
(129, 25.0),
(132, 10.0),
(114, 5.0);

------------------------------------------------------------

INSERT INTO Signed_By_Author VALUES
(113),
(114),
(114),
(115),
(121);


------------------------------------------------------------


------------------------------------------------------------

--						QUERIES

------------------------------------------------------------

-- RELATED TO BOOKS & ASSOCIATED TABLES


-- All Books
-------------
SELECT * FROM Books;

-- Prices
-------------
SELECT * FROM Prices;

-- Price of a particular  book
---------------------------------------

SELECT dbo.Show_Price('The Trial')'Price';
SELECT dbo.Show_Price('The Picture Of Dorian Gray')'Price';
SELECT dbo.Show_Price('Born A Crime')'Price';
SELECT dbo.Show_Price('The Autobiography Of Malcolm X')'Price';
SELECT dbo.Show_Price('Homo Deus')'Price';

-- Function Used

CREATE FUNCTION Show_Price(@Book AS VARCHAR(50))
RETURNS INT
AS
BEGIN
RETURN 
(SELECT Price FROM Prices 
WHERE ISBN IN 
(SELECT ISBN FROM Books WHERE Book_Title = @Book))
END;



-- All Discounted Books
--------------------------

SELECT * FROM Discounted_Books;

-- Discount Rate (%) on a particular book
-------------------------------------------------

SELECT dbo.Show_Discount('The Trial')'Discount %';


-- Function Used
CREATE FUNCTION Show_Discount(@Book AS VARCHAR(50))
RETURNS FLOAT
AS
BEGIN
RETURN (SELECT Discount_Rate FROM Discounted_Books
WHERE 
ISBN IN (SELECT ISBN FROM Books WHERE Book_Title = @Book));
END;


-- Calculating the Discounted Price
----------------------------------------------------------------

SELECT dbo.Discounted_Price('The Trial') 'Discounted Price';
SELECT dbo.Discounted_Price('Born A Crime') 'Discounted Price';


-- Function Used 
CREATE FUNCTION Discounted_Price(@Book AS VARCHAR(50))
RETURNS INT
AS
BEGIN
RETURN
(SELECT dbo.Show_Price(@Book)
 - 
(SELECT dbo.Show_Price(@Book)
* 
(SELECT dbo.Show_Discount(@Book) / 100)))
END; 


-- All Authors
---------------

SELECT * FROM Authors;

-- Author of a particular book
--------------------------------------

SELECT dbo.Show_Author('The Trial')'Author';
SELECT dbo.Show_Author('12 Rules For Life')'Author';
SELECT dbo.Show_Author('Sapiens')'Author';
SELECT dbo.Show_Author('Jinnah Of Pakistan')'Author';
SELECT dbo.Show_Author('India Wins Freedom')'Author';

-- Function Used

CREATE FUNCTION Show_Author(@Book AS VARCHAR(50))
RETURNS VARCHAR(50)
AS
BEGIN
RETURN 
(
SELECT Author_Name FROM Authors WHERE Author_ID In 
(SELECT Author_ID FROM Author_Books WHERE ISBN IN 
(SELECT ISBN FROM Books WHERE Book_Title = @Book))
)
END;

-- All Books by a particular author



-- Function




-- All Publishers

SELECT * FROM Publishers;

-- All Books By A Particular Publishers (ID Based)
------------------------------------------------------

SELECT * FROM Books WHERE Publisher = 221;


-- All Books By A Particular Publishers (Name Based)
----------------------------------------------------------

SELECT * FROM Publisher_Books('Penguin Books');
SELECT * FROM Publisher_Books('Vintage');
SELECT * FROM Publisher_Books('Allen Lane');


-- Function Used

CREATE FUNCTION Publisher_Books(@Publisher AS VARCHAR(50))
RETURNS TABLE
AS
RETURN
(SELECT * FROM Books WHERE Publisher
IN 
(SELECT Publisher_ID FROM Publishers WHERE Publisher_Name = @Publisher));
 
-------------------------------------------------------------

--						Inventory

-------------------------------------------------------------

-- Complete Inventory

SELECT * FROM Inventory;

-- Quantity of a particular book
----------------------------------

SELECT dbo.Book_Quantity('The Trial')'Quantity';
SELECT dbo.Book_Quantity('Homo Deus')'Quantity';
SELECT dbo.Book_Quantity('12 Rules For Life')'Quantity';

-- Function used

CREATE FUNCTION Book_Quantity(@Book AS VARCHAR(50))
RETURNS INT
AS
BEGIN
RETURN 
(SELECT Quantity FROM INVENTORY
WHERE 
ISBN IN (SELECT ISBN FROM Books WHERE Book_Title = @Book))
END;

SELECT Book_Title From Books WHERE ISBN IN (SELECT ISBN FROM INVENTORY);


-- Names of New Arrivals :)

SELECT Book_Title FROM Books WHERE ISBN IN (SELECT ISBN FROM New_Arrivals);

-- Names of Demanded Books

SELECT Book_Title FROM Books WHERE ISBN IN (SELECT ISBN FROM Demanded);

-- Names of Books Signed by authors

SELECT Book_Title FROM Books WHERE ISBN IN (SELECT ISBN FROM Signed_By_Author);

-- List of All books quantity

CREATE VIEW Quantity
AS
SELECT Books.ISBN, Books.Book_Title, Inventory.Quantity
FROM Books
INNER JOIN Inventory ON Books.ISBN = Inventory.ISBN;

SELECT * FROM Quantity;

--------------------------------------------------------------------------------

--								CUSTOMER

--------------------------------------------------------------------------------

SELECT * FROM Customers;
SELECT * FROM Orders;



-- ALL CUSTOMERS

SELECT * FROM Customers;

-- ALL ORDERS 

SELECT * FROM Orders;

--  ALL ORDERS OF A PARTICULAR CUSTOMER (USING CUSTOMER ID ONLY)

SELECT Order_ID FROM Orders WHERE Customer_ID = 1;

--  ALL ORDERS OF A PARTICULAR CUSTOMER (USING CUSTOMER NAME)

SELECT * FROM Cus_Order('Noctis');


-- Function Used

CREATE FUNCTION Cus_Order(@Name AS VARCHAR(50))
RETURNS TABLE
AS
RETURN 
(SELECT Order_ID FROM Orders 
WHERE Customer_ID 
IN 
(SELECT Customer_ID FROM Customers WHERE Customer_Name = @Name));


-- Details of an Order

SELECT * FROM Books_Order WHERE Order_ID = 1;

-- NAMES OF THE BOOKS ORDERED IN AN ORDER (Order Id based)

SELECT Book_Title FROM Books WHERE ISBN IN (SELECT ISBN FROM Books_Order WHERE Order_ID =  1);

-- Total Bill Of An Order

SELECT SUM(Price) AS 'Total Bill' FROM Prices WHERE ISBN IN (SELECT ISBN FROM Books_Order WHERE Order_ID = 1);


select * from books
----------------------------------------------------------------------

--						PROCEDURES

----------------------------------------------------------------------
-- FOR INSERTIONS, DELETION, UPDATING ETC.


-- BOOKS

CREATE PROCEDURE OperationsBooks
@ISBN INT = 0,
@Book_Title VARCHAR(100) = NULL,
@Publisher INT = 0,
@Pages INT = 0,
@Genre VARCHAR(50) = NULL,
@Books_Operation VARCHAR(50) = NULL
AS
BEGIN
SET NOCOUNT ON;
--
IF @Books_Operation = 'INSERT'
BEGIN
INSERT INTO Books(ISBN, Book_Title, Publisher, Pages, Genre)
VALUES (@ISBN, @Book_Title, @Publisher, @Pages, @Genre)
END
--
IF @Books_Operation = 'SELECT'
BEGIN
SELECT ISBN, Book_Title, Publisher, Pages, Genre FROM Books
END
--
IF @Books_Operation = 'UPDATE'
BEGIN
UPDATE Books SET ISBN = @ISBN, Book_Title = @Book_Title, Publisher = @Publisher, Pages = @Pages, Genre = @Genre
WHERE ISBN = @ISBN
END
-- 
IF @Books_Operation = 'DELETE'
BEGIN
DELETE FROM Books WHERE ISBN = @ISBN
END
SET NOCOUNT OFF
END

EXECUTE OperationsBooks @Books_Operation = 'SELECT'

--
---------------------------------------------------------

-- Authors

CREATE PROCEDURE OperationsAuthors
@Author_ID INT = 0,
@Author_Name VARCHAR(50) = NULL,
@Authors_Operation VARCHAR(50) = NULL
AS
BEGIN
SET NOCOUNT ON;
--
IF @Authors_Operation = 'INSERT'
BEGIN
INSERT INTO Authors(Author_ID, Author_Name)
VALUES (@Author_ID, @Author_Name)
END
--
IF @Authors_Operation = 'SELECT'
BEGIN
SELECT Author_ID, Author_Name FROM Authors
END
--
IF @Authors_Operation = 'UPDATE'
BEGIN
UPDATE Authors SET Author_ID = @Author_ID, Author_Name = @Author_Name
WHERE Author_ID = @Author_ID
END
-- 
IF @Authors_Operation = 'DELETE'
BEGIN
DELETE FROM Authors WHERE Author_ID = @Author_ID
END
SET NOCOUNT OFF
END

EXECUTE OperationsAuthors @Authors_Operation = 'SELECT'


------------------------------------------------------------------------

CREATE PROCEDURE OperationsAuthors
@Author_ID INT = 0,
@Author_Name VARCHAR(50) = NULL,
@Authors_Operation VARCHAR(50) = NULL
AS
BEGIN
SET NOCOUNT ON;
--
IF @Authors_Operation = 'INSERT'
BEGIN
INSERT INTO Authors(Author_ID, Author_Name)
VALUES (@Author_ID, @Author_Name)
END
--
IF @Authors_Operation = 'SELECT'
BEGIN
SELECT Author_ID, Author_Name FROM Authors
END
--
IF @Authors_Operation = 'UPDATE'
BEGIN
UPDATE Authors SET Author_ID = @Author_ID, Author_Name = @Author_Name
WHERE Author_ID = @Author_ID
END
-- 
IF @Authors_Operation = 'DELETE'
BEGIN
DELETE FROM Authors WHERE Author_ID = @Author_ID
END
SET NOCOUNT OFF
END

EXECUTE OperationsAuthors @Authors_Operation = 'SELECT'


--
------------------------------------------------------------

-- Auhtor_Books


CREATE PROCEDURE OperationsAuthor_Books
@Author_ID INT = 0,
@ISBN INT = 0,
@Author_Books_Operation VARCHAR(50) = NULL
AS
BEGIN
SET NOCOUNT ON;
--
IF @Author_Books_Operation = 'INSERT'
BEGIN
INSERT INTO Author_Books(Author_ID, ISBN)
VALUES (@Author_ID, @ISBN)
END
--
IF @Author_Books_Operation = 'SELECT'
BEGIN
SELECT Author_ID, ISBN FROM Author_Books
END
--
IF @Author_Books_Operation = 'UPDATE'
BEGIN
UPDATE Author_Books SET Author_ID = @Author_ID, ISBN = @ISBN
WHERE Author_ID = @Author_ID
END
-- 
IF @Author_Books_Operation = 'DELETE'
BEGIN
DELETE FROM Author_Books WHERE Author_ID = @Author_ID
END
SET NOCOUNT OFF
END

EXECUTE OperationsAuthor_Books @Author_Books_Operation = 'SELECT'

--
--
---------------------------------------------------------------------------

-- Books_Order


CREATE PROCEDURE OperationsBooks_Order
@Order_ID INT = 0,
@ISBN INT = 0,
@Books_Order_Operation VARCHAR(50) = NULL
AS
BEGIN
SET NOCOUNT ON;
--
IF @Books_Order_Operation = 'INSERT'
BEGIN
INSERT INTO Books_Order(Order_ID, ISBN)
VALUES (@Order_ID, @ISBN)
END
--
IF @Books_Order_Operation = 'SELECT'
BEGIN
SELECT Order_ID, ISBN FROM Books_Order
END
--
IF @Books_Order_Operation = 'UPDATE'
BEGIN
UPDATE Books_Order SET Order_ID = @Order_ID, ISBN = @ISBN
WHERE Order_ID = @Order_ID
END
-- 
IF @Books_Order_Operation = 'DELETE'
BEGIN
DELETE FROM Books_Order WHERE Order_ID = @Order_ID
END
SET NOCOUNT OFF
END

EXECUTE OperationsBooks_Order @Books_Order_Operation = 'SELECT'


--
--
-----------------------------------------------------------------------

-- Customers


CREATE PROCEDURE OperationsCustomers
@Customer_ID INT = 0,
@Customer_Name VARCHAR(50) = NULL,
@Customer_Address VARCHAR(50) = NULL,
@Customers_Operation VARCHAR(50) = NULL
AS
BEGIN
SET NOCOUNT ON;
--
IF @Customers_Operation = 'INSERT'
BEGIN
INSERT INTO Customers(Customer_ID, Customer_Name, Customer_Address)
VALUES (@Customer_ID, @Customer_Name, @Customer_Address)
END
--
IF @Customers_Operation = 'SELECT'
BEGIN
SELECT Customer_ID, Customer_Name, Customer_Address FROM Customers
END
--
IF @Customers_Operation = 'UPDATE'
BEGIN
UPDATE Customers SET Customer_ID = @Customer_ID, Customer_Name = @Customer_Name, Customer_Address = @Customer_Address
WHERE Customer_ID = @Customer_ID
END
-- 
IF @Customers_Operation = 'DELETE'
BEGIN
DELETE FROM Customers WHERE Customer_ID = @Customer_ID
END
SET NOCOUNT OFF
END

EXECUTE OperationsCustomers @Customers_Operation = 'SELECT'

--
--

-------------------------------------------------------------------------

-- Prices


CREATE PROCEDURE OperationsPrices
@ISBN INT = 0,
@Price INT = 0,
@Prices_Operation VARCHAR(50) = NULL
AS
BEGIN
SET NOCOUNT ON;
--
IF @Prices_Operation = 'INSERT'
BEGIN
INSERT INTO Prices(ISBN, Price)
VALUES (@ISBN, @Price)
END
--
IF @Prices_Operation = 'SELECT'
BEGIN
SELECT ISBN, Price FROM Prices
END
--
IF @Prices_Operation = 'UPDATE'
BEGIN
UPDATE Prices SET ISBN = @ISBN, Price = @Price
WHERE ISBN = @ISBN
END
-- 
IF @Prices_Operation = 'DELETE'
BEGIN
DELETE FROM Prices WHERE ISBN = @ISBN
END
SET NOCOUNT OFF
END

EXECUTE OperationsPrices @Prices_Operation = 'SELECT'

--
--
----------------------------------------------------------

-- Demanded


CREATE PROCEDURE OperationsDemanded
@ISBN INT = 0,
@Demanded_Operation VARCHAR(50) = NULL
AS
BEGIN
SET NOCOUNT ON;
--
IF @Demanded_Operation = 'INSERT'
BEGIN
INSERT INTO Demanded(ISBN)
VALUES (@ISBN)
END
--
IF @Demanded_Operation = 'SELECT'
BEGIN
SELECT ISBN FROM Demanded
END
--
IF @Demanded_Operation = 'UPDATE'
BEGIN
UPDATE Demanded SET ISBN = @ISBN
WHERE ISBN = @ISBN
END
-- 
IF @Demanded_Operation = 'DELETE'
BEGIN
DELETE FROM Demanded WHERE ISBN = @ISBN
END
SET NOCOUNT OFF
END

EXECUTE OperationsDemanded @Demanded_Operation = 'SELECT'

--
--
--------------------------------------------------------------

-- Discounted Books

CREATE PROCEDURE OperationsDiscounted_Books
@ISBN INT = 0,
@Discount_Rate float = 0,
@Discounted_Books_Operation VARCHAR(50) = NULL
AS
BEGIN
SET NOCOUNT ON;
--
IF @Discounted_Books_Operation = 'INSERT'
BEGIN
INSERT INTO Discounted_Books(ISBN, Discount_Rate)
VALUES (@ISBN, @Discount_Rate)
END
--
IF @Discounted_Books_Operation = 'SELECT'
BEGIN
SELECT ISBN, Discount_Rate FROM Discounted_Books
END
--
IF @Discounted_Books_Operation = 'UPDATE'
BEGIN
UPDATE Discounted_Books SET ISBN = @ISBN
WHERE ISBN = @ISBN
END
-- 
IF @Discounted_Books_Operation = 'DELETE'
BEGIN
DELETE FROM Discounted_Books WHERE ISBN = @ISBN
END
SET NOCOUNT OFF
END

EXECUTE OperationsDemanded @Demanded_Operation = 'SELECT'


--
--
-----------------------------------------------------------------

-- Signed By Author


CREATE PROCEDURE OperationsSigned_By_Author
@ISBN INT = 0,
@Signed_By_Author_Operation VARCHAR(50) = NULL
AS
BEGIN
SET NOCOUNT ON;
--
IF @Signed_By_Author_Operation = 'INSERT'
BEGIN
INSERT INTO Signed_By_Author(ISBN)
VALUES (@ISBN)
END
--
IF @Signed_By_Author_Operation = 'SELECT'
BEGIN
SELECT ISBN FROM Signed_By_Author
END
--
IF @Signed_By_Author_Operation = 'UPDATE'
BEGIN
UPDATE Signed_By_Author SET ISBN = @ISBN
WHERE ISBN = @ISBN
END
-- 
IF @Signed_By_Author_Operation = 'DELETE'
BEGIN
DELETE FROM Signed_By_Author WHERE ISBN = @ISBN
END
SET NOCOUNT OFF
END

EXECUTE OperationsSigned_By_Author @Signed_By_Author_Operation = 'SELECT'

--
--
--------------------------------------------------------------------------


CREATE PROCEDURE OperationsInventory
@ISBN INT = 0,
@Quantity INT = 0,
@Inventory_Operation VARCHAR(50) = NULL
AS
BEGIN
SET NOCOUNT ON;
--
IF @Inventory_Operation = 'INSERT'
BEGIN
INSERT INTO Inventory(ISBN,Quantity)
VALUES (@ISBN, @Quantity)
END
--
--
IF @Inventory_Operation = 'SELECT'
BEGIN
SELECT ISBN,Quantity FROM Inventory
END
--
IF @Inventory_Operation = 'UPDATE'
BEGIN
UPDATE Inventory SET ISBN = @ISBN, Quantity = @Quantity
WHERE ISBN = @ISBN
END
--
IF @Inventory_Operation = 'DELETE'
BEGIN
DELETE FROM Inventory WHERE ISBN = @ISBN
END
SET NOCOUNT OFF
END


EXECUTE OperationsInventory @Inventory_Operation = 'Select'

--
--
------------------------------------------------------------------------------------

-- New_Arrivals

CREATE PROCEDURE OperationsNew_Arrivals
@ISBN INT = 0,
@New_Arrivals_Operation VARCHAR(50) = NULL
AS
BEGIN
SET NOCOUNT ON;
--
IF @New_Arrivals_Operation = 'INSERT'
BEGIN
INSERT INTO New_Arrivals(ISBN)
VALUES (@ISBN)
END
--
--
IF @New_Arrivals_Operation = 'SELECT'
BEGIN
SELECT ISBN FROM New_Arrivals
END
--
IF @New_Arrivals_Operation = 'UPDATE'
BEGIN
UPDATE New_Arrivals SET ISBN = @ISBN
WHERE ISBN = @ISBN
END
--
IF @New_Arrivals_Operation = 'DELETE'
BEGIN
DELETE FROM New_Arrivals WHERE ISBN = @ISBN
END
SET NOCOUNT OFF
END

EXECUTE OperationsNew_Arrivals @New_Arrivals_Operation = 'SELECT'

--
--
-------------------------------------------------------------

-- Orders

CREATE PROCEDURE OperationsOrders
@Order_ID INT = 0,
@Customer_ID INT = 0,

@Orders_Operation VARCHAR(50) = NULL
AS
BEGIN
SET NOCOUNT ON;
--
IF @Orders_Operation = 'INSERT'
BEGIN
INSERT INTO Orders(Order_ID,Customer_ID)
VALUES (@Order_ID, @Customer_ID)
END
--
--
IF @Orders_Operation = 'SELECT'
BEGIN
SELECT Order_ID,Customer_ID FROM Orders
END
--
IF @Orders_Operation = 'UPDATE'
BEGIN
UPDATE Orders SET Order_ID = @Order_ID, Customer_ID = @Customer_ID
WHERE Order_ID = @Order_ID
END
--
IF @Orders_Operation = 'DELETE'
BEGIN
DELETE FROM Orders WHERE Order_ID = @Order_ID
END
SET NOCOUNT OFF
END

EXECUTE OperationsOrders @Orders_Operation = 'SELECT'

--
--
--------------------------------------------------------

-- Publishers

CREATE PROCEDURE OperationsPublishers
@Publisher_ID INT = 0,
@Publisher_Name VARCHAR(50) = NULL,
@Publishers_Operation VARCHAR(50) = NULL
AS
BEGIN
SET NOCOUNT ON;
--
IF @Publishers_Operation = 'INSERT'
BEGIN
INSERT INTO Publishers(Publisher_ID,Publisher_Name)
VALUES (@Publisher_ID, @Publisher_Name)
END
--
--
IF @Publishers_Operation = 'SELECT'
BEGIN
SELECT Publisher_ID,Publisher_Name FROM Publishers
END
--
IF @Publishers_Operation = 'UPDATE'
BEGIN
UPDATE Publishers SET Publisher_ID = @Publisher_ID, Publisher_Name = @Publisher_Name
WHERE Publisher_ID = @Publisher_ID
END
--
IF @Publishers_Operation = 'DELETE'
BEGIN
DELETE FROM Publishers WHERE Publisher_ID = @Publisher_ID
END
SET NOCOUNT OFF
END

EXECUTE OperationsPublishers @Publishers_Operation = 'SELECT'

--
--
----------------------------------------------------------------


----------------------------------------------------------

--					    JOINS & VIEWS

----------------------------------------------------------

-- Books and Prices (List)


SELECT dbo.ShowCatalogue();

-- Function Used

CREATE VIEW Catalogue
AS
SELECT Books.ISBN, Books.Book_Title, Prices.Price
FROM Books
INNER JOIN Prices ON Books.ISBN = Prices.ISBN;




-- Names of the discounted books

SELECT * FROM Catalogue WHERE ISBN IN (SELECT ISBN FROM Discounted_Books);


-- All Books by a particular author

CREATE FUNCTION ShowBooksA(@Author AS VARCHAR(50))
RETURNS TABLE
AS
RETURN
(SELECT * FROM Catalogue 
WHERE ISBN IN 
(SELECT ISBN FROM Author_Books 
WHERE Author_ID IN 
(SELECT Author_ID FROM Authors 
WHERE Author_Name = @Author)));




SELECT * from ShowBooksA('Trevor Noah');

