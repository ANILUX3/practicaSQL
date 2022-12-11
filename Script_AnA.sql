----------------- Script de práctica de módulo SQL -----------------

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
	total_km numeric not null,
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
	policy_num varchar(10) not null, --PK 
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
	inspection_num varchar(10) not null, --PK
	dt_inspection date not null,
	km_inspection numeric not null,
	inspection_price numeric not null,
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

----- CARGA DE DATOS ----- DML

--- Grupo empresarial de la marca ---

insert into ana_alonso.brand_groups (id_group, group_name) values ('01', 'VAN');
insert into ana_alonso.brand_groups (id_group, group_name) values ('02', 'TOY');
insert into ana_alonso.brand_groups (id_group, group_name) values ('03', 'HUW');

--- Marcas ---

insert into ana_alonso.brands (id_brand, brand_name, id_group) values ('001', 'Volkswagen', '01');
insert into ana_alonso.brands (id_brand, brand_name, id_group) values ('002', 'SEAT', '01');
insert into ana_alonso.brands (id_brand, brand_name, id_group) values ('003', 'Audi', '01');
insert into ana_alonso.brands (id_brand, brand_name, id_group) values ('004', 'Toyota', '02');
insert into ana_alonso.brands (id_brand, brand_name, id_group) values ('005', 'Renault', '02');
insert into ana_alonso.brands (id_brand, brand_name, id_group) values ('006', 'Nissan', '03');


--- Modelos ---

insert into ana_alonso.models (id_model, model_name, id_brand) values ('0001', 'Polo', '001');
insert into ana_alonso.models (id_model, model_name, id_brand) values ('0002', 'T-Cross', '001');
insert into ana_alonso.models (id_model, model_name, id_brand) values ('0003', 'Ibiza', '002');
insert into ana_alonso.models (id_model, model_name, id_brand) values ('0004', 'Ateca', '002');
insert into ana_alonso.models (id_model, model_name, id_brand) values ('0005', 'A3', '003');
insert into ana_alonso.models (id_model, model_name, id_brand) values ('0006', 'A6', '003');
insert into ana_alonso.models (id_model, model_name, id_brand) values ('0007', 'Lexus', '004');
insert into ana_alonso.models (id_model, model_name, id_brand) values ('0008', 'Corolla', '004');
insert into ana_alonso.models (id_model, model_name, id_brand) values ('0009', 'Clio', '005');
insert into ana_alonso.models (id_model, model_name, id_brand) values ('0010', 'Megane', '005');
insert into ana_alonso.models (id_model, model_name, id_brand) values ('0011', 'Micra', '006');
insert into ana_alonso.models (id_model, model_name, id_brand) values ('0012', 'Serena', '006');


--- Colores ---

insert into ana_alonso.colors (id_color, color_name) values ('01', 'Blanco');
insert into ana_alonso.colors (id_color, color_name) values ('02', 'Negro');
insert into ana_alonso.colors (id_color, color_name) values ('03', 'Azul');
insert into ana_alonso.colors (id_color, color_name) values ('04', 'Naranja');

--- Vehículos ---

insert into ana_alonso.vehicles (id_vehicle, id_model, id_color, plate, total_km, dt_purchase) values ('00001', '0001', '01', '0001-HNT', 100000, '2020-01-01');
insert into ana_alonso.vehicles (id_vehicle, id_model, id_color, plate, total_km, dt_purchase) values ('00002', '0001', '01', '0002-HVN', 100000, '2020-01-01');
insert into ana_alonso.vehicles (id_vehicle, id_model, id_color, plate, total_km, dt_purchase) values ('00003', '0002', '01', '0003-HZB', 100000, '2020-01-01');
insert into ana_alonso.vehicles (id_vehicle, id_model, id_color, plate, total_km, dt_purchase) values ('00004', '0002', '01', '0004-CTT', 100000, '2020-01-01');
insert into ana_alonso.vehicles (id_vehicle, id_model, id_color, plate, total_km, dt_purchase) values ('00005', '0003', '02', '0005-CZL', 100000, '2021-01-01');
insert into ana_alonso.vehicles (id_vehicle, id_model, id_color, plate, total_km, dt_purchase) values ('00006', '0003', '02', '0006-HNT', 100000, '2020-01-01');
insert into ana_alonso.vehicles (id_vehicle, id_model, id_color, plate, total_km, dt_purchase) values ('00007', '0004', '03', '0007-HVN', 100000, '2020-01-01');
insert into ana_alonso.vehicles (id_vehicle, id_model, id_color, plate, total_km, dt_purchase) values ('00008', '0004', '04', '0008-HZB', 100000, '2020-01-01');
insert into ana_alonso.vehicles (id_vehicle, id_model, id_color, plate, total_km, dt_purchase) values ('00009', '0009', '04', '0009-CTT', 100000, '2020-01-01');
insert into ana_alonso.vehicles (id_vehicle, id_model, id_color, plate, total_km, dt_purchase) values ('00010', '0009', '04', '1001-CZL', 50000, '2021-01-01');
insert into ana_alonso.vehicles (id_vehicle, id_model, id_color, plate, total_km, dt_purchase) values ('00011', '0009', '04', '1002-CVR', 50000, '2021-01-01');
insert into ana_alonso.vehicles (id_vehicle, id_model, id_color, plate, total_km, dt_purchase) values ('00012', '0012', '04', '1003-GCK', 50000, '2021-01-01');
insert into ana_alonso.vehicles (id_vehicle, id_model, id_color, plate, total_km, dt_purchase) values ('00013', '0012', '04', '1004-DRG', 50000, '2021-01-01');
insert into ana_alonso.vehicles (id_vehicle, id_model, id_color, plate, total_km, dt_purchase) values ('00014', '0012', '04', '1005-CKB', 50000, '2021-01-01');
insert into ana_alonso.vehicles (id_vehicle, id_model, id_color, plate, total_km, dt_purchase) values ('00015', '0012', '04', '1006-HPY', 50000, '2021-01-01');

--- Compañia aseguradora ---

insert into ana_alonso.insurance_companies (id_insurance, insurance_name) values ('001', 'Mapfre');
insert into ana_alonso.insurance_companies (id_insurance, insurance_name) values ('002', 'MMT');
insert into ana_alonso.insurance_companies (id_insurance, insurance_name) values ('003', 'AXA');

--- Poliza de vehiculo ---

insert into ana_alonso.vehicle_policies (id_vehicle, policy_num, id_insurance, dt_hire) values ('00001', 'VH-001', '001', '2020-01-01');
insert into ana_alonso.vehicle_policies (id_vehicle, policy_num, id_insurance, dt_hire) values ('00002', 'VH-002', '001', '2020-01-01');
insert into ana_alonso.vehicle_policies (id_vehicle, policy_num, id_insurance, dt_hire) values ('00003', 'VH-003', '001', '2020-01-01');
insert into ana_alonso.vehicle_policies (id_vehicle, policy_num, id_insurance, dt_hire) values ('00004', 'VH-004', '001', '2020-01-01');
insert into ana_alonso.vehicle_policies (id_vehicle, policy_num, id_insurance, dt_hire) values ('00005', 'VH-005', '001', '2020-01-01');
insert into ana_alonso.vehicle_policies (id_vehicle, policy_num, id_insurance, dt_hire) values ('00006', 'VH-006', '001', '2020-01-01');
insert into ana_alonso.vehicle_policies (id_vehicle, policy_num, id_insurance, dt_hire) values ('00007', 'VH-007', '001', '2020-01-01');
insert into ana_alonso.vehicle_policies (id_vehicle, policy_num, id_insurance, dt_hire) values ('00008', 'VH-008', '001', '2020-01-01');
insert into ana_alonso.vehicle_policies (id_vehicle, policy_num, id_insurance, dt_hire) values ('00009', 'VH-009', '001', '2020-01-01');
insert into ana_alonso.vehicle_policies (id_vehicle, policy_num, id_insurance, dt_hire) values ('00010', 'VH-010', '001', '2021-01-01');
insert into ana_alonso.vehicle_policies (id_vehicle, policy_num, id_insurance, dt_hire) values ('00011', 'VH-011', '001', '2021-01-01');
insert into ana_alonso.vehicle_policies (id_vehicle, policy_num, id_insurance, dt_hire) values ('00012', 'VH-012', '001', '2021-01-01');
insert into ana_alonso.vehicle_policies (id_vehicle, policy_num, id_insurance, dt_hire) values ('00013', 'VH-013', '001', '2021-01-01');
insert into ana_alonso.vehicle_policies (id_vehicle, policy_num, id_insurance, dt_hire) values ('00014', 'VH-014', '001', '2021-01-01');
insert into ana_alonso.vehicle_policies (id_vehicle, policy_num, id_insurance, dt_hire) values ('00015', 'VH-015', '001', '2021-01-01');

--- Monedas ---

insert into ana_alonso.currencies (id_currency, currency_name) values ('01', 'EUR');
insert into ana_alonso.currencies (id_currency, currency_name) values ('02', 'USD');

--- Revisiones de vehículo---

insert into ana_alonso.vehicle_inspections (id_vehicle, inspection_num, dt_inspection, km_inspection, inspection_price) values ('00001', 'ITV-001', '2021-01-01', '50000', '100');
insert into ana_alonso.vehicle_inspections (id_vehicle, inspection_num, dt_inspection, km_inspection, inspection_price) values ('00002', 'ITV-002', '2021-01-01', '50000', '100');
insert into ana_alonso.vehicle_inspections (id_vehicle, inspection_num, dt_inspection, km_inspection, inspection_price) values ('00003', 'ITV-003', '2021-01-01', '50000', '100');
insert into ana_alonso.vehicle_inspections (id_vehicle, inspection_num, dt_inspection, km_inspection, inspection_price) values ('00004', 'ITV-004', '2021-01-01', '50000', '100');
insert into ana_alonso.vehicle_inspections (id_vehicle, inspection_num, dt_inspection, km_inspection, inspection_price) values ('00005', 'ITV-005', '2021-01-01', '50000', '100');
insert into ana_alonso.vehicle_inspections (id_vehicle, inspection_num, dt_inspection, km_inspection, inspection_price) values ('00006', 'ITV-006', '2021-01-01', '50000', '100');
insert into ana_alonso.vehicle_inspections (id_vehicle, inspection_num, dt_inspection, km_inspection, inspection_price) values ('00007', 'ITV-007', '2021-01-01', '50000', '100');
insert into ana_alonso.vehicle_inspections (id_vehicle, inspection_num, dt_inspection, km_inspection, inspection_price) values ('00008', 'ITV-008', '2021-01-01', '50000', '100');
insert into ana_alonso.vehicle_inspections (id_vehicle, inspection_num, dt_inspection, km_inspection, inspection_price) values ('00009', 'ITV-009', '2021-01-01', '50000', '100');
insert into ana_alonso.vehicle_inspections (id_vehicle, inspection_num, dt_inspection, km_inspection, inspection_price) values ('00010', 'ITV-010', '2022-01-01', '25000', '100');
insert into ana_alonso.vehicle_inspections (id_vehicle, inspection_num, dt_inspection, km_inspection, inspection_price) values ('00011', 'ITV-011', '2022-01-01', '25000', '100');
insert into ana_alonso.vehicle_inspections (id_vehicle, inspection_num, dt_inspection, km_inspection, inspection_price) values ('00012', 'ITV-012', '2022-01-01', '25000', '100');
insert into ana_alonso.vehicle_inspections (id_vehicle, inspection_num, dt_inspection, km_inspection, inspection_price) values ('00013', 'ITV-013', '2022-01-01', '25000', '100');
insert into ana_alonso.vehicle_inspections (id_vehicle, inspection_num, dt_inspection, km_inspection, inspection_price) values ('00014', 'ITV-014', '2022-01-01', '25000', '100');
insert into ana_alonso.vehicle_inspections (id_vehicle, inspection_num, dt_inspection, km_inspection, inspection_price) values ('00015', 'ITV-015', '2022-01-01', '25000', '100');

