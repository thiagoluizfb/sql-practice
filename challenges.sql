/*--show tables;


--desc Playlist;
--desc PlaylistTrack;
--desc Track;
--desc Album;
--desc Artist;*/

/* --Join multiple tables

select Playlist.Name as Playlist, Track.Name as Track, Album.Title as Album, Artist.Name as Artist
from Playlist
inner join PlaylistTrack on Playlist.PlaylistId = PlaylistTrack.PlaylistId
inner join Track on PlaylistTrack.TrackId = Track.TrackId
inner join Album on Track.AlbumId = Album.AlbumId
inner join Artist on Album.ArtistId = Artist.ArtistId
where Playlist.Name = "Grunge";*/



/*Playlist with only one song

select Playlist.Name as Playlist, count(TrackId) as Total_Songs
from Playlist
inner join PlaylistTrack on Playlist.PlaylistId = PlaylistTrack.PlaylistId
group by Playlist.Name
having count(TrackId) = 1;*/



/*Ordered by Descending

select InvoiceDate, BillingAddress, Total
from Invoice
order by InvoiceDate desc;*/


/*Ordered by Descending

select EmployeeId, FirstName, LastName,  HireDate
from Employee
order by EmployeeId desc, HireDate desc
limit 3;*/

/*Ordered by Descending

select Customer.FirstName, Customer.LastName, InvoiceDate, Total
from Customer
inner join Invoice on Customer.CustomerId = Invoice.CustomerId
order by Total desc, InvoiceDate desc
limit 10;*/

/*Sum specific Id

select Employee.EmployeeId, Employee.FirstName, Employee.LastName, count(CustomerId) as Total_Customers
from Employee
inner join Customer on Employee.EmployeeId = Customer.SupportRepId
where Employee.EmployeeId = 4;*/

/*Sum specific Name

select Employee.FirstName, Employee.LastName, count(CustomerId) as Total_Customers
from Employee
inner join Customer on Customer.SupportRepId = Employee.EmployeeId
where Employee.FirstName = "Jane"
group by Employee.EmployeeId;*/

/*Most Popular Song

select MediaType.Name as MediaType, sum(InvoiceLine.Quantity) as Total
from MediaType
inner join Track on MediaType.MediaTypeId = Track.MediaTypeId
inner join InvoiceLine on InvoiceLine.TrackId = Track.TrackId
group by Track.MediaTypeId
order by Total desc
limit 10;*/

/*What is the date of birth of our oldest employee

select min(BirthDate)
from Employee;*/



/*How many customers do we have in the City of Berlin

select count(CustomerId) as Total
from Customer
where City = "Berlin"
group by City;*/


/*How much has been made in sales for the track "The Woman King"

select Track.Name as Track, sum(InvoiceLine.UnitPrice*InvoiceLine.Quantity) as Total
from Track
inner join InvoiceLine on Track.TrackId = InvoiceLine.TrackId
where Track.Name = "The Woman King"
group by Track;*/


/*Create a list of the top 5 acts by number of tracks. The table should include the name of the artist and the number of tracks they have"*/

select Artist.Name as Artist, count(Track.TrackId) as Total
from Artist
inner join Album on Artist.ArtistId = Album.ArtistId
inner join Track on Track.AlbumId = Album.AlbumId
group by Artist.ArtistId
order by Total desc
limit 5;