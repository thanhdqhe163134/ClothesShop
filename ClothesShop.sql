create database ClothesShop
go
use ClothesShop
go
CREATE TABLE Product (
    ProductID int IDENTITY(1,1) PRIMARY KEY ,
    ProductName nvarchar(255),
    Price decimal(10,2),
	IMG nvarchar(255),
	Description nvarchar(max),
	CreatedDate datetime,
	CreatedBy nvarchar(20),
	UpdatedDate datetime,
	UpdatedBy nvarchar(20),
	IsDelete bit DEFAULT 0,
	DeletedDate datetime,
	DeletedBy nvarchar(20)
);

CREATE TABLE ProductType(
	TypeID int IDENTITY(1,1) PRIMARY KEY ,
	TypeName nvarchar(20),
	ProductID int,
	CreatedDate datetime,
	CreatedBy nvarchar(20),
	UpdatedDate datetime,
	UpdatedBy nvarchar(20),
	IsDelete bit DEFAULT 0,
	DeletedDate datetime,
	DeletedBy nvarchar(20)
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
)

CREATE TABLE Size (
    SizeID int IDENTITY(1,1) PRIMARY KEY,
    Size nvarchar(255),
    ProductID int,
	CreatedDate datetime,
	CreatedBy nvarchar(20),
	UpdatedDate datetime,
	UpdatedBy nvarchar(20),
	IsDelete bit DEFAULT 0,
	DeletedDate datetime,
	DeletedBy nvarchar(20)
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Color (
    ColorID int IDENTITY(1,1) PRIMARY KEY,
    Color varchar(255),
    ProductID int,
	IMG nvarchar(255),
	CreatedDate datetime,
	CreatedBy nvarchar(20),
	UpdatedDate datetime,
	UpdatedBy nvarchar(20),
	IsDelete bit DEFAULT 0,
	DeletedDate datetime,
	DeletedBy nvarchar(20)
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Account (
    AccountID int IDENTITY(1,1) PRIMARY KEY,
    Username nvarchar(20),
    Password nvarchar(20),
	Role nvarchar(5),
	IMG nvarchar(255),
	CreatedDate datetime,
	CreatedBy nvarchar(20),
	UpdatedDate datetime,
	UpdatedBy nvarchar(20),
	IsDelete bit DEFAULT 0,
	DeletedDate datetime,
	DeletedBy nvarchar(20)
);

CREATE TABLE Customer (
    CustomerID int IDENTITY(1,1) PRIMARY KEY,
	AccountID int,
    CustomerName nvarchar(100),
    Address nvarchar(255),
    Email nvarchar(50),
	Phone nvarchar(15),
	CreatedDate datetime,
	CreatedBy nvarchar(20),
	UpdatedDate datetime,
	UpdatedBy nvarchar(20),
	IsDelete bit DEFAULT 0,
	DeletedDate datetime,
	DeletedBy nvarchar(20)
	FOREIGN KEY(AccountID) REFERENCES Account(AccountID)
);


CREATE TABLE Orders (
    OrderID int IDENTITY(1,1) PRIMARY KEY,
    ProductID int,
    CustomerID int NULL,
    Quantity int,
	Description nvarchar(max),
	IsPayment bit DEFAULT 0,
    DeliveryStatus varchar(255) DEFAULT 'Pending',
    CreatedDate datetime,
	CreatedBy nvarchar(20),
	UpdatedDate datetime,
	UpdatedBy nvarchar(20),
	IsDelete bit DEFAULT 0,
	DeletedDate datetime,
	DeletedBy nvarchar(20)
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
);

INSERT INTO Product (ProductName, Price, IMG, Description, CreatedDate, CreatedBy)
VALUES ('Product 1', 100.00, 'product1.jpg', 'Description for Product 1', GETDATE(), 'admin'),
       ('Product 2', 200.00, 'product2.jpg', 'Description for Product 2', GETDATE(), 'admin');

INSERT INTO ProductType(TypeName, ProductID, CreatedDate, CreatedBy)
VALUES('Nam', 1, GETDATE(), 'admin'),
      ('Nu', 2, GETDATE(), 'admin');

INSERT INTO Size (Size, ProductID, CreatedDate, CreatedBy)
VALUES ('Large', 1, GETDATE(), 'admin'),
       ('Medium', 2, GETDATE(), 'admin'); 

INSERT INTO Color (Color, ProductID, IMG, CreatedDate, CreatedBy)
VALUES ('Red', 1, 'color1.jpg', GETDATE(), 'admin'),
       ('Blue', 2, 'color2.jpg', GETDATE(), 'admin'); 

INSERT INTO Account (Username, Password, Role, IMG, CreatedDate, CreatedBy)
VALUES ('admin', '123456', 'admin', 'user1.jpg', GETDATE(), 'admin'),
       ('user', '123456', 'user', 'user2.jpg', GETDATE(), 'admin');

INSERT INTO Customer (AccountID, CustomerName, Address, Email, Phone, CreatedDate, CreatedBy)
VALUES (1, 'Customer 1', 'Address 1', 'customer1@email.com', '1234567890', GETDATE(), 'admin'),
       (2, 'Customer 2', 'Address 2', 'customer2@email.com', '0987654321', GETDATE(), 'admin'); 

INSERT INTO Orders (ProductID, CustomerID, Quantity, Description, CreatedDate, CreatedBy)
VALUES (1, 1, 5, 'Order for Product 1', GETDATE(), 'admin'),
       (2, 2, 3, 'Order for Product 2', GETDATE(), 'admin'); 
