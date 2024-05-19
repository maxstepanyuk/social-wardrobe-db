-- PostgreSQL

-- -- connect / use this DB
-- \c postgres; 

-- DROP DATABASE IF EXISTS wardrobe;
-- CREATE DATABASE wardrobe;

-- -- list all DBs
-- SELECT datname FROM pg_database; 

-- -- connect / use this DB
-- \c wardrobe; 

-- user profile gender
CREATE TABLE IF NOT EXISTS public."user" (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255),
    registration_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS public."gender" (
    gender_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS public."profile" (
    profile_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES public."user"(user_id),
    birthdate DATE,
    contact VARCHAR(255),
    address VARCHAR(255),
    gender_id INT,
    FOREIGN KEY (gender_id) REFERENCES public."gender"(gender_id),
    biography TEXT,
    avatar VARCHAR(255)
);

-- garments and types

CREATE TABLE IF NOT EXISTS public."garment_type" (
    garment_type_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE
-- TODO - add per user defined type??
);

CREATE TABLE IF NOT EXISTS public."garment" (
    garment_id SERIAL PRIMARY KEY,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES public."user"(user_id),
    garment_type_id INT,
    FOREIGN KEY (garment_type_id) REFERENCES public."garment_type"(garment_type_id),
    photo VARCHAR(255),
    date_worn DATE,
    date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- outfits and types

CREATE TABLE IF NOT EXISTS public."outfit_type" (
    outfit_type_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE
-- TODO - add per user defined type??
);


CREATE TABLE IF NOT EXISTS public."outfits" (
    outfit_id SERIAL PRIMARY KEY,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES public."user"(user_id),
    name VARCHAR(255),
    outfit_type_id INT,
    FOREIGN KEY (outfit_type_id) REFERENCES public."outfit_type"(outfit_type_id),
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    date_edited TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    date_worn DATE,
    cover_photo VARCHAR(255)
);

-- garments (m-m) outfits

CREATE TABLE IF NOT EXISTS public."garments_outfits" (
    garment_id INT,
    FOREIGN KEY (garment_id) REFERENCES public."garment"(garment_id),
    outfit_id INT,
    FOREIGN KEY (outfit_id) REFERENCES public."outfits"(outfit_id)
);

-- followers ratings comments

CREATE TABLE IF NOT EXISTS public."followers" (
    follower_id INT,
    FOREIGN KEY (follower_id) REFERENCES public."user"(user_id),
    following_id INT,
    FOREIGN KEY (following_id) REFERENCES public."user"(user_id),
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS public."ratings" (
    outfit_id INT,
    FOREIGN KEY (outfit_id) REFERENCES public."outfits"(outfit_id),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES public."user"(user_id),
    rating INT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS public."comments" (
    comment_id SERIAL PRIMARY KEY,
    outfit_id INT,
    FOREIGN KEY (outfit_id) REFERENCES public."outfits"(outfit_id),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES public."user"(user_id),
    comment TEXT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- logs
CREATE TABLE public."action_log" (
    log_id SERIAL PRIMARY KEY,
    table_name VARCHAR(255) NOT NULL,
    row_id INT NOT NULL,
    "action" VARCHAR(255) NOT NULL,
    "time" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
