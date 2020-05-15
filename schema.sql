DROP TABLE IF EXISTS event;
DROP TABLE IF EXISTS user;

CREATE TABLE user (
	user_id SERIAL PRIMARY KEY,
	firstname VARCHAR(30),
	lastname VARCHAR(30),
	username VARCHAR(30),
	password VARCHAR(30)
);

CREATE TABLE event (
	id SERIAL PRIMARY KEY, 
	event_name VARCHAR(50),	
	month INT, 
	day INT, 
	year INT, 
	start_time VARCHAR(10), 
	end_time VARCHAR(10),
	is_deleted INT DEFAULT 0,
	user_id BIGINT UNSIGNED,
	user_id2 BIGINT UNSIGNED,
	user_id3 BIGINT UNSIGNED,
	user_id4 BIGINT UNSIGNED,
	user_id5 BIGINT UNSIGNED,
	user_id6 BIGINT UNSIGNED,
	user_id7 BIGINT UNSIGNED,
	user_id8 BIGINT UNSIGNED,
	user_id9 BIGINT UNSIGNED,
	user_id10 BIGINT UNSIGNED,
	FOREIGN KEY (user_id) REFERENCES user(user_id),
	FOREIGN KEY (user_id2) REFERENCES user(user_id),
	FOREIGN KEY (user_id3) REFERENCES user(user_id),
	FOREIGN KEY (user_id4) REFERENCES user(user_id),
	FOREIGN KEY (user_id5) REFERENCES user(user_id),
	FOREIGN KEY (user_id6) REFERENCES user(user_id),
	FOREIGN KEY (user_id7) REFERENCES user(user_id),
	FOREIGN KEY (user_id8) REFERENCES user(user_id),
	FOREIGN KEY (user_id9) REFERENCES user(user_id),
	FOREIGN KEY (user_id10) REFERENCES user(user_id)
);

