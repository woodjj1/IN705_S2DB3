/*Joins and Subqueries Exercises
------------------------------------------------------------
Woody



/*
These queries can be written using joins or subqueries, please make sure you use a mixture of both.

1.	List the titles and prices of all books that have the cheapest price.
	
	select title, price from titles where price = (select min(price) from titles)



2.	List all titles that have sold more than 40 copies at a single store.
	
	select title from titles
	inner join sales on sales.title_id = titles.title_id
	where sales.qty > 40
	

3.	List all authors who have not published any books.
	
	select * from authors

	select a.au_id, a.au_lname, a.au_fname from authors a
	left join titleauthor ta on a.au_id = ta.au_id
	where ta.au_id is null
       
	

4.	List all the publishers who have published any business books.
	
	select * publishers

	select Distinct pub_name from publishers p
	inner join titles t on p.pub_id = t.pub_id
	where t.type ='business'

5.	List all authors who have published a popular computing book (these books have type = 'popular_comp' in the titles table).
	
	select * from authors

	select Distinct au_lname, au_fname from authors a
	inner join titleauthor ta on ta.au_id = a.au_id
	inner join titles t on t.title_id = ta.title_id
	where t.type ='popular_comp' 
	

6.	List all the cities where both an author (or authors) and a publisher (or publishers) are located.

	select * from authors
	select * from publishers

	select distinct city from authors 
	where city in (select city from publishers)
	


7.	List all cities where an author, but no publisher, is located.

	select * from authors

	select distinct city from authors 
	where city not in (select city from publishers) 

	

8.	List all titles that have sold no copies.
	
	select * from titles

	select title from titles
	left join sales on titles.title_id = sales.title_id where sales.qty is null
	

9.	List the title and total sales of each book whose total sales is less than the average totals sales across all books.

	select * from titles

	select t.title, sum(s.qty)
	from titles t
	join sales s on t.title_id = s.title_id
	group by title
	having sum(s.qty) < (
			select avg(sumTable.sumQty) from 
			(select sum(qty) as sumQty
			from sales group by title_id)  sumTable) 
			order by t.title


	
	


10.	List the publishers, and the number of books each has published, who are not located in California.
		
		select * from publishers 

		select p.pub_name, count (t.title_id)
		from titles t
		join publishers p on p.pub_id = t.pub_id
		where p.state !='CA' 
		group by pub_name
		

11.	For each book, list the number of stores where it has been sold.

	select * from titles
	select * from stores

	select t.title, count (t.title_id) 
	from sales s
	join titles t on t.title_id = s.title_id
	join stores st on s.stor_id = st.stor_id
	group by t.title
		





12.	For each book, list its title, the largest quantity of it sold at any one store, and the name of that store.
	
	select * from titles
	select * from stores

	select t.title, st.stor_name, max (s.qty)  
	from sales s
	join titles t on t.title_id = s.title_id
	join stores st on s.stor_id = st.stor_id
	group by t.title, st.stor_name
	order by t.title asc


13.	Increase by two points the royalty rate for all books that have sold more than 30 copies total.

	update roysched
	set royalty = (royalty + 2)
	where title_id in 
	(select title_id from sales s where s.qty > 30)

	** I got 48 rows affected not 32?
	
	update titles
	set royalty = (royalty + 2)
	where title_id in 
	(select title_id from sales s where s.qty > 30)

	**4 rows affected?

Query 14: Challenge Problem. Think carefully about what set you need to produce to answer this question, and what tables you need to join to produce that set.
14.	List all types of books published by more than one publisher.

	select * from titles
	select * from publishers

	select distinct t1.type from titles t1
	join titles t2 on t2.type = t1.type
	and t1.pub_id != t2.pub_id
