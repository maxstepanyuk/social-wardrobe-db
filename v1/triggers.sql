--postgresql

-- -- connect / use this DB
-- \c wardrobe; 

-- Створити 3 тригера (наприклад, для запису в журнал подій операцій з базою даних).

-- on delete - user table
CREATE OR REPLACE FUNCTION user_delete_log()
RETURNS TRIGGER AS $user_delete$
BEGIN
    INSERT INTO action_log (table_name, row_id, action)
    VALUES ('user', OLD.profile_id, 'delete');
    RETURN OLD;
END;
$user_delete$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER user_delete_trigger
AFTER DELETE ON public."profile"
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

CREATE OR REPLACE TRIGGER outfit_delete_trigger
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

CREATE OR REPLACE TRIGGER comment_delete_trigger
AFTER DELETE ON comments
FOR EACH ROW
EXECUTE FUNCTION comment_delete_log();

-- -- test trigger
-- SELECT * FROM "comments" c ;
-- DELETE FROM "comments" c WHERE "comment_id" = 3;
-- SELECT * FROM action_log al ;

-- new user -> create profile trigger

-- This trigger automatically creates a profile entry when a new user signs up via Supabase Auth.
-- See https://supabase.com/docs/guides/auth/managing-user-data#using-triggers for more details.
create or replace function public.handle_new_user()
returns trigger as $$
begin
  -- insert into public.profile (id, full_name, avatar_url) -- example
  insert into public.profile (supabaseauth_user_id,  username)
  -- values (new.id, new.raw_user_meta_data->>'full_name', new.raw_user_meta_data->>'avatar_url'); -- example
  -- values (new.supabaseauth_user_id, new.raw_user_meta_data->>'username'); --todo
  values (new.supabaseauth_user_id, 'test');
  return new;
end;
$$ language plpgsql security definer;

create or replace trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();


-- test

INSERT INTO auth."users" (id, email, encrypted_password, created_at) VALUES 
('2b23bff5-d0d9-4c8c-9faa-5fb754035a8f','1@1.com', '1', '2024-06-04 00:00:00');

-- test

DELETE FROM public."profile"
WHERE public."profile".supabaseauth_user_id = 'ee494072-2717-4577-8bce-7894c309b7c3';

INSERT INTO public."profile" ( supabaseauth_user_id,  username) 
VALUES ('ee494072-2717-4577-8bce-7894c309b7c3' , 'a' );

select * from public.profile where supabaseauth_user_id = 'ee494072-2717-4577-8bce-7894c309b7c3';
-- select * from public.profile;