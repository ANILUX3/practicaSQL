----------------- Script de práctica de módulo SQL -----------------

--Creamos espacio de trabajo(esquema)
create schema ana_alonso authorization xzhbycyw;

--Creamos tablas con sus claves

--- Grupo empresarial de la marca ---
create table ana_alonso.brand_groups(
	id_group varchar(10), not null -- PK
	group_name varchar (50) not null,
	description varchar(512) null
);

--PK
alter table ana_alonso.brand_groups
add constraint brand_groups_PK primary key (id_group);

--- Marcas ---
create table ana_alonso.brands(
	id_brand varchar (10), -- PK
	brand_name varchar (50) not null,
	id_group varchar(10) not null, -- FK ->brand_groups -> id_group
	description varchar(512) null
);

--PK
alter table ana_alonso.brands
add constraint brands_PK primary key (id_brand);

--FK
alter table ana_alonso.brands
add constraint brands_FK foreign key (id_group)
references ana_alonso.brand_groups (id_group);


--- Modelos ---
create table ana_alonso.models(
	id_model varchar(10) not null, --PK 
	model_name varchar(50) not null,
	id_brand varchar (10) not null, --FK -> brands -> id_brand
	description varchar(512) null
);

--PK
alter table ana_alonso.models
add constraint models_PK primary key (id_model);

--FK
alter table ana_alonso.models
add constraint models_FK foreign key (id_brand)
references ana_alonso.brands (id_brand);

--- Colores ---
create table ana_alonso.colors(
	id_color varchar(10) not null, --PK 
	color_name varchar(50) not null,
	description varchar(512) null
);

--PK
alter table ana_alonso.colors
add constraint colors_PK primary key (id_color);

--- Vehículos ---
create table ana_alonso.vehicles(
	id_vehicle varchar(10) not null, --PK 
	id_model varchar(10) not null, --PK, FK 
	id_color varchar(10) not null, --FK -> colors -> id_color
	plate varchar(50) not null,
	total_km integer not null,
	purchase_date date not null,
	description varchar(512) null
);

--PK
alter table ana_alonso.vehicles
add constraint vehicles_PK primary key (id_vehicle);

--FK
alter table ana_alonso.vehicles
add constraint vehicles_FK foreign key (id_brand)
references ana_alonso.brands (id_brand);



--- Compañia aseguradora ---

--PK

--FK

--- Revisiones ---

--PK

--FK

--- Monedas ---

--PK

--FK





















