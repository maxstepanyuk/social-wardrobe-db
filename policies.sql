-- PostgreSQL

-- -- connect / use this DB
-- \c wardrobe;


-- Security Policies:

-- enable
ALTER TABLE public."gender" ENABLE ROW LEVEL SECURITY;
ALTER TABLE public."profile" ENABLE ROW LEVEL SECURITY;
ALTER TABLE public."garment_type" ENABLE ROW LEVEL SECURITY;
ALTER TABLE public."garment" ENABLE ROW LEVEL SECURITY;
ALTER TABLE public."outfit_type" ENABLE ROW LEVEL SECURITY;
ALTER TABLE public."outfits" ENABLE ROW LEVEL SECURITY;
ALTER TABLE public."garments_outfits" ENABLE ROW LEVEL SECURITY;
ALTER TABLE public."followers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE public."ratings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE public."comments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE public."action_log" ENABLE ROW LEVEL SECURITY;

-- DOTO:

-- -- Allow anonymous users to view(SELECT) all data from  tables
-- drop policy if exists "enable_read_access_to_everyone" on public."user";
-- drop policy if exists "enable_read_access_to_everyone" on public."gender";
-- drop policy if exists "enable_read_access_to_everyone" on public."profile";
-- drop policy if exists "enable_read_access_to_everyone" on public."garment_type";
-- drop policy if exists "enable_read_access_to_everyone" on public."garment";
-- drop policy if exists "enable_read_access_to_everyone" on public."outfit_type";
-- drop policy if exists "enable_read_access_to_everyone" on public."outfits";
-- drop policy if exists "enable_read_access_to_everyone" on public."garments_outfits";
-- drop policy if exists "enable_read_access_to_everyone" on public."followers";
-- drop policy if exists "enable_read_access_to_everyone" on public."ratings";
-- drop policy if exists "enable_read_access_to_everyone" on public."action_log";
-- drop policy if exists "enable_read_access_to_everyone" on public."comments";
-- create policy "enable_read_access_to_everyone" on public."user" for SELECT using (true);
-- create policy "enable_read_access_to_everyone" on public."gender" for SELECT using (true);
-- create policy "enable_read_access_to_everyone" on public."profile" for SELECT using (true);
-- create policy "enable_read_access_to_everyone" on public."garment_type" for SELECT using (true);
-- create policy "enable_read_access_to_everyone" on public."garment" for SELECT using (true);
-- create policy "enable_read_access_to_everyone" on public."outfit_type" for SELECT using (true);
-- create policy "enable_read_access_to_everyone" on public."outfits" for SELECT using (true);
-- create policy "enable_read_access_to_everyone" on public."garments_outfits" for SELECT using (true);
-- create policy "enable_read_access_to_everyone" on public."followers" for SELECT using (true);
-- create policy "enable_read_access_to_everyone" on public."ratings" for SELECT using (true);
-- create policy "enable_read_access_to_everyone" on public."action_log" for SELECT using (true);
-- create policy "enable_read_access_to_everyone" on public."comments" for SELECT using (true);

-- -- Allow owners to CRUD garments, outfits, and user data
-- CREATE POLICY owner_policy
-- ON ALL TABLES
-- FOR ALL
-- USING (
--     (SELECT user_id FROM "user" WHERE username = current_setting('jwt.claims.username')) = user_id
-- );

-- -- Allow users to view and CRUD their comments and ratings on someone else's posts
-- CREATE POLICY user_policy
-- ON comments
-- FOR ALL
-- USING (user_id = current_setting('jwt.claims.user_id')::INT);

-- CREATE POLICY user_policy_ratings
-- ON ratings
-- FOR ALL
-- USING (user_id = current_setting('jwt.claims.user_id')::INT);