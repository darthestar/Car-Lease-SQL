select CarDatas.Make, CarDatas.Model, Cars.AvailableforLease from CarDatas
join Cars on Cars.CarDataID = CarDatas.ID
where AvailableforLease = 'False'


