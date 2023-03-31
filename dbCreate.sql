CREATE TABLE public."comuna" (
    "id_comuna" integer NOT NULL,
    "nombre" text NOT NULL
);


ALTER TABLE public."comuna" OWNER TO postgres;

ALTER TABLE public."comuna" ALTER COLUMN "id_comuna" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."comuna_id_comuna_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


CREATE TABLE public."empleado" (
    "id_empleado" integer NOT NULL,
    "apellido" text NOT NULL,
    "nombre" text NOT NULL,
    "id_comuna" integer NOT NULL,
    "cargo" text NOT NULL
);


ALTER TABLE public."empleado" OWNER TO postgres;

ALTER TABLE public."empleado" ALTER COLUMN "id_empleado" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."empleado_id_empleado_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


CREATE TABLE public."prod_venta" (
    "id_prod_venta" integer NOT NULL,
    "id_producto" integer NOT NULL,
    "id_venta" integer NOT NULL,
    "id_vendedor" integer NOT NULL,
    "fecha" date NOT NULL
);


ALTER TABLE public."prod_venta" OWNER TO postgres;


ALTER TABLE public."prod_venta" ALTER COLUMN "id_prod_venta" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."prod_venta_id_prod_venta_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE public."producto" (
    "id_producto" integer NOT NULL,
    "nombre" text NOT NULL,
    "precio" integer NOT NULL
);


ALTER TABLE public."producto" OWNER TO postgres;

ALTER TABLE public."producto" ALTER COLUMN "id_producto" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."producto_id_producto_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


CREATE TABLE public."sueldo" (
    "id_sueldo" integer NOT NULL,
    "id_empleado" integer NOT NULL,
    "total" integer DEFAULT 0 NOT NULL,
    "fecha" date NOT NULL
);

ALTER TABLE public."sueldo" OWNER TO postgres;

ALTER TABLE public."sueldo" ALTER COLUMN "id_sueldo" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."sueldo_id_sueldo_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE public."tienda" (
    "id_tienda" integer NOT NULL,
    "id_comuna" integer NOT NULL,
    "nombre" text NOT NULL
);


ALTER TABLE public."tienda" OWNER TO postgres;

CREATE TABLE public."tienda_emp" (
    "id_tienda_emp" integer NOT NULL,
    "id_tienda" integer NOT NULL,
    "id_empleado" integer NOT NULL
);


ALTER TABLE public."tienda_emp" OWNER TO postgres;

ALTER TABLE public."tienda_emp" ALTER COLUMN "id_tienda_emp" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."tienda_emp_id_tienda_emp_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

ALTER TABLE public."tienda" ALTER COLUMN "id_tienda" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."tienda_id_tienda_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE public."tipo_doc" (
    "id_doc" integer NOT NULL,
    "tipo" text NOT NULL
);


ALTER TABLE public."tipo_doc" OWNER TO postgres;

ALTER TABLE public."tipo_doc" ALTER COLUMN "id_doc" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."tipo_doc_id_doc_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE public."vendedor" (
    "id_vendedor" integer NOT NULL,
    "id_empleado" integer NOT NULL,
    "nombre" text NOT NULL,
    "apellido" text NOT NULL
);


ALTER TABLE public."vendedor" OWNER TO postgres;

ALTER TABLE public."vendedor" ALTER COLUMN "id_vendedor" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."vendedor_id_vendedor_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE public."venta" (
    "id_venta" integer NOT NULL,
    "id_tienda" integer NOT NULL,
    "total" integer NOT NULL,
    "id_tipo_doc" integer NOT NULL
);


ALTER TABLE public."venta" OWNER TO postgres;

ALTER TABLE public."venta" ALTER COLUMN "id_venta" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."venta_id_venta_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

ALTER TABLE ONLY public."comuna"
    ADD CONSTRAINT "comuna_pkey" PRIMARY KEY ("id_comuna");

ALTER TABLE ONLY public."empleado"
    ADD CONSTRAINT "empleado_pkey" PRIMARY KEY ("id_empleado");

ALTER TABLE ONLY public."prod_venta"
    ADD CONSTRAINT "prod-venta_pkey" PRIMARY KEY ("id_prod_venta");

ALTER TABLE ONLY public."producto"
    ADD CONSTRAINT "producto_pkey" PRIMARY KEY ("id_producto");

ALTER TABLE ONLY public."sueldo"
    ADD CONSTRAINT "sueldo_pkey" PRIMARY KEY ("id_sueldo");

ALTER TABLE ONLY public."tienda_emp"
    ADD CONSTRAINT "tienda_emp_pkey" PRIMARY KEY ("id_tienda_emp");

ALTER TABLE ONLY public."tienda"
    ADD CONSTRAINT "tienda_pkey" PRIMARY KEY ("id_tienda");

ALTER TABLE ONLY public."tipo_doc"
    ADD CONSTRAINT "tipo_doc_pkey" PRIMARY KEY ("id_doc");

ALTER TABLE ONLY public."vendedor"
    ADD CONSTRAINT "vendedor_pkey" PRIMARY KEY ("id_vendedor");

ALTER TABLE ONLY public."venta"
    ADD CONSTRAINT "venta_pkey" PRIMARY KEY ("id_venta");

ALTER TABLE ONLY public."empleado"
    ADD CONSTRAINT "id_empleado" FOREIGN KEY ("id_comuna") REFERENCES public."comuna"("id_comuna") NOT VALID;

ALTER TABLE ONLY public."tienda"
    ADD CONSTRAINT "id_comuna" FOREIGN KEY ("id_comuna") REFERENCES public."comuna"("id_comuna") NOT VALID;

ALTER TABLE ONLY public."vendedor"
    ADD CONSTRAINT "id_empleado" FOREIGN KEY ("id_empleado") REFERENCES public."empleado"("id_empleado") NOT VALID;

ALTER TABLE ONLY public."sueldo"
    ADD CONSTRAINT "id_empleado" FOREIGN KEY ("id_empleado") REFERENCES public."empleado"("id_empleado") NOT VALID;

ALTER TABLE ONLY public."tienda_emp"
    ADD CONSTRAINT "id_empleado" FOREIGN KEY ("id_empleado") REFERENCES public."empleado"("id_empleado") NOT VALID;

ALTER TABLE ONLY public."prod_venta"
    ADD CONSTRAINT "id_producto" FOREIGN KEY ("id_producto") REFERENCES public."producto"("id_producto") NOT VALID;

ALTER TABLE ONLY public."venta"
    ADD CONSTRAINT "id_tienda" FOREIGN KEY ("id_tienda") REFERENCES public."tienda"("id_tienda") NOT VALID;

ALTER TABLE ONLY public."tienda_emp"
    ADD CONSTRAINT "id_tienda" FOREIGN KEY ("id_tienda") REFERENCES public."tienda"("id_tienda") NOT VALID;

ALTER TABLE ONLY public."venta"
    ADD CONSTRAINT "id_tipo_doc" FOREIGN KEY ("id_tipo_doc") REFERENCES public."tipo_doc"("id_doc") NOT VALID;

ALTER TABLE ONLY public."prod_venta"
    ADD CONSTRAINT "id_vendedor" FOREIGN KEY ("id_vendedor") REFERENCES public."vendedor"("id_vendedor") NOT VALID;

ALTER TABLE ONLY public."prod_venta"
    ADD CONSTRAINT "id_venta" FOREIGN KEY ("id_venta") REFERENCES public."venta"("id_venta") NOT VALID;
