use HotelBooking;

create table AuthUser (
	email nvarchar(255) primary key not null,
	password nvarchar(255) not null,
	phone nvarchar (255) not null,
	name nvarchar(255) not null,
	address nvarchar (255) not null,
	createdAt datetime default getdate(),
	status nvarchar(10) default 'active',
	role nvarchar(10) default 'user',
)

create table Hotel (
	hotelID int primary key identity(1,1),
	hotelName nvarchar(255) not null,
	hotelArea nvarchar(255) not null,
)

create table Room(
	roomID int primary key identity(1,1),
	roomType nvarchar(255) not null,
	available bit default 1 not null,
	price float not null,
	quantity int not null,
	hotelID int references Hotel(hotelID)
)

create table Booking (
	bookID int primary key identity(1,1),
	email nvarchar(255) foreign key references AuthUser(email),
	createdAt date default getdate(),
	total float not null,
	status nvarchar(50) not null default 'pending',
	userConfirmed bit default 0
)

alter table Booking add status nvarchar(50) not null default 'pending';

update Booking set status = 'cancelled' where bookID = 6;

create table BookingDetail (
	detailID int primary key identity(1,1),
	bookID int foreign key references Booking(bookID),
	roomID int foreign key references Room(roomID),
	checkIn date not null,
	checkOut date not null,
	amount int not null,
	price float not null,
	total float not null,
	status bit default 0
)

-- nullable fields
DECLARE @name AS nvarchar(255) = null;
DECLARE @area AS nvarchar(255) = null; 
--non-null fields
DECLARE @amount as int = 10;
DECLARE @checkIn as date = getdate();
DECLARE @checkOut as date = getdate();
select * 
from Room as R 
JOIN Hotel as H ON R.hotelID = H.hotelID 
AND R.available = 1 
AND (@name is null or H.hotelName LIKE @name)
AND (@area is null or H.hotelArea LIKE @area)
AND (	
	select COALESCE(SUM(D.amount),0) s
	from BookingDetail as D 
	where D.roomID = R.roomID 
	and D.status = 1 
	and ((@checkIn between D.checkIn and D.checkOut) or (@checkOut between D.checkIn and D.checkOut))
) <= (SELECT R.quantity - @amount);




select  * from Room as R JOIN Hotel as H ON R.hotelID = H.hotelID;

	select SUM(D.amount) as s from BookingDetail as D where D.roomID = 1 and D.status = 1 and D.checkIn >= GETDATE()
