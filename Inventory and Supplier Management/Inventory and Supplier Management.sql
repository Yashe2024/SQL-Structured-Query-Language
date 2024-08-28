--show tables;

select * from Pieces;
select * from Providers;
select * from provides;

-- Select the name of all the pieces.
select name from pieces;

-- Select all the providers' data. 
select * from providers;

-- Obtain the average price of each piece (show only the piece code and the average price).
select avg(price) as average_price from provides;
select piece as Piece, avg(price) as Average_Price
from provides
group by piece;

-- Obtain the names of all providers who supply piece 1.
select name from providers
where code in ( select provider from provides where piece = 1);

-- Select the name of pieces provided by provider with code "HAL".
select name from pieces 
where code in ( select piece from provides where provider= 'HAL');

-- For each piece, 
--find the most expensive offering of that piece and include the piece name, provider name, and price 
select pieces.Name,providers.Name, Price 
from pieces inner join provides on Pieces.Code= Piece
			inner join providers on Providers.code=Provider
where price =
(
  select max(price) from provides
  where Piece=Pieces.Code);

  -- Add an entry to the database to indicate that "Skellington Supplies" (code "TNBC") will provide sprockets (code "1") for 7 cents each.
  insert into provides( Piece,Provider,Price) values(1,'TNBC',7);

  -- Increase all prices by one cent.
  update provides 
  set price = price+1;

  -- Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply bolts (code 4).
  delete from provides where provider = 'RBT' and Piece=4;

  -- Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply any pieces 
-- (the provider should still remain in the database).

delete from provides 
where provider='RBT';
