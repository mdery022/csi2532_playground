# csi2532_playground

| Outline | Value |
| --- | --- |
| Course | CSI 2532 |
| Date | Winter 2022 |
| Professor | Dorra Riahi, driahi@uottawa.ca |
| TA | Laith Grira, lgrir057@uottawa.ca |
| Team | Marianne Dery 300142817 |

## Lab 9

### Exercice 1

```SQL
CREATE TABLE Book (
	Bookid INTEGER,
	Bookname VARCHAR(20),
	Authorid INTEGER,
	Amount NUMERIC(7, 2),
	Rating INTEGER,
	Booktype VARCHAR(25),
	CONSTRAINT book_bookid_pkey PRIMARY KEY (Bookid),
	CONSTRAINT book_authorid_fkey FOREIGN KEY (Authorid) 
		REFERENCES Author (Authorid)
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT book_rating_check CHECK (Rating >= 1 AND Rating <= 10),
	CONSTRAINT book_amount_check CHECK (Amount > 0),
	CONSTRAINT book_booktype_check CHECK (Booktype in 
		('Fictionadulte', 'Non-fiction-adulte', 'Fiction-jeunesse', 'Non-fictionjeunesse'))
);
```

### Exercice 2

```SQL
CREATE TABLE Author (
	Authorid INTEGER,
	Authorname VARCHAR(20),
	CONSTRAINT author_authorid_pkey PRIMARY KEY (Authorid)
);

CREATE ASSERTION check_amount_book_authors
CHECK (
	(SELECT COUNT(*) FROM Book) <= 10000 +
	(SELECT COUNT(*) FROM Author) <= 10000
);
```

### Exercice 3

```SQL
CREATE TRIGGER check_book_rating_trigger 
BEFORE UPDATE ON Book 
FOR EACH ROW
EXECUTE PROCEDURE check_book_rating();
```

### Exercice 4

```SQL
ALTER TABLE Author
ADD author_sum_rating INTEGER DEFAULT 0;

CREATE PROCEDURE update_author_rating @Authorid INTEGER
    AS
    UPDATE Author A
    SET author_sum_rating = (SELECT SUM(Bookrating) FROM Book B WHERE B.Authorid = Authorid)
    WHERE A.Authorid = Auhtorid
GO;

CREATE TRIGGER check_update_author_sum 
AFTER UPDATE OF Rating ON Book
FOR EACH ROW
EXECUTE PROCEDURE update_author_rating();
```
