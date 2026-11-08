--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years numeric(5,2),
    asteroid_type character varying(30),
    distance_from_earth integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    age_in_billions_of_years numeric(5,2),
    galaxy_type character varying(30)
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
    name character varying(30),
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_billions_of_years numeric(5,2),
    planet_type character varying(30),
    distance_from_earth_km integer,
    planet_id integer NOT NULL
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
    name character varying(30),
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_billions_of_years numeric(5,2),
    planet_type character varying(30),
    distance_from_earth_km integer,
    star_id integer NOT NULL
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
    name character varying(30),
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_billions_of_years numeric(5,2),
    planet_type character varying(30),
    distance_from_earth integer,
    galaxy_id integer NOT NULL
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Vesta', 'One of the largest objects in the asteroid belt', 450.00, 'Rocky', 250000000);
INSERT INTO public.asteroid VALUES (2, 'Pallas', 'One of the largest asteroids in the Solar System', 450.00, 'Rocky', 300000000);
INSERT INTO public.asteroid VALUES (3, 'Hygiea', 'A large asteroid located in the main asteroid belt', 450.00, 'Carbonaceous', 400000000);
INSERT INTO public.asteroid VALUES (4, 'Eros', 'A near-Earth asteroid with an elongated shape', 450.00, 'S-type', 22000000);
INSERT INTO public.asteroid VALUES (5, 'Bennu', 'A near-Earth asteroid visited by the OSIRIS-REx spacecraft', 450.00, 'Carbonaceous', 80000000);
INSERT INTO public.asteroid VALUES (6, 'Apophis', 'A near-Earth asteroid discovered in 2004', 450.00, 'Stony', 31000000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, containing the Solar System', true, 13.60, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest major galaxy to the Milky Way', false, 10.00, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A member of the Local Group of galaxies', false, 12.00, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'A famous interacting galaxy with prominent spiral arms', false, 13.00, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'A galaxy known for its bright central bulge and dust lane', false, 13.00, 'Lenticular');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'A giant galaxy located in the Virgo Cluster', false, 13.00, 'Elliptical');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Moon', 'Earth natural satellite', false, true, 4.50, 'Rocky', 384400, 3);
INSERT INTO public.moon VALUES (3, 'Phobos', 'The larger natural satellite of Mars', false, false, 4.50, 'Rocky', 93760000, 4);
INSERT INTO public.moon VALUES (4, 'Deimos', 'The smaller natural satellite of Mars', false, false, 4.50, 'Rocky', 93760000, 4);
INSERT INTO public.moon VALUES (5, 'Io', 'A volcanic moon of Jupiter', false, true, 4.50, 'Volcanic', 628000000, 5);
INSERT INTO public.moon VALUES (6, 'Europa', 'An icy moon of Jupiter with a subsurface ocean', false, true, 4.50, 'Icy', 628000000, 5);
INSERT INTO public.moon VALUES (7, 'Ganymede', 'The largest moon in the Solar System', false, true, 4.50, 'Icy', 628000000, 5);
INSERT INTO public.moon VALUES (8, 'Callisto', 'A heavily cratered moon of Jupiter', false, true, 4.50, 'Icy', 628000000, 5);
INSERT INTO public.moon VALUES (9, 'Titan', 'A moon of Saturn with a dense atmosphere', false, true, 4.50, 'Icy', 1270000000, 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', 'An icy moon of Saturn with water-rich plumes', false, true, 4.50, 'Icy', 1270000000, 6);
INSERT INTO public.moon VALUES (11, 'Mimas', 'A small icy moon of Saturn', false, true, 4.50, 'Icy', 1270000000, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 'The second largest moon of Saturn', false, true, 4.50, 'Icy', 1270000000, 6);
INSERT INTO public.moon VALUES (13, 'Iapetus', 'A moon of Saturn with contrasting bright and dark surfaces', false, true, 4.50, 'Icy', 1270000000, 6);
INSERT INTO public.moon VALUES (14, 'Titania', 'The largest moon of Uranus', false, true, 4.50, 'Icy', 2000000000, 7);
INSERT INTO public.moon VALUES (15, 'Oberon', 'The outermost major moon of Uranus', false, true, 4.50, 'Icy', 2000000000, 7);
INSERT INTO public.moon VALUES (16, 'Ariel', 'A bright icy moon of Uranus', false, true, 4.50, 'Icy', 2000000000, 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'A dark icy moon of Uranus', false, true, 4.50, 'Icy', 2000000000, 7);
INSERT INTO public.moon VALUES (18, 'Triton', 'The largest moon of Neptune', false, true, 4.50, 'Icy', 2100000000, 8);
INSERT INTO public.moon VALUES (19, 'Proteus', 'One of the largest moons of Neptune', false, false, 4.50, 'Icy', 2100000000, 8);
INSERT INTO public.moon VALUES (20, 'Nereid', 'A distant moon of Neptune with an unusual orbit', false, false, 4.50, 'Icy', 2100000000, 8);
INSERT INTO public.moon VALUES (21, 'Charon', 'The largest moon of Pluto', false, true, 4.50, 'Icy', 2100000000, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The smallest planet in the Solar System and the closest planet to the Sun', false, true, 4.50, 'Terrestrial', 92000000, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'The second planet from the Sun with a very dense atmosphere', false, true, 4.50, 'Terrestrial', 41000000, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'The only known planet with life', true, true, 4.54, 'Terrestrial', 0, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'The red planet, known for its reddish appearance', false, true, 4.50, 'Terrestrial', 78000000, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet in the Solar System', false, true, 4.50, 'Gas Giant', 628000000, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'A gas giant famous for its prominent ring system', false, true, 4.50, 'Gas Giant', 1270000000, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'An ice giant that rotates on its side', false, true, 4.50, 'Ice Giant', 2000000000, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The most distant recognized planet from the Sun', false, true, 4.50, 'Ice Giant', 2100000000, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'A dwarf planet located in the Kuiper Belt', false, true, 4.50, 'Dwarf Planet', 2100000000, 1);
INSERT INTO public.planet VALUES (10, 'Ceres', 'A dwarf planet located in the asteroid belt', false, true, 4.50, 'Dwarf Planet', 413000000, 1);
INSERT INTO public.planet VALUES (11, 'Haumea', 'A rapidly rotating dwarf planet beyond Neptune', false, true, 4.50, 'Dwarf Planet', 2100000000, 1);
INSERT INTO public.planet VALUES (12, 'Eris', 'A distant dwarf planet in the outer Solar System', false, true, 4.50, 'Dwarf Planet', 2100000000, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of our Solar System', true, true, 4.60, 'Yellow dwarf', 0, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'The brightest star in the night sky', false, true, 0.24, 'White main sequence', 8, 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'The closest known star to the Solar System', false, true, 4.85, 'Red dwarf', 4, 1);
INSERT INTO public.star VALUES (4, 'Vega', 'One of the brightest stars in the northern sky', false, true, 0.45, 'Main sequence', 25, 1);
INSERT INTO public.star VALUES (5, 'Mirach', 'A red giant star in the Andromeda constellation', false, true, 3.00, 'Red giant', 197, 2);
INSERT INTO public.star VALUES (6, 'Andromeda Star', 'An educational example of a star in the Andromeda Galaxy', false, true, 5.00, 'Main sequence', 2537000, 2);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

