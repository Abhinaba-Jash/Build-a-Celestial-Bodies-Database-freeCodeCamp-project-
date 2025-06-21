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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer,
    period_in_years numeric,
    discovered_by text,
    is_periodic boolean,
    description text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_type text,
    distance_from_earth numeric,
    description text,
    discovered_by text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer,
    is_spherical boolean,
    orbital_period_in_days numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    star_id integer,
    has_life boolean,
    is_spherical boolean,
    planet_type text,
    age_in_millions_of_years integer,
    gravity numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer,
    distance_from_earth numeric,
    is_spherical boolean,
    age_in_millions_of_years integer,
    temperature numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley''s Comet', 1, 75.3, 'Edmond Halley', true, 'Most famous periodic comet');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 1, 2533, 'Alan Hale and Thomas Bopp', false, 'Bright comet visible in 1997');
INSERT INTO public.comet VALUES (3, 'Encke''s Comet', 1, 3.3, 'Pierre Méchain', true, 'Shortest-known periodic comet');
INSERT INTO public.comet VALUES (4, 'Swift-Tuttle', 1, 133, 'Lewis Swift and Horace Tuttle', true, 'Parent of the Perseid meteor shower');
INSERT INTO public.comet VALUES (5, 'Hyakutake', 1, 17000, 'Yuji Hyakutake', false, 'Passed very close to Earth in 1996');
INSERT INTO public.comet VALUES (6, 'Borrelly', 1, 6.9, 'Alphonse Borrelly', true, 'Studied by Deep Space 1');
INSERT INTO public.comet VALUES (7, 'Lovejoy', 1, NULL, 'Terry Lovejoy', false, 'Bright comet visible in 2011');
INSERT INTO public.comet VALUES (8, 'McNaught', 1, NULL, 'Robert McNaught', false, 'One of the brightest comets in decades');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, 'Our home galaxy', NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000, 'Closest spiral galaxy', NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000000, 'Third-largest in Local Group', NULL);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 23000000, 'Interacting spiral galaxy', NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 29000000, 'Bright central bulge', NULL);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 163000, 'Satellite galaxy of the Milky Way', NULL);
INSERT INTO public.galaxy VALUES (7, 'Small Magellanic Cloud', 'Irregular', 200000, 'Another satellite galaxy', NULL);
INSERT INTO public.galaxy VALUES (8, 'Centaurus A', 'Elliptical', 11000000, 'Peculiar galaxy with a strong radio source', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, true, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, false, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, false, NULL);
INSERT INTO public.moon VALUES (4, 'Europa', 3, true, NULL);
INSERT INTO public.moon VALUES (5, 'Ganymede', 3, true, NULL);
INSERT INTO public.moon VALUES (6, 'Callisto', 3, true, NULL);
INSERT INTO public.moon VALUES (7, 'Titan', 3, true, NULL);
INSERT INTO public.moon VALUES (8, 'Triton', 5, true, NULL);
INSERT INTO public.moon VALUES (9, 'Oberon', 5, true, NULL);
INSERT INTO public.moon VALUES (10, 'Ariel', 5, true, NULL);
INSERT INTO public.moon VALUES (11, 'Miranda', 5, true, NULL);
INSERT INTO public.moon VALUES (12, 'Charon', 5, true, NULL);
INSERT INTO public.moon VALUES (14, 'Titan01', 6, true, NULL);
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, true, NULL);
INSERT INTO public.moon VALUES (16, 'No Moon', 8, false, NULL);
INSERT INTO public.moon VALUES (17, 'Zerra', 1, true, NULL);
INSERT INTO public.moon VALUES (18, 'Elara Prime', 2, false, NULL);
INSERT INTO public.moon VALUES (19, 'Morthal', 3, true, NULL);
INSERT INTO public.moon VALUES (20, 'Nyxora', 3, true, NULL);
INSERT INTO public.moon VALUES (21, 'Thalos', 4, false, NULL);
INSERT INTO public.moon VALUES (22, 'Kronis', 5, true, NULL);
INSERT INTO public.moon VALUES (23, 'Lunara', 6, true, NULL);
INSERT INTO public.moon VALUES (24, 'Zentha', 6, false, NULL);
INSERT INTO public.moon VALUES (25, 'Veltrix', 7, true, NULL);
INSERT INTO public.moon VALUES (26, 'Demerion', 7, false, NULL);
INSERT INTO public.moon VALUES (27, 'Ignis', 8, true, NULL);
INSERT INTO public.moon VALUES (28, 'Solune', 8, true, NULL);
INSERT INTO public.moon VALUES (29, 'Cryon', 3, true, NULL);
INSERT INTO public.moon VALUES (30, 'Riven', 2, false, NULL);
INSERT INTO public.moon VALUES (31, 'Phantos', 4, true, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, true, 'Terrestrial', 4500, NULL);
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, true, 'Terrestrial', 4500, NULL);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, false, true, 'Gas Giant', 4500, NULL);
INSERT INTO public.planet VALUES (4, 'Venus', 1, false, true, 'Terrestrial', 4500, NULL);
INSERT INTO public.planet VALUES (5, 'Neptune', 1, false, true, 'Ice Giant', 4500, NULL);
INSERT INTO public.planet VALUES (6, 'Mercury', 1, false, true, 'Terrestrial', 4500, NULL);
INSERT INTO public.planet VALUES (7, 'Saturn', 1, false, true, 'Gas Giant', 4500, NULL);
INSERT INTO public.planet VALUES (8, 'Uranus', 1, false, true, 'Ice Giant', 4500, NULL);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 2, false, true, 'Super-Earth', 6000, NULL);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 3, false, true, 'Exoplanet', 8000, NULL);
INSERT INTO public.planet VALUES (11, 'Planet Nine', 1, false, true, 'Ice Giant', 4500, NULL);
INSERT INTO public.planet VALUES (12, 'Coruscant', 1, true, true, 'Urban Terrestrial', 10000, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 0, true, 4600, NULL);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 8.6, true, 242, NULL);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 4.2, true, 4500, NULL);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 1, 4.37, true, 5000, NULL);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 642.5, true, 10000, NULL);
INSERT INTO public.star VALUES (6, 'Rigel', 1, 860, true, 800, NULL);
INSERT INTO public.star VALUES (7, 'Vega', 1, 25, true, 455, NULL);
INSERT INTO public.star VALUES (8, 'Altair', 1, 16.7, true, 1200, NULL);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 8, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 31, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: comet comet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

