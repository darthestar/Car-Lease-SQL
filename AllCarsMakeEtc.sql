select CarDatas.Make, CarDatas.Model, color, availableForLease, MilesDriven from Cars
join CarDatas on  CarDatas.ID = CarDataID 
