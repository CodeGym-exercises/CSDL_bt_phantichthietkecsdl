-- Exported from QuickDBD: https://www.quickdatatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/schema/_-DX4pvY7E-YP9_TESDlcw
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE `Customers` (
    `CustomerID` int  NOT NULL ,
    `Name` string  NOT NULL ,
    `PhoneNumber` int  NOT NULL ,
    `Address2` string  NULL ,
    PRIMARY KEY (
        `CustomerID`
    )
);

CREATE TABLE `ProductsLine` (
    `ProductsLineID` int  NOT NULL ,
    `Descriptions` string  NOT NULL ,
    PRIMARY KEY (
        `ProductsLineID`
    )
);

CREATE TABLE `Products` (
    `ProductsID` int  NOT NULL ,
    `Name` string  NOT NULL ,
    `Producer` string  NOT NULL ,
    `NumberOfWareHouse` int  NOT NULL ,
    `ImportPrice` int  NOT NULL ,
    `ExportPrice` int  NOT NULL ,
    PRIMARY KEY (
        `ProductsID`
    )
);

CREATE TABLE `Oders` (
    `OdersNumber` int  NOT NULL ,
    `DateBuy` date  NOT NULL ,
    `RequireDte` date  NOT NULL ,
    `ShippedDate` date  NOT NULL ,
    `NumberOfOrders` int  NOT NULL ,
    `PriceEach` int  NOT NULL ,
    PRIMARY KEY (
        `OdersNumber`
    )
);

CREATE TABLE `Payments` (
    `CustomNumber` int  NOT NULL ,
    `PaymentsId` int  NOT NULL ,
    `Date` date  NOT NULL ,
    `amount` int  NOT NULL ,
    PRIMARY KEY (
        `PaymentsId`
    )
);

CREATE TABLE `Employees` (
    `EmployeeID` int  NOT NULL ,
    `Name` string  NOT NULL ,
    `Email` string  NOT NULL ,
    `Job` string  NOT NULL ,
    PRIMARY KEY (
        `EmployeeID`
    )
);

CREATE TABLE `Offices` (
    `OfficeID` int  NOT NULL ,
    `Address` string  NOT NULL ,
    `Phone` int  NOT NULL ,
    `Country` string  NOT NULL ,
    PRIMARY KEY (
        `OfficeID`
    )
);

ALTER TABLE `Customers` ADD CONSTRAINT `fk_Customers_Name` FOREIGN KEY(`Name`)
REFERENCES `Employees` (`EmployeeID`);

ALTER TABLE `ProductsLine` ADD CONSTRAINT `fk_ProductsLine_ProductsLineID` FOREIGN KEY(`ProductsLineID`)
REFERENCES `Products` (`ProductsID`);

ALTER TABLE `Products` ADD CONSTRAINT `fk_Products_ProductsID` FOREIGN KEY(`ProductsID`)
REFERENCES `Oders` (`OdersNumber`);

ALTER TABLE `Oders` ADD CONSTRAINT `fk_Oders_DateBuy` FOREIGN KEY(`DateBuy`)
REFERENCES `Products` (`ExportPrice`);

ALTER TABLE `Oders` ADD CONSTRAINT `fk_Oders_RequireDte` FOREIGN KEY(`RequireDte`)
REFERENCES `Customers` (`Name`);

ALTER TABLE `Payments` ADD CONSTRAINT `fk_Payments_PaymentsId` FOREIGN KEY(`PaymentsId`)
REFERENCES `Customers` (`Address2`);

ALTER TABLE `Employees` ADD CONSTRAINT `fk_Employees_Job` FOREIGN KEY(`Job`)
REFERENCES `Employees` (`Email`);

ALTER TABLE `Offices` ADD CONSTRAINT `fk_Offices_OfficeID` FOREIGN KEY(`OfficeID`)
REFERENCES `Employees` (`EmployeeID`);

CREATE INDEX `idx_Customers_Name`
ON `Customers` (`Name`);

