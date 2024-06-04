-- PostgreSQL

-- -- connect / use this DB
-- \c wardrobe;

--DROP FUNCTION auth.uid()

CREATE OR replace function auth.uid() -- supabase mock
--CREATE function auth.uid() -- supabase mock
returns uuid
language sql
security definer
set search_path = ''
stable
as $$
	SELECT id 
	FROM auth."users"  au
	ORDER BY RANDOM()
	LIMIT 1;
$$;

SELECT * FROM auth.uid();



--CREATE OR REPLACE FUNCTION public.get_user_id_by_auth_uuid(p_uuid UUID)
--RETURNS int
--LANGUAGE sql
--SECURITY DEFINER
--SET search_path = ''
--STABLE
--AS $$
--    SELECT public."user".user_id 
--    FROM public."user"
--    WHERE public."user".supabaseauth_user_id = p_uuid
--   ;
--$$;
--
--SELECT get_user_id_by_auth_uuid('6580061d-3c76-446e-9440-b47a472c1d90');
--SELECT get_user_id_by_auth_uuid(auth.uid());
--
--
--
--CREATE OR REPLACE FUNCTION public.get_current_user_id()
--RETURNS int
--LANGUAGE sql
--SECURITY DEFINER
--SET search_path = ''
--STABLE
--AS $$
--    SELECT public.get_user_id_by_uuid(auth.uid());
--$$;
--
--SELECT * FROM public.get_current_user_id();
--
---- Update the function get_profile_id_by_user_id to use supabaseauth_user_id instead of user_id
--CREATE OR REPLACE FUNCTION public.get_profile_id_by_user_id(u_id INT)
--RETURNS INT
--LANGUAGE SQL
--SECURITY DEFINER
--SET search_path = ''
--STABLE
--AS $$
--    SELECT public."profile".profile_id
--    FROM public."profile"
--    JOIN public."user" ON public."profile".supabaseauth_user_id = public."user".supabaseauth_user_id
--    WHERE public."user".user_id = u_id;
--$$;
--
---- Test the updated function
--SELECT * FROM public.get_profile_id_by_user_id(6);
--
---- Update the function get_current_profile_id to use the updated functions and schema
--CREATE OR REPLACE FUNCTION public.get_current_profile_id()
--RETURNS INT
--LANGUAGE SQL
--SECURITY DEFINER
--SET search_path = ''
--STABLE
--AS $$
--    SELECT public.get_profile_id_by_user_id(public.get_current_user_id());
--$$;
--
---- Test the updated function
--SELECT * FROM public.get_current_profile_id();
--
---- Test the updated functions together
--WITH uid AS (
--    SELECT auth.uid() AS uid
--)
--SELECT 
--    *,
--    get_user_id_by_auth_uuid(uid) AS user_id,
--    public.get_profile_id_by_user_id(get_user_id_by_auth_uuid(uid)) AS profile_id
--FROM 
--    uid;
--
---- Select user and profile data based on auth_user_id
--SELECT
--    au.id AS auth_user_id,
--    pu.user_id,
--    pr.profile_id
--FROM
--    auth."users" au
--JOIN
--    public."user" pu ON au.id = pu.supabaseauth_user_id
--JOIN
--    public."profile" pr ON pu.supabaseauth_user_id = pr.supabaseauth_user_id
--WHERE
--    au.id = '7b75bd54-0e55-43e1-a2d9-20024c80fd9a'
--;
--
--
--
----get_user_id_by_auth_uuid

















-- get_profile_feed -- (can only be acceced by the user)
--create or replace function get_feed_for_authenticated()

--create or replace function get_profile_outfits()
--returns setof bigint
--language sql
--security definer
--set search_path = ''
--stable
--as $$
--    select outfit_id
--    from public."outfits"
--    where profile_id = auth.uid()
--$$;

-- -- garments
-- get_profile_garments_for_authenticated()
-- get_profile_garments_by_profile_id()
-- get_outfits_with_garment_by_id()

-- -- oufits
-- get_profile_oufits_for_authenticated()
-- get_profile_oufits_by_profiele_id()

-- get_profile_followers_by_profiele_id()
-- get_who_profile_follows_by_profiele_id()

-- find_profiles_by_username()


-- -- posts (outfits)
-- get_post_avagage_rating_by_post_id()
-- get_post_recent_comments_by_post_id()





-- from logseq
-- LATER get_user_feed
--	- (can only be acceced by the user)
-- LATER get_user_garments
-- LATER get_outfits_with_garment
-- LATER get_user_oufits
-- LATER get_user_followers
-- LATER get_who_user_follows
-- LATER find_users_by_username