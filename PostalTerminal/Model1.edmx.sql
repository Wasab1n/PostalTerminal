
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/24/2016 22:21:32
-- Generated from EDMX file: C:\Users\TR\Source\Repos\PostalTerminal\PostalTerminal\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [postalterminaldb];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CarHandler]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RegisteredUsers_Handler] DROP CONSTRAINT [FK_CarHandler];
GO
IF OBJECT_ID(N'[dbo].[FK_PostOfficeHandler]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RegisteredUsers_Handler] DROP CONSTRAINT [FK_PostOfficeHandler];
GO
IF OBJECT_ID(N'[dbo].[FK_PostalTerminalHandler_PostalTerminal]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PostalTerminalHandler] DROP CONSTRAINT [FK_PostalTerminalHandler_PostalTerminal];
GO
IF OBJECT_ID(N'[dbo].[FK_PostalTerminalHandler_Handler]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PostalTerminalHandler] DROP CONSTRAINT [FK_PostalTerminalHandler_Handler];
GO
IF OBJECT_ID(N'[dbo].[FK_PostalTerminalDetailedState]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PostalTerminals] DROP CONSTRAINT [FK_PostalTerminalDetailedState];
GO
IF OBJECT_ID(N'[dbo].[FK_DetailedStatefaultCodes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DetailedStates] DROP CONSTRAINT [FK_DetailedStatefaultCodes];
GO
IF OBJECT_ID(N'[dbo].[FK_CitiesPostOffice]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PostOffices] DROP CONSTRAINT [FK_CitiesPostOffice];
GO
IF OBJECT_ID(N'[dbo].[FK_CitiesPostalTerminal]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PostalTerminals] DROP CONSTRAINT [FK_CitiesPostalTerminal];
GO
IF OBJECT_ID(N'[dbo].[FK_DeliveryRegistrationDelivery]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DeliveryRegistrations] DROP CONSTRAINT [FK_DeliveryRegistrationDelivery];
GO
IF OBJECT_ID(N'[dbo].[FK_DeliveryStateDelivery]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DeliveryStates] DROP CONSTRAINT [FK_DeliveryStateDelivery];
GO
IF OBJECT_ID(N'[dbo].[FK_EmailDelivery]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Emails] DROP CONSTRAINT [FK_EmailDelivery];
GO
IF OBJECT_ID(N'[dbo].[FK_PaymentDelivery]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Payments] DROP CONSTRAINT [FK_PaymentDelivery];
GO
IF OBJECT_ID(N'[dbo].[FK_paymentTypePayment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Payments] DROP CONSTRAINT [FK_paymentTypePayment];
GO
IF OBJECT_ID(N'[dbo].[FK_payentStatePayment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[payentStates] DROP CONSTRAINT [FK_payentStatePayment];
GO
IF OBJECT_ID(N'[dbo].[FK_Handler_inherits_RegisteredUser]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RegisteredUsers_Handler] DROP CONSTRAINT [FK_Handler_inherits_RegisteredUser];
GO
IF OBJECT_ID(N'[dbo].[FK_Client_inherits_RegisteredUser]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RegisteredUsers_Client] DROP CONSTRAINT [FK_Client_inherits_RegisteredUser];
GO
IF OBJECT_ID(N'[dbo].[FK_Admin_inherits_RegisteredUser]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RegisteredUsers_Admin] DROP CONSTRAINT [FK_Admin_inherits_RegisteredUser];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[RegisteredUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RegisteredUsers];
GO
IF OBJECT_ID(N'[dbo].[Cars]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cars];
GO
IF OBJECT_ID(N'[dbo].[PostalTerminals]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PostalTerminals];
GO
IF OBJECT_ID(N'[dbo].[PostOffices]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PostOffices];
GO
IF OBJECT_ID(N'[dbo].[DetailedStates]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DetailedStates];
GO
IF OBJECT_ID(N'[dbo].[faultCodes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[faultCodes];
GO
IF OBJECT_ID(N'[dbo].[Cities]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cities];
GO
IF OBJECT_ID(N'[dbo].[Deliveries]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Deliveries];
GO
IF OBJECT_ID(N'[dbo].[Emails]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Emails];
GO
IF OBJECT_ID(N'[dbo].[DeliveryStates]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DeliveryStates];
GO
IF OBJECT_ID(N'[dbo].[DeliveryRegistrations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DeliveryRegistrations];
GO
IF OBJECT_ID(N'[dbo].[Payments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Payments];
GO
IF OBJECT_ID(N'[dbo].[payentStates]', 'U') IS NOT NULL
    DROP TABLE [dbo].[payentStates];
GO
IF OBJECT_ID(N'[dbo].[paymentTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[paymentTypes];
GO
IF OBJECT_ID(N'[dbo].[RegisteredUsers_Handler]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RegisteredUsers_Handler];
GO
IF OBJECT_ID(N'[dbo].[RegisteredUsers_Client]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RegisteredUsers_Client];
GO
IF OBJECT_ID(N'[dbo].[RegisteredUsers_Admin]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RegisteredUsers_Admin];
GO
IF OBJECT_ID(N'[dbo].[PostalTerminalHandler]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PostalTerminalHandler];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'RegisteredUsers'
CREATE TABLE [dbo].[RegisteredUsers] (
    [User_Id] int IDENTITY(1,1) NOT NULL,
    [email] nvarchar(max)  NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [phone] nvarchar(max)  NOT NULL,
    [registerDate] nvarchar(max)  NOT NULL,
    [gender] nvarchar(max)  NOT NULL,
    [birthday] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Cars'
CREATE TABLE [dbo].[Cars] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [numberPlate] nvarchar(max)  NOT NULL,
    [insurance] nvarchar(max)  NOT NULL,
    [TA] nvarchar(max)  NOT NULL,
    [isWorking] nvarchar(max)  NOT NULL,
    [garage] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PostalTerminals'
CREATE TABLE [dbo].[PostalTerminals] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [cityID] nvarchar(max)  NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [placesCount] nvarchar(max)  NOT NULL,
    [street] nvarchar(max)  NOT NULL,
    [ZIPCode] nvarchar(max)  NOT NULL,
    [startDate] nvarchar(max)  NOT NULL,
    [workHours] nvarchar(max)  NOT NULL,
    [CitiesId] int  NOT NULL,
    [DetailedState_Id] int  NOT NULL
);
GO

-- Creating table 'PostOffices'
CREATE TABLE [dbo].[PostOffices] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [cityID] nvarchar(max)  NOT NULL,
    [street] nvarchar(max)  NOT NULL,
    [employees] nvarchar(max)  NOT NULL,
    [shipments] nvarchar(max)  NOT NULL,
    [ZIPCode] nvarchar(max)  NOT NULL,
    [CitiesId] int  NOT NULL
);
GO

-- Creating table 'DetailedStates'
CREATE TABLE [dbo].[DetailedStates] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [isWorking] nvarchar(max)  NOT NULL,
    [faultCode] nvarchar(max)  NOT NULL,
    [isFull] nvarchar(max)  NOT NULL,
    [needsService] nvarchar(max)  NOT NULL,
    [faultCode1_Id] int  NOT NULL
);
GO

-- Creating table 'faultCodes'
CREATE TABLE [dbo].[faultCodes] (
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'Cities'
CREATE TABLE [dbo].[Cities] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [ISOCode] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Deliveries'
CREATE TABLE [dbo].[Deliveries] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [clientID] nvarchar(max)  NOT NULL,
    [paymentID] nvarchar(max)  NOT NULL,
    [registrationID] nvarchar(max)  NOT NULL,
    [receiverName] nvarchar(max)  NOT NULL,
    [receiverSurname] nvarchar(max)  NOT NULL,
    [registrationDate] nvarchar(max)  NOT NULL,
    [weight] nvarchar(max)  NOT NULL,
    [emailSent] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Emails'
CREATE TABLE [dbo].[Emails] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [clientID] nvarchar(max)  NOT NULL,
    [deliveryID] nvarchar(max)  NOT NULL,
    [sendTime] nvarchar(max)  NOT NULL,
    [text] nvarchar(max)  NOT NULL,
    [email] nvarchar(max)  NOT NULL,
    [Delivery_Id] int  NOT NULL
);
GO

-- Creating table 'DeliveryStates'
CREATE TABLE [dbo].[DeliveryStates] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [stateID] nvarchar(max)  NOT NULL,
    [updateDate] nvarchar(max)  NOT NULL,
    [Delivery_Id] int  NOT NULL
);
GO

-- Creating table 'DeliveryRegistrations'
CREATE TABLE [dbo].[DeliveryRegistrations] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [registrationDate] nvarchar(max)  NOT NULL,
    [validUntil] nvarchar(max)  NOT NULL,
    [validFrom] nvarchar(max)  NOT NULL,
    [Delivery_Id] int  NOT NULL
);
GO

-- Creating table 'Payments'
CREATE TABLE [dbo].[Payments] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [paymentStateID] nvarchar(max)  NOT NULL,
    [paymentTypeID] nvarchar(max)  NOT NULL,
    [date] nvarchar(max)  NOT NULL,
    [price] nvarchar(max)  NOT NULL,
    [paymentTypeId1] int  NOT NULL,
    [Delivery_Id] int  NOT NULL
);
GO

-- Creating table 'payentStates'
CREATE TABLE [dbo].[payentStates] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [Payment_Id] int  NOT NULL
);
GO

-- Creating table 'paymentTypes'
CREATE TABLE [dbo].[paymentTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [type] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'RegisteredUsers_Handler'
CREATE TABLE [dbo].[RegisteredUsers_Handler] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [city] nvarchar(max)  NOT NULL,
    [car] nvarchar(max)  NOT NULL,
    [PostOfficeId] int  NOT NULL,
    [User_Id] int  NOT NULL,
    [Car_Id] int  NOT NULL
);
GO

-- Creating table 'RegisteredUsers_Client'
CREATE TABLE [dbo].[RegisteredUsers_Client] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [userID] nvarchar(max)  NOT NULL,
    [address] nvarchar(max)  NOT NULL,
    [sendOffers] nvarchar(max)  NOT NULL,
    [isActive] nvarchar(max)  NOT NULL,
    [User_Id] int  NOT NULL
);
GO

-- Creating table 'RegisteredUsers_Admin'
CREATE TABLE [dbo].[RegisteredUsers_Admin] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [workTable] nvarchar(max)  NOT NULL,
    [User_Id] int  NOT NULL
);
GO

-- Creating table 'PostalTerminalHandler'
CREATE TABLE [dbo].[PostalTerminalHandler] (
    [PostalTerminals_Id] int  NOT NULL,
    [Handlers_User_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [User_Id] in table 'RegisteredUsers'
ALTER TABLE [dbo].[RegisteredUsers]
ADD CONSTRAINT [PK_RegisteredUsers]
    PRIMARY KEY CLUSTERED ([User_Id] ASC);
GO

-- Creating primary key on [Id] in table 'Cars'
ALTER TABLE [dbo].[Cars]
ADD CONSTRAINT [PK_Cars]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PostalTerminals'
ALTER TABLE [dbo].[PostalTerminals]
ADD CONSTRAINT [PK_PostalTerminals]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PostOffices'
ALTER TABLE [dbo].[PostOffices]
ADD CONSTRAINT [PK_PostOffices]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DetailedStates'
ALTER TABLE [dbo].[DetailedStates]
ADD CONSTRAINT [PK_DetailedStates]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'faultCodes'
ALTER TABLE [dbo].[faultCodes]
ADD CONSTRAINT [PK_faultCodes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Cities'
ALTER TABLE [dbo].[Cities]
ADD CONSTRAINT [PK_Cities]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Deliveries'
ALTER TABLE [dbo].[Deliveries]
ADD CONSTRAINT [PK_Deliveries]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Emails'
ALTER TABLE [dbo].[Emails]
ADD CONSTRAINT [PK_Emails]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DeliveryStates'
ALTER TABLE [dbo].[DeliveryStates]
ADD CONSTRAINT [PK_DeliveryStates]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DeliveryRegistrations'
ALTER TABLE [dbo].[DeliveryRegistrations]
ADD CONSTRAINT [PK_DeliveryRegistrations]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Payments'
ALTER TABLE [dbo].[Payments]
ADD CONSTRAINT [PK_Payments]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'payentStates'
ALTER TABLE [dbo].[payentStates]
ADD CONSTRAINT [PK_payentStates]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'paymentTypes'
ALTER TABLE [dbo].[paymentTypes]
ADD CONSTRAINT [PK_paymentTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [User_Id] in table 'RegisteredUsers_Handler'
ALTER TABLE [dbo].[RegisteredUsers_Handler]
ADD CONSTRAINT [PK_RegisteredUsers_Handler]
    PRIMARY KEY CLUSTERED ([User_Id] ASC);
GO

-- Creating primary key on [User_Id] in table 'RegisteredUsers_Client'
ALTER TABLE [dbo].[RegisteredUsers_Client]
ADD CONSTRAINT [PK_RegisteredUsers_Client]
    PRIMARY KEY CLUSTERED ([User_Id] ASC);
GO

-- Creating primary key on [User_Id] in table 'RegisteredUsers_Admin'
ALTER TABLE [dbo].[RegisteredUsers_Admin]
ADD CONSTRAINT [PK_RegisteredUsers_Admin]
    PRIMARY KEY CLUSTERED ([User_Id] ASC);
GO

-- Creating primary key on [PostalTerminals_Id], [Handlers_User_Id] in table 'PostalTerminalHandler'
ALTER TABLE [dbo].[PostalTerminalHandler]
ADD CONSTRAINT [PK_PostalTerminalHandler]
    PRIMARY KEY CLUSTERED ([PostalTerminals_Id], [Handlers_User_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Car_Id] in table 'RegisteredUsers_Handler'
ALTER TABLE [dbo].[RegisteredUsers_Handler]
ADD CONSTRAINT [FK_CarHandler]
    FOREIGN KEY ([Car_Id])
    REFERENCES [dbo].[Cars]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CarHandler'
CREATE INDEX [IX_FK_CarHandler]
ON [dbo].[RegisteredUsers_Handler]
    ([Car_Id]);
GO

-- Creating foreign key on [PostOfficeId] in table 'RegisteredUsers_Handler'
ALTER TABLE [dbo].[RegisteredUsers_Handler]
ADD CONSTRAINT [FK_PostOfficeHandler]
    FOREIGN KEY ([PostOfficeId])
    REFERENCES [dbo].[PostOffices]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PostOfficeHandler'
CREATE INDEX [IX_FK_PostOfficeHandler]
ON [dbo].[RegisteredUsers_Handler]
    ([PostOfficeId]);
GO

-- Creating foreign key on [PostalTerminals_Id] in table 'PostalTerminalHandler'
ALTER TABLE [dbo].[PostalTerminalHandler]
ADD CONSTRAINT [FK_PostalTerminalHandler_PostalTerminal]
    FOREIGN KEY ([PostalTerminals_Id])
    REFERENCES [dbo].[PostalTerminals]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Handlers_User_Id] in table 'PostalTerminalHandler'
ALTER TABLE [dbo].[PostalTerminalHandler]
ADD CONSTRAINT [FK_PostalTerminalHandler_Handler]
    FOREIGN KEY ([Handlers_User_Id])
    REFERENCES [dbo].[RegisteredUsers_Handler]
        ([User_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PostalTerminalHandler_Handler'
CREATE INDEX [IX_FK_PostalTerminalHandler_Handler]
ON [dbo].[PostalTerminalHandler]
    ([Handlers_User_Id]);
GO

-- Creating foreign key on [DetailedState_Id] in table 'PostalTerminals'
ALTER TABLE [dbo].[PostalTerminals]
ADD CONSTRAINT [FK_PostalTerminalDetailedState]
    FOREIGN KEY ([DetailedState_Id])
    REFERENCES [dbo].[DetailedStates]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PostalTerminalDetailedState'
CREATE INDEX [IX_FK_PostalTerminalDetailedState]
ON [dbo].[PostalTerminals]
    ([DetailedState_Id]);
GO

-- Creating foreign key on [faultCode1_Id] in table 'DetailedStates'
ALTER TABLE [dbo].[DetailedStates]
ADD CONSTRAINT [FK_DetailedStatefaultCodes]
    FOREIGN KEY ([faultCode1_Id])
    REFERENCES [dbo].[faultCodes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_DetailedStatefaultCodes'
CREATE INDEX [IX_FK_DetailedStatefaultCodes]
ON [dbo].[DetailedStates]
    ([faultCode1_Id]);
GO

-- Creating foreign key on [CitiesId] in table 'PostOffices'
ALTER TABLE [dbo].[PostOffices]
ADD CONSTRAINT [FK_CitiesPostOffice]
    FOREIGN KEY ([CitiesId])
    REFERENCES [dbo].[Cities]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CitiesPostOffice'
CREATE INDEX [IX_FK_CitiesPostOffice]
ON [dbo].[PostOffices]
    ([CitiesId]);
GO

-- Creating foreign key on [CitiesId] in table 'PostalTerminals'
ALTER TABLE [dbo].[PostalTerminals]
ADD CONSTRAINT [FK_CitiesPostalTerminal]
    FOREIGN KEY ([CitiesId])
    REFERENCES [dbo].[Cities]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CitiesPostalTerminal'
CREATE INDEX [IX_FK_CitiesPostalTerminal]
ON [dbo].[PostalTerminals]
    ([CitiesId]);
GO

-- Creating foreign key on [Delivery_Id] in table 'DeliveryRegistrations'
ALTER TABLE [dbo].[DeliveryRegistrations]
ADD CONSTRAINT [FK_DeliveryRegistrationDelivery]
    FOREIGN KEY ([Delivery_Id])
    REFERENCES [dbo].[Deliveries]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_DeliveryRegistrationDelivery'
CREATE INDEX [IX_FK_DeliveryRegistrationDelivery]
ON [dbo].[DeliveryRegistrations]
    ([Delivery_Id]);
GO

-- Creating foreign key on [Delivery_Id] in table 'DeliveryStates'
ALTER TABLE [dbo].[DeliveryStates]
ADD CONSTRAINT [FK_DeliveryStateDelivery]
    FOREIGN KEY ([Delivery_Id])
    REFERENCES [dbo].[Deliveries]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_DeliveryStateDelivery'
CREATE INDEX [IX_FK_DeliveryStateDelivery]
ON [dbo].[DeliveryStates]
    ([Delivery_Id]);
GO

-- Creating foreign key on [Delivery_Id] in table 'Emails'
ALTER TABLE [dbo].[Emails]
ADD CONSTRAINT [FK_EmailDelivery]
    FOREIGN KEY ([Delivery_Id])
    REFERENCES [dbo].[Deliveries]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EmailDelivery'
CREATE INDEX [IX_FK_EmailDelivery]
ON [dbo].[Emails]
    ([Delivery_Id]);
GO

-- Creating foreign key on [Delivery_Id] in table 'Payments'
ALTER TABLE [dbo].[Payments]
ADD CONSTRAINT [FK_PaymentDelivery]
    FOREIGN KEY ([Delivery_Id])
    REFERENCES [dbo].[Deliveries]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PaymentDelivery'
CREATE INDEX [IX_FK_PaymentDelivery]
ON [dbo].[Payments]
    ([Delivery_Id]);
GO

-- Creating foreign key on [paymentTypeId1] in table 'Payments'
ALTER TABLE [dbo].[Payments]
ADD CONSTRAINT [FK_paymentTypePayment]
    FOREIGN KEY ([paymentTypeId1])
    REFERENCES [dbo].[paymentTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_paymentTypePayment'
CREATE INDEX [IX_FK_paymentTypePayment]
ON [dbo].[Payments]
    ([paymentTypeId1]);
GO

-- Creating foreign key on [Payment_Id] in table 'payentStates'
ALTER TABLE [dbo].[payentStates]
ADD CONSTRAINT [FK_payentStatePayment]
    FOREIGN KEY ([Payment_Id])
    REFERENCES [dbo].[Payments]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_payentStatePayment'
CREATE INDEX [IX_FK_payentStatePayment]
ON [dbo].[payentStates]
    ([Payment_Id]);
GO

-- Creating foreign key on [User_Id] in table 'RegisteredUsers_Handler'
ALTER TABLE [dbo].[RegisteredUsers_Handler]
ADD CONSTRAINT [FK_Handler_inherits_RegisteredUser]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[RegisteredUsers]
        ([User_Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [User_Id] in table 'RegisteredUsers_Client'
ALTER TABLE [dbo].[RegisteredUsers_Client]
ADD CONSTRAINT [FK_Client_inherits_RegisteredUser]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[RegisteredUsers]
        ([User_Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [User_Id] in table 'RegisteredUsers_Admin'
ALTER TABLE [dbo].[RegisteredUsers_Admin]
ADD CONSTRAINT [FK_Admin_inherits_RegisteredUser]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[RegisteredUsers]
        ([User_Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------