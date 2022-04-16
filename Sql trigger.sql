CREATE DATABASE PizzaMizza

USE PizzaMizza

CREATE TABLE Sliders(
Id INT PRIMARY KEY IDENTITY,
Image NVARCHAR(500),


)


CREATE TABLE Categories(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(100)
)

CREATE TABLE Pizzas(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(100),
Image NVARCHAR(500),
[Description]NVARCHAR (500),
Price DECIMAL,
IsHalal BIT,
IsVegetarian BIT,
CategorieId INT FOREIGN KEY REFERENCES Categories(Id) 


)

CREATE TABLE Sizes(
Id INT PRIMARY KEY IDENTITY,
Small DECIMAL,
Middle DECIMAL,
Big DECIMAL,

)

CREATE TABLE PizzaSize(
Id INT PRIMARY KEY IDENTITY,
PizzaId INT FOREIGN KEY REFERENCES Pizzas(Id),
SizeId INT FOREIGN KEY REFERENCES Sizes(Id)
)



--1) Bir dənə DeletedSliders deyə table olacaq və bir dənə trigger yazacaqsız sliders  table-dan hər hansısa 
--bir slidersilindiyi zaman slider table-dan silinəcək və gedib DeletedSliders table-na düşəcək.

CREATE TABLE DeletedSliders(
	Id INT ,
	Image NVARCHAR(100),
	Catagories INT FOREIGN KEY REFERENCES Catagories(Id)
	
)
 

CREATE TRIGGER SlidersDelete
ON DeletedSliders
After  DELETE
AS
BEGIN
	DECLARE @id INT
	SELECT @id=Id  FROM deleted
	INSERT INTO DeletedSliders
	VALUES (@id)
	
END
DELETE FROM Sliders
WHERE Id=2



--2) Sliders həmdə DeletedSliders-dakı dataları alt-alta şəkildə göstərən bir view yazırsız

CREATE VIEW v_AllDeletedSliders
AS
Select DISTINCT
	DeletedSliders.*
FROM DeletedSliders

