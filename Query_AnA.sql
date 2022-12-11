------------- QUERY -------------

-- Coches activos:
-- Nombre modelo, marca y grupo de coches (los nombres de todos)
-- Fecha de compra
-- Matrícula
-- Nombre del color del coche
-- Total kilómetros
-- Nombre empresa que esta asegurado el coche
-- Numero de póliza

select a.id_vehicle, a.id_model, 
b.model_name, b.id_brand, 
c.brand_name, c.id_group,
d.group_name,
a.dt_purchase, a.plate, a.id_color,
e.color_name,
a.total_km,
g.id_insurance, g.insurance_name,
f.policy_num
from ana_alonso.vehicles as a
inner join ana_alonso.models as b on a.id_model = b.id_model 
inner join ana_alonso.brands as c on b.id_brand = c.id_brand 
inner join ana_alonso.brand_groups as d on c.id_group = d.id_group 
inner join ana_alonso.colors as e on a.id_color = e.id_color 
inner join ana_alonso.vehicle_policies as f on a.id_vehicle = f.id_vehicle 
inner join ana_alonso.insurance_companies as g on f.id_insurance = g.id_insurance; 






