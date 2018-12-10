#Test Query
select first_name,last_name,actor_id from sakila.actor
	where last_name = 'Williams';

#1a
select first_name,last_name from sakila.actor;

#1b
select concat(first_name,' ',last_name) 
as 'Actor Name' from sakila.actor;

#2a
select actor_id,first_name,last_name from sakila.actor
	where first_name = 'Joe';

#2b
select first_name, last_name from sakila.actor
	where last_name like '&gen&';

#2c
select first_name,last_name from sakila.actor
	where last_name like '%li%'
	order by last_name,first_name;

#2d
select * from sakila.country;

#3a
alter table sakila.actor
	add column Description blob;

#3b
alter table sakila.actor
	drop column Description;

#4a
select last_name,count(last_name) from sakila.actor
	group by last_name;

#4b
select last_name,count(last_name) from sakila.actor 
	group by last_name having count(last_name)>=2;

#4c
update sakila.actor 
set first_name = 'HARPO' where actor_id = 172;

#4d
update sakila.actor set first_name ='GROUCHO' 
	where first_name = 'HARPO' and last_name = 'WILLIAMS';

#5a
show create table sakila.address;

#6a
select staff.first_name, staff.last_name, address.address
	from staff
	inner join address 
	on staff.address_id = address.address_id;
    
#6b
select staff.staff_id,staff.first_name,staff.last_name,
	sum(payment.amount)
	from staff
    inner join payment
    on payment.staff_id = staff.staff_id
    group by staff_id;

#6c
select film.title,count(film_actor.film_id) 
	from film_actor
    inner join film
    on film_actor.film_id = film.film_id
    group by film.title;

#6d
select count(inventory.film_id) from inventory 
	where film_id = 439;
#select film.title, count(film.title) from film
#	where title = 'Hunchback Impossible';
    
#6e
select first_name,last_name,sum(amount)
	from customer
    inner join payment
    on customer.customer_id = payment.customer_id
    group by last_name;
    
#7a
#english id = 1
select title,language_id from film
	where language_id = 1 and 
    title like 'K%' or title like 'Q%';
    
#7b

