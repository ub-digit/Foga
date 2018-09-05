
ALTER TABLE actions ADD COLUMN created_at timestamp, ADD COLUMN updated_at timestamp;
UPDATE actions SET created_at='2018-08-30', updated_at='2018-08-30';

INSERT INTO operations (id, operation_type, created_at, updated_at)
SELECT id, act, created_at, updated_at
FROM actions ORDER BY actions.id;

UPDATE regis
SET creator = 'okänd'
WHERE creator is null;

UPDATE regis
SET modifier = regis.creator
WHERE modifier is null;

INSERT INTO post_infos(id, title, issn, publisher, operation_id, created_at, updated_at, created_by, updated_by, show, comment)
SELECT postnr, titel, issn, utgivare, atgard, regdat, sendat, creator, modifier, show, anmarkning
FROM regis;

DROP TABLE actions;
DROP TABLE regis;
DROP TABLE notes;