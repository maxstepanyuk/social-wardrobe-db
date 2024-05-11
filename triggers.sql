--postgresql

-- -- connect / use this DB
-- \c wardrobe; 

-- Створити 3 тригера (наприклад, для запису в журнал подій операцій з базою даних).

-- on delete - user table
CREATE OR REPLACE FUNCTION user_delete_log()
RETURNS TRIGGER AS $user_delete$
BEGIN
    INSERT INTO action_log (table_name, row_id, action)
    VALUES ('user', OLD.user_id, 'delete');
    RETURN OLD;
END;
$user_delete$ LANGUAGE plpgsql;

CREATE TRIGGER user_delete_trigger
AFTER DELETE ON "user"
FOR EACH ROW
EXECUTE FUNCTION user_delete_log();

-- outfit
CREATE OR REPLACE FUNCTION outfit_delete_log()
RETURNS TRIGGER AS $outfit_delete$
BEGIN
    INSERT INTO action_log (table_name, row_id, action)
    VALUES ('outfit', OLD.outfit_id, 'delete');
    RETURN OLD;
END;
$outfit_delete$ LANGUAGE plpgsql;

CREATE TRIGGER outfit_delete_trigger
AFTER DELETE ON outfits
FOR EACH ROW
EXECUTE FUNCTION outfit_delete_log();

-- 
CREATE OR REPLACE FUNCTION comment_delete_log()
RETURNS TRIGGER AS $comment_delete$
BEGIN
    INSERT INTO action_log (table_name, row_id, action)
    VALUES ('comment', OLD.comment_id, 'delete');
    RETURN OLD;
END;
$comment_delete$ LANGUAGE plpgsql;

CREATE TRIGGER comment_delete_trigger
AFTER DELETE ON comments
FOR EACH ROW
EXECUTE FUNCTION comment_delete_log();

-- -- test trigger
-- SELECT * FROM "comments" c ;
-- DELETE FROM "comments" c WHERE "comment_id" = 3;
-- SELECT * FROM action_log al ;