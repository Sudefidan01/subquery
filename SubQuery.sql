--SubQuery
--Sql sorgulamaları içerisinde bazı durumlarda sorgu içerisinde sorgu yapmak durumunda kalabiliriz
--Böyle durumlarda Select veya Where içerisinde () içerisinde yeni bir sorgu yazma olanağımız olabilir

--Fiyatı en yüksek olan ürünümün kategori bilgisi nedir
select
	CategoryName
from Categories
where CategoryID=
(Select Top 1 CategoryID from Products 
	Order by UnitPrice DESC

)
--Ürün fiyatı , genel ürün fiyat ortalamasından büyük olan ürünleri listeleyelim
select 
	ProductName,
	UnitPrice
from Products
where UnitPrice>
(	
	select avg(UnitPrice)
	from Products

)
--Ürünlerimi kategori isimleri ile beraber listeleyelim
--Tablolara takma isim vererek erişim
select
	p.ProductName,
	p.UnitPrice,
	(
	select
		c.CategoryName
	from Categories as c
	where c.CategoryID=p.CategoryID

	) as CategoryName
from Products as p

--Tablolara takma isim vermeden erişim
select
	Products.ProductName,
	Products.UnitPrice,
	(
		select 
			CategoryName
		from Categories
		where Categories.CategoryID=Products.CategoryID
	)as CategoryName
from Products
