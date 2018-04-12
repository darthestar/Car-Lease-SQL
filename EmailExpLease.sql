select Customers.email, Leases.ExpirationDate from Customers
join LeaseCustomers on LeaseCustomers.ID = Customers.ID
join Leases on Leases.ID = LeaseCustomers.LeasesID
where ExpirationDate < '2020-10-09'