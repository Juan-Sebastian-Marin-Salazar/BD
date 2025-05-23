--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: campus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.campus (idcampus, nombrecampus, direccioncampus) FROM stdin;
2	Campus Norte	Calle Norte 50, Ciudad B
3	Campus Sur	Boulevard Sur 200, Ciudad C
4	Campus Tecnológico	Av. Innovación 300, Ciudad D
5	Campus Ciencias	Calle Ciencia 75, Ciudad E
1	Campus Central Tecnológico	Av. Innovación 999, Ciudad A
\.


--
-- Data for Name: carreras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carreras (idcarrera, nombrecarrera, titulootorgado) FROM stdin;
2	Ingeniería Civil	Ingeniero Civil
3	Ingeniería Mecánica	Ingeniero Mecánico
4	Ingeniería Electrónica	Ingeniero Electrónico
5	Ingeniería Industrial	Ingeniero Industrial
7	Ingeniería Ambiental	Ingeniero Ambiental
8	Ingeniería en Telecomunicaciones	Ingeniero en Telecomunicaciones
1	Ing. en Sistemas Computacionales	Ingeniero en Sistemas
6	Ingeniería Química	Ingeniero Químico Industrial
\.


--
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departamentos (iddepartamento, nombredepartamento, edificio) FROM stdin;
2	Departamento de Ingeniería Civil	Edificio B
3	Departamento de Ingeniería Mecánica	Edificio C
4	Departamento de Ingeniería Electrónica	Edificio D
5	Departamento de Ingeniería Industrial	Edificio E
6	Departamento de Ingeniería Química	Edificio F
7	Departamento de Ingeniería Ambiental	Edificio G
8	Departamento de Ingeniería en Telecomunicaciones	Edificio H
1	Depto. de Ingeniería en Sistemas	Edificio A
\.


--
-- Data for Name: cursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cursos (idcurso, iddepartamento, nombrecurso, descripcion, creditos, semestre, idcampus) FROM stdin;
3	3	Mecánica de Fluidos	Principios básicos de la mecánica de fluidos.	3	2	3
4	4	Circuitos Eléctricos	Análisis y diseño de circuitos eléctricos básicos.	3	2	4
6	6	Química Orgánica	Estudio de compuestos orgánicos y sus reacciones.	4	3	1
7	7	Ecología y Medio Ambiente	Principios ecológicos y conservación ambiental.	3	1	2
8	8	Telecomunicaciones Digitales	Sistemas y tecnologías de telecomunicaciones digitales.	3	5	3
1	1	Programación Básica	Fundamentos de programación con lenguaje C.	3	1	1
2	2	Estructuras de Concreto	Análisis estructural y diseño de elementos de concreto reforzado.	4	3	2
\.


--
-- Data for Name: profesores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profesores (idprofesor, iddepartamento, nombre, apellido, titulo, email) FROM stdin;
3	3	Carlos	Pérez	Doctor en Ingeniería Mecánica	carlos.perez@uni.edu
4	4	Ana	Rodríguez	Ingeniera Electrónica	ana.rodriguez@uni.edu
5	5	Luis	Fernández	Maestro en Ingeniería Industrial	luis.fernandez@uni.edu
6	6	Sofía	Vargas	Ingeniera Química	sofia.vargas@uni.edu
7	7	Pedro	Luna	Doctor en Ciencias Ambientales	pedro.luna@uni.edu
8	8	Laura	Ríos	Ingeniera en Telecomunicaciones	laura.rios@uni.edu
1	1	José Luis	Martínez	Doctor en Ciencias de la Computación	jose.luis@uni.edu
\.


--
-- Data for Name: cursosprofesores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cursosprofesores (idcursoprofesor, idcurso, idprofesor) FROM stdin;
1	1	1
3	3	3
4	4	4
6	6	6
7	7	7
8	8	8
9	2	1
10	3	1
\.


--
-- Data for Name: estudiantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estudiantes (idestudiante, nombre, apellido, fechanacimiento, direccion, email, idcarrera) FROM stdin;
3	Carlos	Ramírez	1998-11-05	Calle Falsa 789, Ciudad Costa	carlos.ramirez@email.com	5
4	Ana	Martínez	2001-02-28	Boulevard Norte 234, Ciudad Destino	ana.martinez@email.com	2
6	Laura	Fernández	1999-09-09	Avenida Este 678, Ciudad Faro	laura.fernandez@email.com	6
7	Pedro	Vargas	2000-03-22	Calle Oeste 901, Ciudad Gala	pedro.vargas@email.com	7
8	Sofía	Rojas	1998-06-30	Calle Luna 123, Ciudad Hielo	sofia.rojas@email.com	8
1	Luis	García	1999-04-12	Calle Principal 321, Ciudad Alta	lgarcia@estudiantes.uni.edu	1
2	María	López	2000-07-20	Avenida Central 456, Ciudad Baja	mlopez@estudiantes.uni.edu	3
\.


--
-- Data for Name: horarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.horarios (idhorario, idcurso, fechainicio, fechafin, horainicio, horafin) FROM stdin;
1	1	2025-08-01	2025-12-15	08:00:00	10:00:00
2	2	2025-08-01	2025-12-15	10:00:00	12:00:00
3	3	2025-08-02	2025-12-16	08:30:00	10:30:00
4	4	2025-08-02	2025-12-16	11:00:00	13:00:00
6	6	2025-08-03	2025-12-17	12:00:00	14:00:00
7	7	2025-08-04	2025-12-18	07:30:00	09:30:00
8	8	2025-08-04	2025-12-18	10:30:00	12:30:00
\.


--
-- Data for Name: inscripciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscripciones (idinscripcion, idestudiante, idcurso, fechainscripcion, calificacion) FROM stdin;
1	1	1	2025-01-15	85
2	2	2	2025-01-16	90
3	3	3	2025-01-17	75
6	6	6	2025-01-20	70
7	7	7	2025-01-21	95
8	8	8	2025-01-22	87
\.


--
-- Data for Name: programasestudio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.programasestudio (idprograma, nombreprograma, descripcionprograma) FROM stdin;
2	Ingeniería Civil	Programa dedicado al diseño, construcción y mantenimiento de infraestructuras.
3	Ingeniería Mecánica	Programa centrado en el diseño y fabricación de maquinaria y sistemas mecánicos.
4	Ingeniería Electrónica	Programa orientado al diseño de circuitos electrónicos y sistemas de control.
5	Ingeniería Industrial	Programa enfocado en la optimización de procesos productivos y gestión industrial.
6	Ingeniería Química	Programa dedicado a la transformación de materias primas en productos químicos.
7	Ingeniería Ambiental	Programa centrado en la protección y gestión del medio ambiente.
8	Ingeniería en Telecomunicaciones	Programa orientado a la comunicación y transmisión de datos a distancia.
1	Ingeniería en Sistemas Computacionales	Programa con enfoque en software, redes y tecnologías emergentes.
\.


--
-- Data for Name: programascursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.programascursos (idprogramacurso, idprograma, idcurso) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
6	6	6
7	7	7
8	8	8
\.


--
-- Name: campus_idcampus_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.campus_idcampus_seq', 5, true);


--
-- Name: carreras_idcarrera_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carreras_idcarrera_seq', 8, true);


--
-- Name: cursos_idcurso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursos_idcurso_seq', 8, true);


--
-- Name: cursosprofesores_idcursoprofesor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursosprofesores_idcursoprofesor_seq', 10, true);


--
-- Name: departamentos_iddepartamento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departamentos_iddepartamento_seq', 8, true);


--
-- Name: estudiantes_idestudiante_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estudiantes_idestudiante_seq', 8, true);


--
-- Name: horarios_idhorario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.horarios_idhorario_seq', 8, true);


--
-- Name: inscripciones_idinscripcion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inscripciones_idinscripcion_seq', 8, true);


--
-- Name: profesores_idprofesor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profesores_idprofesor_seq', 8, true);


--
-- Name: programascursos_idprogramacurso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programascursos_idprogramacurso_seq', 8, true);


--
-- Name: programasestudio_idprograma_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programasestudio_idprograma_seq', 8, true);


--
-- PostgreSQL database dump complete
--

