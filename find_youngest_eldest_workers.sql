ALTER TABLE worker
ADD column type VARCHAR(20) CHECK(type IN ('YOUNGEST', 'ELDEST'));

UPDATE worker 
SET type = 'YOUNGEST' WHERE birthday = (SELECT MAX(birthday) FROM worker);
UPDATE worker 
SET type = 'ELDEST' WHERE birthday = (SELECT MIN(birthday) FROM worker);

SELECT type AS "TYPE" , name AS "NAME", birthday AS "BRTHDAY"
FROM worker
WHERE birthday= (SELECT MAX(birthday) FROM worker)
UNION
SELECT type AS "TYPE" , name AS "NAME", birthday AS "BRTHDAY"
FROM worker
WHERE birthday = (SELECT MIN(birthday) FROM worker);

ALTER TABLE worker
DROP column type