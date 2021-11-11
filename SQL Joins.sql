-- LAB SQL Join 
use sakila;
-- 1. List number of films per category.
select * from film;
select * from category;
select category_id, name, count(film_id) from film_category f
left join film c using (film_id)
left join category m using (category_id)
group by 1,2;

-- 2. Display the first and last names, as well as the address, of each staff member.
select first_name, last_name, address from staff
left join address using (address_id)
group by 1,2,3;

-- 3. Display the total amount rung up by each staff member in August of 2005.
select first_name, last_name, sum(amount) from staff
left join payment using (staff_id)
where date_format(convert(payment_date, date), '%Y-%m') = '2005-08'
group by 1,2;

-- 4. List each film and the number of actors who are listed for that film.
select title, count(actor_id) from film
left join film_actor using(film_id)
group by 1;

-- 5. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name.
select first_name, last_name, sum(amount) from customer
left join payment using (customer_id)
group by 1,2
order by 2 desc;
