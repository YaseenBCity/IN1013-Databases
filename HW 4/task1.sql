CREATE TABLE petPet (
	petName VARCHAR(20),
	owner VARCHAR(45),
	species VARCHAR(45),
	gender VARCHAR(1),
	birth DATE,
	death DATE
);

CREATE TABLE petEvent (
	petName VARCHAR(20),
	eventdate DATE,
	eventtype VARCHAR(15),
	remark VARCHAR(255),
);


