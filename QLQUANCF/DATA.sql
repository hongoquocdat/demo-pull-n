CREATE DATABASE QuanLyQuanCafe
GO

USE QuanLyQuanCafe
GO
   
-- Food
-- Table
-- FoodCategory
-- Account
-- Bill
-- BillInfo

CREATE TABLE TableFood
(
	idTableFood INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Bàn chưa có tên',
	status NVARCHAR(100) NOT NULL DEFAULT N'Trống'	-- Trống || Có người
)
GO

CREATE TABLE Account
(
	UserName NVARCHAR(100) PRIMARY KEY,	
	DisplayName NVARCHAR(100) NOT NULL DEFAULT N'Kter',
	PassWord NVARCHAR(1000) NOT NULL DEFAULT 0,
	Type INT NOT NULL  DEFAULT 0 -- 1: admin && 0: staff
)
GO



CREATE TABLE FoodCategory
(
	idFoodCategory INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên'
)
GO

INSERT INTO	dbo.FoodCategory
(
    name
)

DROP TABLE FoodCategory
DROP TABLE Billinfo

VALUES
(N'HEO KHO CẢI CHUA' -- name - nvarchar(100)
    )

DELETE FoodCategory WHERE name =N'HEO KHO CẢI CHUA'

	SELECT * FROM dbo.FoodCategory

CREATE TABLE Food
(
	idFood INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên',
	idFoodCategory INT NOT NULL,
	price FLOAT NOT NULL DEFAULT 0
	
	FOREIGN KEY (idFoodCategory) REFERENCES dbo.FoodCategory(idFoodCategory)
)
GO


INSERT INTO dbo.Food
(
    name,
    idCategory,
    price
)

drop TABLE FOOD

VALUES
(   N'HEO KHO CẢI CHUA', -- name - nvarchar(100)
    1,       -- idCategory - int
    40000  -- price - float
    )

SELECT * FROM dbo.Food WHERE dbo.Food.name LIKE N'%HEO%'




CREATE TABLE Bill
(
	idBill INT IDENTITY PRIMARY KEY,
	DateCheckIn DATE NOT NULL DEFAULT GETDATE(),
	DateCheckOut DATE,
	idTableFood INT NOT NULL,
	status INT NOT NULL DEFAULT 0 -- 1: đã thanh toán && 0: chưa thanh toán
	
	FOREIGN KEY (idTableFood) REFERENCES dbo.TableFood(idTableFood)
)
GO

drop table bill
drop table tablefood
drop table account
drop table food


CREATE TABLE BillInfo
(
	idBillInfo INT IDENTITY PRIMARY KEY,
	UserName NVARCHAR(100),
	
	idBill INT NOT NULL,
	idFood INT NOT NULL,
	count INT NOT NULL DEFAULT 0

	FOREIGN KEY (idBill) REFERENCES Bill(idBill),
	FOREIGN KEY (idFood) REFERENCES Food(idFood), 
    foreign key (UserName) references Account (UserName)
)
GO



drop table billinfo

INSERT INTO dbo.Account
	(UserName ,
	DisplayName ,
	PassWord ,
	Type 
	)
VALUES
	(
	N'K9' , --UserName - nvarchar(100)
	N'RongK9' , --DisplayName - nvarchar(100)
	N'1' , --Password - nvarchar(100)
	1 --Type - int
	)


INSERT INTO dbo.Account
	(UserName ,
	DisplayName ,
	PassWord ,
	Type 
	)
VALUES
	(
	N'staff' , --UserName - nvarchar(100)
	N'staff' , --DisplayName - nvarchar(100)
	N'1' , --Password - nvarchar(100)
	0 --Type - int
	)

SELECT * FROM Account
go

CREATE PROC USP_GetAccountByUserName (@userName NVARCHAR(100))
AS
	BEGIN
	SELECT * FROM dbo.Account WHERE UserName=@userName
	END
GO

EXEC USP_GetAccountByUserName @userName=N'K9'

SELECT * FROM dbo.Account WHERE UserName = N'K9' AND PassWord='1'


	--thêm ' trong '' để lỗi
	SELECT * FROM dbo.Account WHERE UserName= N'' OR 1=1-- '

CREATE PROC USP_Login(@userName NVARCHAR(100),@passWord NVARCHAR(100))
AS
	BEGIN
	SELECT * FROM dbo.Account WHERE UserName=@userName AND PassWord=@passWord
	END
GO

SELECT * FROM dbo.Account WHERE UserName = '' AND PassWord = N'' OR 1=1--'



--DÙNG VÒNG LẶP THÊM DỮ LIỆU BÀN

DECLARE @I INT=0

WHILE @I <=10
BEGIN
	INSERT INTO DBO.TABLEFOOD (NAME) VALUES (N'BÀN ' + CAST(@I AS NVARCHAR(100)))--DÙNG NỐI CHUỖI ->KÊT NỐI VS I--DÙNG CAST ĐỂ ĐỔI I QUA STRING
	SET @I=@I+1
END



--TẠO PROC thêm bàn
CREATE PROC USP_GetTableList
AS
	SELECT * FROM TABLEFOOD
GO

EXEC USP_GetTableList

update TABLEFOOD SET STATUS = N'CÓ NGƯỜI' WHERE IDTABLEFOOD = 1


--TẠO PROC thêm foodcategory
INSERT INTO	foodcategory VALUES
(N'Thịt Heo'),
(N'Thịt Bò'),
(N'Nước'),

(N'Hải Sản')

--thêm món
INSERT INTO	food VALUES 
(N'Cơm chiên thập cẩm' ,1,55000),
(N'Mì ý sốt bò' ,3,50000),


(N'Cơm chiên hải sản' ,1,55000),
(N'Cơm Phần heo quay' ,2,45000),
(N'Cơm chiên bò lúc lắc' ,3,50000),
(N'Nước suối' ,4,10000)

--thêm bill
INSERT INTO	bill VALUES
(GETDATE() , NULL , 1 ,0),
(GETDATE() , NULL , 2 ,0),
(GETDATE() , GETDATE() , 2 ,1)

-- thêm billinffo
INSERT INTO	billinfo VALUES
('K9',2,1,2),
('K9',2,3,4),
('K9',2,5,1),
('K9',3,1,2),
('K9',3,6,2),
('K9',4,5,2)





select * from bill
go
select * from billinfo
go
select * from food
go
select * from foodcategory
GO

SELECT * FROM tablefood

select idbill from bill where idtablefood = 2 and status = 0

-- từ idbill lấy được list bill

select * from billinfo where idbill = 2




create Table Store
(
	UserName NVARCHAR(100) ,
	Material NVARCHAR(100),
	DateIn date ,
	Dateexpired date,--ngày hết hạn
	priceIn float ,
	amount int,
	category NVARCHAR(100)
	
	primary key (username , material),
	FOREIGN KEY (username) REFERENCES dbo.account(username)
)

create table salary
(
	UserName NVARCHAR(100),
	Type INT NOT NULL,
	WORKDAY int,
	restday int,
	wagelevel float,
	bonus float,

	punish float,
	total float,
	
	primary key (username , Type),
	foreign key (username) references dbo.account(username)
)

--alter table salary
--add constraint fk_type
--foreign key (type)
--references account(type)



drop table salary 


--hiển thị chi tiết hóa đơn bàn
SELECT F.NAME , BI.COUNT , F.PRICE,F.PRICE * BI.COUNT AS [TOTALPRICE] FROM BILLINFO BI ,BILL B,FOOD F WHERE BI.IDBILL=B.IDBILL AND BI.IDFOOD=F.IDFOOD AND B.IDTABLEFOOD = 2

--Quên Mật khẩu
CREATE proc forgetPass 
@username_input nvarchar(100)
AS
BEGIN
	SELECT @username_input FROM Account WHERE @username_input = UserName
END


exec forgetPass ''
go

select * from account

DROP FUNCTION forgetPass
drop proc forgetPass

--Sửa Mật Khẩu khi nhập đúng username
create proc updateAccount
@password nvarchar(100),
@userName nvarchar(100)
as
begin
    update Account
    set
        PassWord = @password
    where UserName = @userName
end
go

drop proc updateAccount
