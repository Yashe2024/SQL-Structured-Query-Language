-- Select all warehouses
Select * from warehouses;

-- Select all boxes with a value larger than $150.
select * from boxes where value >= 150;

-- Select all distinct contents in all the boxes.
select distinct(Contents) from boxes;

-- Select the average value of all the boxes.
select ROUND(AVG(value),2) as Average_Value from boxes;

-- Select the warehouse code and the average value of the boxes in each warehouse.
select warehouse, avg(value) as Average_value from boxes group by warehouse;

--3.6
-- Same as previous exercise, but select only those warehouses where the average value of the boxes is greater than 150.
select warehouse, avg(value) as Average_value from boxes group by warehouse
having avg(value)>150;

-- Select the code of each box, along with the name of the city the box is located in.
select boxes.Code, warehouses.Location
from boxes join warehouses
on boxes.Warehouse = Warehouses.Code;

-- Select the warehouse codes, along with the number of boxes in each warehouse. 
-- Optionally, take into account that some warehouses are empty (i.e., the box count should show up as zero, instead of omitting the warehouse from the result).
select warehouse, count(*) from boxes group by warehouse;

-- Select the codes of all warehouses that are saturated (a warehouse is saturated if the number of boxes in it is larger than the warehouse's capacity).
SELECT Code
   FROM Warehouses
   WHERE Capacity <
   (
     SELECT COUNT(*)
       FROM Boxes
       WHERE Warehouse = Warehouses.Code
	   );
	   
--3.10
-- Select the codes of all the boxes located in Chicago.
select Boxes.code 
from boxes join Warehouses
on boxes.warehouse = warehouses.code
where warehouses.location = 'Chicago';

-- Create a new warehouse in New York with a capacity for 3 boxes.
INSERT INTO WAREHOUSES VALUES(6,'New York',3);

-- Create a new box, with code "H5RT", containing "Papers" with a value of $200, and located in warehouse 2.
INSERT INTO BOXES VALUES('H5RT','Papers',200,2);

-- Reduce the value of all boxes by 15%.
update boxes
set value = 0.90 * value;

  -- Remove all boxes with a value lower than $100.
  delete from boxes
  where value<100;

  -- Remove all boxes from saturated warehouses.
  delete from boxes 
  where warehouse in 
  (
  select code 
  from warehouses
  where capacity <
  (
  select count (*)
  from boxes 
  where Warehouse =warehouses.code
    )
  );

  -- 3.16
-- Add Index for column "Warehouse" in table "boxes"
-- !!!NOTE!!!: index should NOT be used on small tables in practice
create index index_warehouse on boxes(warehouse);

-- Print all the existing indexes
CREATE INDEX INDEX_WAREHOUSE ON Boxes (warehouse);

-- 3.18
-- Remove (drop) the index you added just
-- !!!NOTE!!!: index should NOT be used on small tables in practice

drop index index_warehouse;