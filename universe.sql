--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(128) NOT NULL,
    description text,
    has_life boolean,
    age_in_millions_of_years numeric(10,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(128) NOT NULL,
    planet_id integer,
    has_life boolean,
    age_in_millions_of_years numeric(10,2),
    times_visited_by_humans integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(128) NOT NULL,
    star_id integer,
    has_life boolean,
    age_in_millions_of_years numeric(10,2),
    times_visited_by_humans integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(128) NOT NULL,
    galaxy_id integer,
    distance_from_earth_in_lightyears numeric(10,2),
    has_life boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: sun; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.sun (
    sun_id integer NOT NULL,
    name character varying(128) NOT NULL,
    type character varying(128) NOT NULL,
    age_in_millions_of_years numeric(10,2),
    discovered_by character varying(128)
);


ALTER TABLE public.sun OWNER TO freecodecamp;

--
-- Name: sun_sun_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.sun_sun_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sun_sun_id_seq OWNER TO freecodecamp;

--
-- Name: sun_sun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.sun_sun_id_seq OWNED BY public.sun.sun_id;


--
-- Name: sun sun_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun ALTER COLUMN sun_id SET DEFAULT nextval('public.sun_sun_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', true, 13600.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Closest large galaxy', false, 10000.00);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third-largest in the Local Group', false, 9000.00);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'A bright, large galaxy', false, 11000.00);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'An interacting grand-design galaxy', false, 500.00);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'A supergiant elliptical galaxy', false, 13000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, false, 4500.00, 6);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, false, 4500.00, 0);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, false, 4500.00, 0);
INSERT INTO public.moon VALUES (4, 'Europa', 9, false, 4500.00, 0);
INSERT INTO public.moon VALUES (5, 'Ganymede', 9, false, 4500.00, 0);
INSERT INTO public.moon VALUES (6, 'Callisto', 9, false, 4500.00, 0);
INSERT INTO public.moon VALUES (7, 'Titan', 10, false, 4500.00, 0);
INSERT INTO public.moon VALUES (8, 'Rhea', 10, false, 4500.00, 0);
INSERT INTO public.moon VALUES (9, 'Oberon', 12, false, 4500.00, 0);
INSERT INTO public.moon VALUES (10, 'Triton', 11, false, 4500.00, 0);
INSERT INTO public.moon VALUES (11, 'Charon', 3, false, 4500.00, 0);
INSERT INTO public.moon VALUES (12, 'Proxima Centauri c', 4, false, 100.00, 0);
INSERT INTO public.moon VALUES (13, 'Iapetus', 10, false, 4500.00, 0);
INSERT INTO public.moon VALUES (14, 'Dione', 10, false, 4500.00, 0);
INSERT INTO public.moon VALUES (15, 'Tethys', 10, false, 4500.00, 0);
INSERT INTO public.moon VALUES (16, 'Enceladus', 10, false, 4500.00, 0);
INSERT INTO public.moon VALUES (17, 'Miranda', 12, false, 4500.00, 0);
INSERT INTO public.moon VALUES (18, 'Ariel', 12, false, 4500.00, 0);
INSERT INTO public.moon VALUES (19, 'Umbriel', 12, false, 4500.00, 0);
INSERT INTO public.moon VALUES (20, 'Oberon', 12, false, 4500.00, 0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 4500.00, 0);
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, 4500.00, 0);
INSERT INTO public.planet VALUES (3, 'Venus', 1, false, 4500.00, 0);
INSERT INTO public.planet VALUES (4, 'Proxima b', 2, false, 4500.00, 0);
INSERT INTO public.planet VALUES (5, 'Betelgeuse b', 3, false, 100.00, 0);
INSERT INTO public.planet VALUES (6, 'Sirius b', 4, false, 120.00, 0);
INSERT INTO public.planet VALUES (7, 'Vega b', 5, false, 200.00, 0);
INSERT INTO public.planet VALUES (8, 'Alpha Centauri Bb', 6, false, 4500.00, 0);
INSERT INTO public.planet VALUES (9, 'Jupiter', 1, false, 4500.00, 0);
INSERT INTO public.planet VALUES (10, 'Saturn', 1, false, 4500.00, 0);
INSERT INTO public.planet VALUES (11, 'Neptune', 1, false, 4500.00, 0);
INSERT INTO public.planet VALUES (12, 'Uranus', 1, false, 4500.00, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 0.00, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 4.24, false);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 642.50, false);
INSERT INTO public.star VALUES (4, 'Sirius', 1, 8.60, false);
INSERT INTO public.star VALUES (5, 'Vega', 1, 25.04, false);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 2, 4.37, false);


--
-- Data for Name: sun; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.sun VALUES (1, 'Sun', 'G-type main-sequence star (G2V)', 4500.00, 'N/A');
INSERT INTO public.sun VALUES (2, 'Alpha Centauri A', 'G-type main-sequence star (G2V)', 4500.00, 'Rigil Kentaurus');
INSERT INTO public.sun VALUES (3, 'Proxima Centauri', 'M-type main-sequence star (M5.5V)', 4500.00, 'Robert Innes');


--
-- Name: sun_sun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.sun_sun_id_seq', 3, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: sun sun_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_name_key UNIQUE (name);


--
-- Name: sun sun_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_pkey PRIMARY KEY (sun_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

