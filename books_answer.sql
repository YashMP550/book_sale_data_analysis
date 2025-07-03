-- 1) Retrieve all books in the "Fiction" genre:
-- select * from books where genre = "Fiction";

-- 2) Find books published after the year 1950:
-- select * from books where Published_Year >1950;

-- 3) List all customers from the Canada:
-- select * from customers where Country = "Canada";

-- 4) Show orders placed in November 2023:
-- select * from orders where Order_Date between "2023-11-01" and "2023-11-30;"

-- 5) Retrieve the total stock of books available:
-- select sum(stock) as total_stock from books

-- 6) Find the details of the most expensive book:
-- select * from books
-- order by price desc
-- limit 1;

-- 7) Show all customers who ordered more than 1 quantity of a book:
-- select customers. * from customers
-- inner join orders 
-- on customers.Customer_ID = orders.Customer_ID
-- where quantity>1;

-- 8) Retrieve all orders where the total amount exceeds $20:
-- select * from orders where Total_Amount>20;

-- 9) List all genres available in the Books table:
-- select distinct genre from books;

-- 10) Find the book with the lowest stock:
-- select * from books
-- order by stock
-- limit 1;

-- 11) Calculate the total revenue generated from all orders:
-- select round(sum(Quantity * Total_Amount),2) as total_revenue from orders;

-- 12) Retrieve the total number of books sold for each genre:
-- select b.Genre, round(sum(o.Quantity * o.Total_Amount),2) as total_number_of_book_sold
-- from books b inner join orders o
-- on b.book_id = o.book_id
-- group by b.genre;

-- 13) List customers who have placed at least 2 orders:
-- select c.name,o.customer_id,count(o.Quantity) total_quantity_ordered from customers c inner join orders o
-- on c.customer_id = o.customer_id
-- group by c.name,o.customer_id
-- having total_quantity_ordered>=2;

-- 14) Find the most frequently ordered book:
-- select b.book_id,b.Title,count(o.book_id) most_frequently_ordered_book from books b inner join orders o
-- on b.book_id = o.book_id
-- group by b.book_id,b.title
-- order by most_frequently_ordered_book desc
-- limit 1;

-- 15) Show the top 3 most expensive books of 'Fantasy' Genre :
-- SELECT * FROM books
-- WHERE genre ='Fantasy'
-- ORDER BY price DESC LIMIT 3;

-- 16) Retrieve the total quantity of books sold by each author:
-- select sum(o.Quantity) as total_quantity,b.author from orders o inner join books b
-- on o.book_id = b.book_id
-- group by b.author
-- order by total_quantity;

-- 17) List the cities where customers who spent over $30 are located:
-- select c.city,o.total_amount from customers c inner join orders o
-- on c.customer_id = o.customer_id
-- where total_amount>30;

-- 18) Find the customer who spent the most on orders:
-- select c.customer_id,c.name,round(sum(o.total_amount),2) as total_spent
-- from customers c inner join orders o
-- on c.customer_id = o.customer_id
-- group by c.customer_id,c.name
-- order by total_spent desc
-- limit 1;

-- 19) Calculate the stock remaining after fulfilling all orders:
-- select  b.book_id,(b.stock - coalesce(sum(o.quantity),0)) as remaining_stock from books b left join orders o
-- on b.book_id = o.book_id
-- group by b.book_id,b.stock
-- order by b.book_id;

-- 20) select the top 3 book based on the total amount
-- with most_expensive as (select b.title,o.total_amount,dense_rank()
-- over (order by total_amount desc) as rn
-- from books b inner join orders o
-- on b.book_id = o.book_id)

-- select title,total_amount from most_expensive
-- where rn<=3;

-- 21) select the top 3 book from genre "Mystery" based on the total amount
-- with most_expensive_books as (select b.title,b.genre,o.total_amount,dense_rank() 
-- over (order by o.total_amount desc) as rn
-- from books b inner join orders o
-- on b.book_id = o.book_id
-- where b.genre = 'Mystery')

-- select title,genre,total_amount from most_expensive_books
-- where rn<=3