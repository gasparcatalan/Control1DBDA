--
-- PostgreSQL database dump
--

-- Dumped from database version 12.14
-- Dumped by pg_dump version 12.14

-- Started on 2023-03-29 21:45:51

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
-- TOC entry 208 (class 1259 OID 16742)
-- Name: COMUNA; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."COMUNA" (
    "ID_COMUNA" integer NOT NULL,
    "Nombre" "char"[] NOT NULL
);


ALTER TABLE public."COMUNA" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16870)
-- Name: COMUNA_ID_COMUNA_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."COMUNA" ALTER COLUMN "ID_COMUNA" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."COMUNA_ID_COMUNA_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 205 (class 1259 OID 16733)
-- Name: EMPLEADO; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."EMPLEADO" (
    "ID_EMPLEADO" integer NOT NULL,
    "APELLIDO" "char"[] NOT NULL,
    "NOMBRE" "char"[] NOT NULL,
    "ID_COMUNA" integer NOT NULL,
    "CARGO" "char"[] NOT NULL
);


ALTER TABLE public."EMPLEADO" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16866)
-- Name: EMPLEADO_ID_EMPLEADO_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."EMPLEADO" ALTER COLUMN "ID_EMPLEADO" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."EMPLEADO_ID_EMPLEADO_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 203 (class 1259 OID 16727)
-- Name: PROD_VENTA; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PROD_VENTA" (
    "ID_PROD_VENTA" integer NOT NULL,
    "ID_PRODUCTO" integer NOT NULL,
    "ID_VENTA" integer NOT NULL,
    "ID_VENDEDOR" integer NOT NULL
);


ALTER TABLE public."PROD_VENTA" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16838)
-- Name: PROD-VENTA_ID_PROD_VENTA_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."PROD_VENTA" ALTER COLUMN "ID_PROD_VENTA" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."PROD-VENTA_ID_PROD_VENTA_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 202 (class 1259 OID 16724)
-- Name: PRODUCTO; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PRODUCTO" (
    "ID_PRODUCTO" integer NOT NULL,
    "NOMBRE" "char"[] NOT NULL,
    "PRECIO" integer NOT NULL
);


ALTER TABLE public."PRODUCTO" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16855)
-- Name: PRODUCTO_ID_PRODUCTO_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."PRODUCTO" ALTER COLUMN "ID_PRODUCTO" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."PRODUCTO_ID_PRODUCTO_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 204 (class 1259 OID 16730)
-- Name: SUELDO; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SUELDO" (
    "ID_SUELDO" integer NOT NULL,
    "ID_EMPLEADO" integer NOT NULL,
    "TOTAL" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."SUELDO" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16877)
-- Name: SUELDO_ID_SUELDO_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SUELDO" ALTER COLUMN "ID_SUELDO" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."SUELDO_ID_SUELDO_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 211 (class 1259 OID 16751)
-- Name: TIENDA; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TIENDA" (
    "ID_TIENDA" integer NOT NULL,
    "ID_COMUNA" integer NOT NULL,
    "NOMBRE" "char"[] NOT NULL
);


ALTER TABLE public."TIENDA" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16739)
-- Name: TIENDA_EMP; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TIENDA_EMP" (
    "ID_TIENDA_EMP" integer NOT NULL,
    "ID_TIENDA" integer NOT NULL,
    "ID_EMPLEADO" integer NOT NULL
);


ALTER TABLE public."TIENDA_EMP" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16804)
-- Name: TIENDA_EMP_ID_TIENDA_EMP_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."TIENDA_EMP" ALTER COLUMN "ID_TIENDA_EMP" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."TIENDA_EMP_ID_TIENDA_EMP_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 16879)
-- Name: TIENDA_ID_TIENDA_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."TIENDA" ALTER COLUMN "ID_TIENDA" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."TIENDA_ID_TIENDA_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 209 (class 1259 OID 16745)
-- Name: TIPO_DOC; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TIPO_DOC" (
    "ID_DOC" integer NOT NULL,
    "TIPO" "char"[] NOT NULL
);


ALTER TABLE public."TIPO_DOC" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16800)
-- Name: TIPO_DOC_ID_DOC_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."TIPO_DOC" ALTER COLUMN "ID_DOC" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."TIPO_DOC_ID_DOC_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 206 (class 1259 OID 16736)
-- Name: VENDEDOR; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."VENDEDOR" (
    "ID_VENDEDOR" integer NOT NULL,
    "ID_EMPLEADO" integer NOT NULL,
    "NOMBRE" "char"[] NOT NULL,
    "APELLIDO" "char"[] NOT NULL
);


ALTER TABLE public."VENDEDOR" OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16802)
-- Name: VENDEDOR_ID_VENDEDOR_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."VENDEDOR" ALTER COLUMN "ID_VENDEDOR" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."VENDEDOR_ID_VENDEDOR_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 210 (class 1259 OID 16748)
-- Name: VENTA; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."VENTA" (
    "ID_VENTA" integer NOT NULL,
    "ID_TIENDA" integer NOT NULL,
    "TOTAL" integer NOT NULL,
    "ID_TIPO_DOC" integer NOT NULL
);


ALTER TABLE public."VENTA" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16886)
-- Name: VENTA_ID_VENTA_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."VENTA" ALTER COLUMN "ID_VENTA" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."VENTA_ID_VENTA_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 2761 (class 2606 OID 16869)
-- Name: COMUNA COMUNA_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."COMUNA"
    ADD CONSTRAINT "COMUNA_pkey" PRIMARY KEY ("ID_COMUNA");


--
-- TOC entry 2755 (class 2606 OID 16764)
-- Name: EMPLEADO EMPLEADO_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EMPLEADO"
    ADD CONSTRAINT "EMPLEADO_pkey" PRIMARY KEY ("ID_EMPLEADO");


--
-- TOC entry 2751 (class 2606 OID 16844)
-- Name: PROD_VENTA PROD-VENTA_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PROD_VENTA"
    ADD CONSTRAINT "PROD-VENTA_pkey" PRIMARY KEY ("ID_PROD_VENTA");


--
-- TOC entry 2749 (class 2606 OID 16858)
-- Name: PRODUCTO PRODUCTO_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PRODUCTO"
    ADD CONSTRAINT "PRODUCTO_pkey" PRIMARY KEY ("ID_PRODUCTO");


--
-- TOC entry 2753 (class 2606 OID 16789)
-- Name: SUELDO SUELDO_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SUELDO"
    ADD CONSTRAINT "SUELDO_pkey" PRIMARY KEY ("ID_SUELDO");


--
-- TOC entry 2759 (class 2606 OID 16810)
-- Name: TIENDA_EMP TIENDA_EMP_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TIENDA_EMP"
    ADD CONSTRAINT "TIENDA_EMP_pkey" PRIMARY KEY ("ID_TIENDA_EMP");


--
-- TOC entry 2767 (class 2606 OID 16769)
-- Name: TIENDA TIENDA_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TIENDA"
    ADD CONSTRAINT "TIENDA_pkey" PRIMARY KEY ("ID_TIENDA");


--
-- TOC entry 2763 (class 2606 OID 16799)
-- Name: TIPO_DOC TIPO_DOC_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TIPO_DOC"
    ADD CONSTRAINT "TIPO_DOC_pkey" PRIMARY KEY ("ID_DOC");


--
-- TOC entry 2757 (class 2606 OID 16781)
-- Name: VENDEDOR VENDEDOR_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."VENDEDOR"
    ADD CONSTRAINT "VENDEDOR_pkey" PRIMARY KEY ("ID_VENDEDOR");


--
-- TOC entry 2765 (class 2606 OID 16771)
-- Name: VENTA VENTA_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."VENTA"
    ADD CONSTRAINT "VENTA_pkey" PRIMARY KEY ("ID_VENTA");


--
-- TOC entry 2772 (class 2606 OID 16872)
-- Name: EMPLEADO ID_COMUNA; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EMPLEADO"
    ADD CONSTRAINT "ID_COMUNA" FOREIGN KEY ("ID_COMUNA") REFERENCES public."COMUNA"("ID_COMUNA") NOT VALID;


--
-- TOC entry 2778 (class 2606 OID 16881)
-- Name: TIENDA ID_COMUNA; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TIENDA"
    ADD CONSTRAINT "ID_COMUNA" FOREIGN KEY ("ID_COMUNA") REFERENCES public."COMUNA"("ID_COMUNA") NOT VALID;


--
-- TOC entry 2773 (class 2606 OID 16782)
-- Name: VENDEDOR ID_EMPLEADO; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."VENDEDOR"
    ADD CONSTRAINT "ID_EMPLEADO" FOREIGN KEY ("ID_EMPLEADO") REFERENCES public."EMPLEADO"("ID_EMPLEADO") NOT VALID;


--
-- TOC entry 2771 (class 2606 OID 16790)
-- Name: SUELDO ID_EMPLEADO; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SUELDO"
    ADD CONSTRAINT "ID_EMPLEADO" FOREIGN KEY ("ID_EMPLEADO") REFERENCES public."EMPLEADO"("ID_EMPLEADO") NOT VALID;


--
-- TOC entry 2775 (class 2606 OID 16816)
-- Name: TIENDA_EMP ID_EMPLEADO; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TIENDA_EMP"
    ADD CONSTRAINT "ID_EMPLEADO" FOREIGN KEY ("ID_EMPLEADO") REFERENCES public."EMPLEADO"("ID_EMPLEADO") NOT VALID;


--
-- TOC entry 2770 (class 2606 OID 16859)
-- Name: PROD_VENTA ID_PRODUCTO; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PROD_VENTA"
    ADD CONSTRAINT "ID_PRODUCTO" FOREIGN KEY ("ID_PRODUCTO") REFERENCES public."PRODUCTO"("ID_PRODUCTO") NOT VALID;


--
-- TOC entry 2776 (class 2606 OID 16772)
-- Name: VENTA ID_TIENDA; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."VENTA"
    ADD CONSTRAINT "ID_TIENDA" FOREIGN KEY ("ID_TIENDA") REFERENCES public."TIENDA"("ID_TIENDA") NOT VALID;


--
-- TOC entry 2774 (class 2606 OID 16811)
-- Name: TIENDA_EMP ID_TIENDA; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TIENDA_EMP"
    ADD CONSTRAINT "ID_TIENDA" FOREIGN KEY ("ID_TIENDA") REFERENCES public."TIENDA"("ID_TIENDA") NOT VALID;


--
-- TOC entry 2777 (class 2606 OID 16888)
-- Name: VENTA ID_TIPO_DOC; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."VENTA"
    ADD CONSTRAINT "ID_TIPO_DOC" FOREIGN KEY ("ID_TIPO_DOC") REFERENCES public."TIPO_DOC"("ID_DOC") NOT VALID;


--
-- TOC entry 2769 (class 2606 OID 16850)
-- Name: PROD_VENTA ID_VENDEDOR; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PROD_VENTA"
    ADD CONSTRAINT "ID_VENDEDOR" FOREIGN KEY ("ID_VENDEDOR") REFERENCES public."VENDEDOR"("ID_VENDEDOR") NOT VALID;


--
-- TOC entry 2768 (class 2606 OID 16845)
-- Name: PROD_VENTA ID_VENTA; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PROD_VENTA"
    ADD CONSTRAINT "ID_VENTA" FOREIGN KEY ("ID_VENTA") REFERENCES public."VENTA"("ID_VENTA") NOT VALID;


-- Completed on 2023-03-29 21:45:51

--
-- PostgreSQL database dump complete
--

