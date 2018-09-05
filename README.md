
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# foga-A
Cleaner foga


#  Database creation and initialization

Det finns ett sql script som gör steg 2 och 3 (migrateStart.sql) där databasen heter dbfoga_mig. Ändra databasnamntet i scriptet om du vill att det ska heta annat (eller gör steg 2 och 3 manuellt). Se till att du därefter GÖR STEG 4. 
Resten av sql coden finns i scriptet fullMigrate.sql.

 - För att köra sql script: 
      (inloggad)     \i migrateStart.sql
      (ej inloggad)  psql databasename username -f migrateStart.sql

1. Koppla till rätt databasb (t.ex. dbfoga_mig) i rails app (database.yml)

2. psql:
CREATE DATABASE databasename with template fogatemplate;

3. Connect to this database in psql:
\c databasename postgres

4. 
rake db:migrate

Har nu både gamla och nya föga tabeller i samma db (dbfoga_mig).

5.
Migrera data och droppa gamla tabeller med sql scriptet.

6. rake db:migrate
_______________________________________________________________

ALTER TABLE actions ADD COLUMN created_at timestamp, ADD COLUMN updated_at timestamp;
UPDATE actions SET created_at='2018-08-30', updated_at='2018-08-30';

INSERT INTO operations (id, operation_type, created_at, updated_at)
SELECT id, act, created_at, updated_at
FROM actions ORDER BY actions.id;

--

UPDATE regis
SET creator = 'okänd'
WHERE creator is null;

UPDATE regis
SET modifier = regis.creator
WHERE modifier is null;

INSERT INTO post_infos(id, title, issn, publisher, operation_id, created_at, updated_at, created_by, updated_by, show, comment)
SELECT postnr, titel, issn, utgivare, atgard, regdat, sendat, creator, modifier, show, anmarkning
FROM regis;


DROP TABLE actions, regis;
DROP TABLE notes;


---_______________________________________________________________---

-> Create first user, rails c:
User.create!(xname:'användarenamn', password:'användarelösenord', is_admin: true)




# Ideas for future development

- Auto complete
- Åtgärder lista -> kan radera i fönster bredvid (behöver inte öppna ny sida).

- Tags to filter by?