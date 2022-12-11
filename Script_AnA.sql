----------------- Script de practica de modulo SQL -----------------

--Creamos espacio de trabajo(esquema)
create schema ana_alonso authorization xzhbycyw;

--Creamos tablas con sus claves

--- Grupo empresarial de la marca ---
create table ana_alonso.brand_groups(
	id_group varchar(10) not null, -- PK
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
	id_model varchar(10) not null, --FK1 -> models -> id_model
	id_color varchar(10) not null, --FK2 -> colors -> id_color
	plate varchar(50) not null,
	total_km integer not null,
	dt_purchase date not null,
	description varchar(512) null
);

--PK
alter table ana_alonso.vehicles
add constraint vehicles_PK primary key (id_vehicle);

--FKs
alter table ana_alonso.vehicles
add constraint vehicles_FK1 foreign key (id_model)
references ana_alonso.models (id_model);

alter table ana_alonso.vehicles
add constraint vehicles_FK2 foreign key (id_color)
references ana_alonso.colors (id_color);

--- Compañia aseguradora ---
create table ana_alonso.insurance_companies(
	id_insurance varchar(10) not null, --PK 
	insurance_name varchar(50) not null,
	description varchar(512) null
);

--PK
alter table ana_alonso.insurance_companies
add constraint insurance_companies_PK primary key (id_insurance);

--- Poliza de vehiculo ---
create table ana_alonso.vehicle_policies(
	id_vehicle varchar(10) not null, --PK, FK1 -> vehicles -> id_vehicle 
	policy_num integer not null, --PK 
	id_insurance varchar(10) not null, --FK2 ->insurance_companies -> id_insurance
	dt_hire date not null,
	dt_termination date not null default '4000-01-01',
	description varchar(512) null
);

--PK
alter table ana_alonso.vehicle_policies
add constraint vehicle_policies_PK primary key (id_vehicle, policy_num);

--FKs
alter table ana_alonso.vehicle_policies
add constraint vehicle_policies_FK1 foreign key (id_vehicle)
references ana_alonso.vehicles (id_vehicle);

alter table ana_alonso.vehicle_policies
add constraint vehicle_policies_FK2 foreign key (id_insurance)
references ana_alonso.insurance_companies (id_insurance);

--- Monedas ---
create table ana_alonso.currencies(
	id_currency varchar(10) not null, --PK 
	currency_name varchar(50) not null,
	description varchar(512) null
);

--PK
alter table ana_alonso.currencies
add constraint currencies_PK primary key (id_currency);

--- Revisiones de vehículo---
create table ana_alonso.vehicle_inspections(
	id_vehicle varchar(10) not null, --PK, FK1 -> vehicles -> id_vehicle 
	inspection_num integer not null, --PK
	inspection_price integer not null,
	dt_inspection date not null,
	id_currency varchar(10) not null default '01', --FK2 -> currencies -> id_currency
	description varchar(512) null
);

--PK
alter table ana_alonso.vehicle_inspections
add constraint vehicle_inspections_PK primary key (id_vehicle, inspection_num);

--FKs
alter table ana_alonso.vehicle_inspections
add constraint vehicle_inspections_FK1 foreign key (id_vehicle)
references ana_alonso.vehicles (id_vehicle);

alter table ana_alonso.vehicle_inspections
add constraint vehicle_inspections_FK2 foreign key (id_currency)
references ana_alonso.currencies (id_currency);



----------------------------------------------------------------------------------------------------

----- CARGA DE DATOS -----














