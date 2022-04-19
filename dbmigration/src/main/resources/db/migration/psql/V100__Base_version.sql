--
-- PostgreSQL database init version
--


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
-- Name: exec_reports; Type: TABLE; Schema: public; Owner: trading
--

CREATE TABLE public.exec_reports (
    id bigint NOT NULL,
    last_updated timestamp without time zone NOT NULL,
    update_count integer NOT NULL,
    account character varying(255),
    avg_price numeric(17,7) NOT NULL,
    cum_qty numeric(17,7) NOT NULL,
    eff_cum_qty numeric(17,7) NOT NULL,
    expiry character varying(255),
    last_price numeric(17,7),
    last_qty numeric(17,7),
    option_type integer,
    order_id character varying(255) NOT NULL,
    orig_order_id character varying(255),
    root_order_id character varying(255) NOT NULL,
    send_time timestamp without time zone NOT NULL,
    strike_price numeric(17,7),
    symbol character varying(255) NOT NULL,
    actor_id bigint,
    report_id bigint NOT NULL,
    viewer_id bigint,
    broker_order_id character varying(255) NOT NULL,
    exec_id character varying(255) NOT NULL,
    exec_type character varying(255) NOT NULL,
    ord_status character varying(255) NOT NULL,
    security_type character varying(255) NOT NULL,
    side character varying(255) NOT NULL,
    leaves_qty numeric(17,7) NOT NULL,
    order_qty numeric(17,7) NOT NULL,
    order_type character varying(255),
    price numeric(17,7),
    tif character varying(255)
);


ALTER TABLE public.exec_reports OWNER TO trading;

--
-- Name: order_status; Type: TABLE; Schema: public; Owner: trading
--

CREATE TABLE public.order_status (
    id bigint NOT NULL,
    last_updated timestamp without time zone NOT NULL,
    update_count integer NOT NULL,
    account character varying(255),
    avg_px numeric(17,7) NOT NULL,
    broker_id character varying(255),
    cum_qty numeric(17,7) NOT NULL,
    expiry character varying(255),
    last_px numeric(17,7) NOT NULL,
    last_qty numeric(17,7) NOT NULL,
    leaves_qty numeric(17,7) NOT NULL,
    option_type integer,
    order_id character varying(255) NOT NULL,
    order_px numeric(17,7),
    order_qty numeric(17,7) NOT NULL,
    ord_status character varying(255) NOT NULL,
    root_order_id character varying(255) NOT NULL,
    security_type integer NOT NULL,
    sending_time timestamp without time zone NOT NULL,
    side integer NOT NULL,
    strike_price numeric(17,7),
    symbol character varying(255) NOT NULL,
    execution_time timestamp without time zone,
    actor_id bigint,
    report_id bigint NOT NULL,
    viewer_id bigint
);


ALTER TABLE public.order_status OWNER TO trading;

--
-- Name: permissions; Type: TABLE; Schema: public; Owner: trading
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    last_updated timestamp without time zone NOT NULL,
    update_count integer NOT NULL,
    description character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.permissions OWNER TO trading;

--
-- Name: reports; Type: TABLE; Schema: public; Owner: trading
--

CREATE TABLE public.reports (
    id bigint NOT NULL,
    last_updated timestamp without time zone NOT NULL,
    update_count integer NOT NULL,
    broker_id character varying(255),
    hierarchy integer,
    originator integer,
    report_type integer NOT NULL,
    msg_seq_num integer NOT NULL,
    order_id character varying(255) NOT NULL,
    report_id bigint NOT NULL,
    send_time timestamp without time zone NOT NULL,
    session_id character varying(255) NOT NULL,
    actor_id bigint,
    viewer_id bigint,
    transact_time timestamp without time zone NOT NULL,
    text character varying(255)
);


ALTER TABLE public.reports OWNER TO trading;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: trading
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    last_updated timestamp without time zone NOT NULL,
    update_count integer NOT NULL,
    description character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.roles OWNER TO trading;

--
-- Name: roles_permissions; Type: TABLE; Schema: public; Owner: trading
--

CREATE TABLE public.roles_permissions (
    roles_id bigint NOT NULL,
    permissions_id bigint NOT NULL
);


ALTER TABLE public.roles_permissions OWNER TO trading;

--
-- Name: roles_users; Type: TABLE; Schema: public; Owner: trading
--

CREATE TABLE public.roles_users (
    role_id bigint NOT NULL,
    subjects_id bigint NOT NULL
);


ALTER TABLE public.roles_users OWNER TO trading;

--
-- Name: user_attributes; Type: TABLE; Schema: public; Owner: trading
--

CREATE TABLE public.user_attributes (
    id bigint NOT NULL,
    last_updated timestamp without time zone NOT NULL,
    update_count integer NOT NULL,
    attribute text NOT NULL,
    user_attribute_type integer NOT NULL,
    user_id bigint
);


ALTER TABLE public.user_attributes OWNER TO trading;

--
-- Name: users; Type: TABLE; Schema: public; Owner: trading
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    last_updated timestamp without time zone NOT NULL,
    update_count integer NOT NULL,
    description character varying(255),
    name character varying(255) NOT NULL,
    is_active boolean NOT NULL,
    password character varying(255) NOT NULL,
    is_superuser boolean NOT NULL,
    user_data text
);


ALTER TABLE public.users OWNER TO trading;

--
-- Data for Name: exec_reports; Type: TABLE DATA; Schema: public; Owner: trading
--

COPY public.exec_reports (id, last_updated, update_count, account, avg_price, cum_qty, eff_cum_qty, expiry, last_price, last_qty, option_type, order_id, orig_order_id, root_order_id, send_time, strike_price, symbol, actor_id, report_id, viewer_id, broker_order_id, exec_id, exec_type, ord_status, security_type, side, leaves_qty, order_qty, order_type, price, tif) FROM stdin;
\.


--
-- Data for Name: order_status; Type: TABLE DATA; Schema: public; Owner: trading
--

COPY public.order_status (id, last_updated, update_count, account, avg_px, broker_id, cum_qty, expiry, last_px, last_qty, leaves_qty, option_type, order_id, order_px, order_qty, ord_status, root_order_id, security_type, sending_time, side, strike_price, symbol, execution_time, actor_id, report_id, viewer_id) FROM stdin;
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: trading
--

COPY public.permissions (id, last_updated, update_count, description, name) FROM stdin;
5	2018-11-13 08:00:20.531	0	Access to Add Session action	AddSessionAction
6	2018-11-13 08:00:20.542	0	Access to Delete Session action	DeleteSessionAction
7	2018-11-13 08:00:20.552	0	Access to disable session action	DisableSessionAction
8	2018-11-13 08:00:20.564	0	Access to edit session action	EditSessionAction
9	2018-11-13 08:00:20.57	0	Access to enable session action	EnableSessionAction
10	2018-11-13 08:00:20.577	0	Access to update sequence numbers action	UpdateSequenceAction
11	2018-11-13 08:00:20.59	0	Access to start session action	StartSessionAction
12	2018-11-13 08:00:20.599	0	Access to stop session action	StopSessionAction
13	2018-11-13 08:00:20.605	0	Access to view session action	ViewSessionAction
14	2018-11-13 08:00:20.611	0	Access to read instance data action	ReadInstanceDataAction
15	2018-11-13 08:00:20.617	0	Access to read FIX session attribute descriptors action	ReadFixSessionAttributeDescriptorsAction
16	2018-11-13 08:00:20.624	0	Access to create user action	CreateUserAction
17	2018-11-13 08:00:20.63	0	Access to read user action	ReadUserAction
18	2018-11-13 08:00:20.636	0	Access to update user action	UpdateUserAction
19	2018-11-13 08:00:20.642	0	Access to delete user action	DeleteUserAction
20	2018-11-13 08:00:20.652	0	Access to change user password action	ChangeUserPasswordAction
21	2018-11-13 08:00:20.658	0	Access to read user permissions action	ReadUserPermisionsAction
22	2018-11-13 08:00:20.663	0	Access to create permission action	CreatePermissionAction
23	2018-11-13 08:00:20.668	0	Access to read permission action	ReadPermissionAction
24	2018-11-13 08:00:20.673	0	Access to update permission action	UpdatePermissionAction
25	2018-11-13 08:00:20.678	0	Access to delete permission action	DeletePermissionAction
26	2018-11-13 08:00:20.685	0	Access to create role action	CreateRoleAction
27	2018-11-13 08:00:20.691	0	Access to read role action	ReadRoleAction
28	2018-11-13 08:00:20.695	0	Access to update role action	UpdateRoleAction
29	2018-11-13 08:00:20.7	0	Access to delete role action	DeleteRoleAction
30	2018-11-13 08:00:20.704	0	Access to view broker status action	ViewBrokerStatusAction
31	2018-11-13 08:00:20.709	0	Access to view open orders action	ViewOpenOrdersAction
32	2018-11-13 08:00:20.713	0	Access to view reports action	ViewReportAction
33	2018-11-13 08:00:20.718	0	Access to view positions action	ViewPositionAction
34	2018-11-13 08:00:20.722	0	Access to send new orders action	SendOrderAction
35	2018-11-13 08:00:20.726	0	Access to view user data action	ViewUserDataAction
36	2018-11-13 08:00:20.731	0	Access to write user data action	WriteUserDataAction
37	2018-11-13 08:00:20.735	0	Access to manually add new reports action	AddReportAction
38	2018-11-13 08:00:20.74	0	Access to manually delete reports action	DeleteReportAction
39	2018-11-13 08:00:20.744	0	Access to read a user attribute action	ReadUserAttributeAction
40	2018-11-13 08:00:20.747	0	Access to write a user attribute action	WriteUserAttributeAction
45	2018-11-13 08:00:20.747	0	Access to request market data	RequestMarketDataAction
\.


--
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: trading
--

COPY public.reports (id, last_updated, update_count, broker_id, hierarchy, originator, report_type, msg_seq_num, order_id, report_id, send_time, session_id, actor_id, viewer_id, transact_time, text) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: trading
--

COPY public.roles (id, last_updated, update_count, description, name) FROM stdin;
41	2018-11-13 08:00:20.827	0	Admin role	Admin
42	2018-11-13 08:00:20.88	0	Trader role	Trader
43	2018-11-13 08:00:20.911	0	Trader Admin role	TraderAdmin
\.


--
-- Data for Name: roles_permissions; Type: TABLE DATA; Schema: public; Owner: trading
--

COPY public.roles_permissions (roles_id, permissions_id) FROM stdin;
41	21
41	11
41	39
41	24
41	9
41	40
41	5
41	6
41	17
41	18
41	29
41	7
41	12
41	23
41	14
41	10
41	35
41	22
41	28
41	19
41	27
41	30
41	26
41	13
41	15
41	16
41	20
41	8
41	25
41	36
42	30
42	36
42	39
42	32
42	31
42	40
42	33
42	34
42	37
42	35
43	38
43	36
43	32
43	31
43	39
43	33
43	30
43	40
43	34
43	35
43	37
42	45
\.


--
-- Data for Name: roles_users; Type: TABLE DATA; Schema: public; Owner: trading
--

COPY public.roles_users (role_id, subjects_id) FROM stdin;
41	1
42	3
43	4
\.


--
-- Data for Name: user_attributes; Type: TABLE DATA; Schema: public; Owner: trading
--

COPY public.user_attributes (id, last_updated, update_count, attribute, user_attribute_type, user_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: trading
--

COPY public.users (id, last_updated, update_count, description, name, is_active, password, is_superuser, user_data) FROM stdin;
1	2018-11-13 08:00:12.67	0	\N	admin	t	$2a$10$kfVP4tGnFJrZf1pcjo5pVe7cbyVUguMYoz4tgP12gubXlbNwRJuP.	t	\N
3	2018-11-13 08:00:20.469	0	Trader user	trader	t	$2a$10$ISknot6OPe/PI1dQdKmTluxSrRyJwOVI5ex31XdqGPHlWl6vuTseW	f	\N
4	2018-11-13 08:00:20.515	0	Trader Admin user	traderAdmin	t	$2a$10$N6ADcu9ZdD3tFik0lkMRJO7PO0XFbxAjNMhujBjp6F0n3iJyVoGgG	f	\N
\.


--
-- Name: exec_reports exec_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: trading
--

ALTER TABLE ONLY public.exec_reports
    ADD CONSTRAINT exec_reports_pkey PRIMARY KEY (id);


--
-- Name: order_status order_status_pkey; Type: CONSTRAINT; Schema: public; Owner: trading
--

ALTER TABLE ONLY public.order_status
    ADD CONSTRAINT order_status_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: trading
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: reports reports_pkey; Type: CONSTRAINT; Schema: public; Owner: trading
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- Name: roles_permissions roles_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: trading
--

ALTER TABLE ONLY public.roles_permissions
    ADD CONSTRAINT roles_permissions_pkey PRIMARY KEY (roles_id, permissions_id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: trading
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: roles_users roles_users_pkey; Type: CONSTRAINT; Schema: public; Owner: trading
--

ALTER TABLE ONLY public.roles_users
    ADD CONSTRAINT roles_users_pkey PRIMARY KEY (role_id, subjects_id);


--
-- Name: users uk3g1j96g94xpk3lpxl2qbl985x; Type: CONSTRAINT; Schema: public; Owner: trading
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk3g1j96g94xpk3lpxl2qbl985x UNIQUE (name);


--
-- Name: reports uk_aely7chrvtqwv4xfm76xuj5bh; Type: CONSTRAINT; Schema: public; Owner: trading
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT uk_aely7chrvtqwv4xfm76xuj5bh UNIQUE (report_id);


--
-- Name: order_status uk_h8v9n38cydusmk1d0yya6nd2d; Type: CONSTRAINT; Schema: public; Owner: trading
--

ALTER TABLE ONLY public.order_status
    ADD CONSTRAINT uk_h8v9n38cydusmk1d0yya6nd2d UNIQUE (report_id);


--
-- Name: exec_reports uk_imdq099u0qa8ob9tt5ljm6f7u; Type: CONSTRAINT; Schema: public; Owner: trading
--

ALTER TABLE ONLY public.exec_reports
    ADD CONSTRAINT uk_imdq099u0qa8ob9tt5ljm6f7u UNIQUE (report_id);


--
-- Name: roles uk_ofx66keruapi6vyqpv6f2or37; Type: CONSTRAINT; Schema: public; Owner: trading
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT uk_ofx66keruapi6vyqpv6f2or37 UNIQUE (name);


--
-- Name: permissions uk_pnvtwliis6p05pn6i3ndjrqt2; Type: CONSTRAINT; Schema: public; Owner: trading
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT uk_pnvtwliis6p05pn6i3ndjrqt2 UNIQUE (name);


--
-- Name: user_attributes user_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: trading
--

ALTER TABLE ONLY public.user_attributes
    ADD CONSTRAINT user_attributes_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: trading
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: exec_reports fk1celhypj9vint37eobsn22s1b; Type: FK CONSTRAINT; Schema: public; Owner: trading
--

ALTER TABLE ONLY public.exec_reports
    ADD CONSTRAINT fk1celhypj9vint37eobsn22s1b FOREIGN KEY (viewer_id) REFERENCES public.users(id);


--
-- Name: roles_permissions fk570wuy6sacdnrw8wdqjfh7j0q; Type: FK CONSTRAINT; Schema: public; Owner: trading
--

ALTER TABLE ONLY public.roles_permissions
    ADD CONSTRAINT fk570wuy6sacdnrw8wdqjfh7j0q FOREIGN KEY (permissions_id) REFERENCES public.permissions(id);


--
-- Name: roles_permissions fkb9gqc5kvla3ijovnihsbb816e; Type: FK CONSTRAINT; Schema: public; Owner: trading
--

ALTER TABLE ONLY public.roles_permissions
    ADD CONSTRAINT fkb9gqc5kvla3ijovnihsbb816e FOREIGN KEY (roles_id) REFERENCES public.roles(id);


--
-- Name: exec_reports fkfn47lj607ghtt1lfie8adevxc; Type: FK CONSTRAINT; Schema: public; Owner: trading
--

ALTER TABLE ONLY public.exec_reports
    ADD CONSTRAINT fkfn47lj607ghtt1lfie8adevxc FOREIGN KEY (actor_id) REFERENCES public.users(id);


--
-- Name: reports fkh0r6ppu75byn1y7y0uiteel8q; Type: FK CONSTRAINT; Schema: public; Owner: trading
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT fkh0r6ppu75byn1y7y0uiteel8q FOREIGN KEY (actor_id) REFERENCES public.users(id);


--
-- Name: roles_users fkjdau0sn88gj3b7oiym39qaymk; Type: FK CONSTRAINT; Schema: public; Owner: trading
--

ALTER TABLE ONLY public.roles_users
    ADD CONSTRAINT fkjdau0sn88gj3b7oiym39qaymk FOREIGN KEY (subjects_id) REFERENCES public.users(id);


--
-- Name: order_status fkjqtx22v71dod89tht0fywav7; Type: FK CONSTRAINT; Schema: public; Owner: trading
--

ALTER TABLE ONLY public.order_status
    ADD CONSTRAINT fkjqtx22v71dod89tht0fywav7 FOREIGN KEY (report_id) REFERENCES public.reports(id);


--
-- Name: order_status fklxkg9il8q8k9448o5nggibnbs; Type: FK CONSTRAINT; Schema: public; Owner: trading
--

ALTER TABLE ONLY public.order_status
    ADD CONSTRAINT fklxkg9il8q8k9448o5nggibnbs FOREIGN KEY (actor_id) REFERENCES public.users(id);


--
-- Name: exec_reports fkn47ta2b6e9wih8b97oubxvd3s; Type: FK CONSTRAINT; Schema: public; Owner: trading
--

ALTER TABLE ONLY public.exec_reports
    ADD CONSTRAINT fkn47ta2b6e9wih8b97oubxvd3s FOREIGN KEY (report_id) REFERENCES public.reports(id);


--
-- Name: roles_users fkrxa1kwvac3vq2p3a4aus28m3p; Type: FK CONSTRAINT; Schema: public; Owner: trading
--

ALTER TABLE ONLY public.roles_users
    ADD CONSTRAINT fkrxa1kwvac3vq2p3a4aus28m3p FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: reports fksfc0wdpjferohmpylygff4urs; Type: FK CONSTRAINT; Schema: public; Owner: trading
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT fksfc0wdpjferohmpylygff4urs FOREIGN KEY (viewer_id) REFERENCES public.users(id);


--
-- Name: user_attributes fkskw1x6g2kt3g0i9507k4a4tqw; Type: FK CONSTRAINT; Schema: public; Owner: trading
--

ALTER TABLE ONLY public.user_attributes
    ADD CONSTRAINT fkskw1x6g2kt3g0i9507k4a4tqw FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: order_status fkt8iysrml49hnmembw8pkv5g3n; Type: FK CONSTRAINT; Schema: public; Owner: trading
--

ALTER TABLE ONLY public.order_status
    ADD CONSTRAINT fkt8iysrml49hnmembw8pkv5g3n FOREIGN KEY (viewer_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--
