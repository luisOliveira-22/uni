# BD: Guião 6

## Problema 6.1

### *a)* Todos os tuplos da tabela autores (authors);

```
SELECT * FROM authors
```

### *b)* O primeiro nome, o último nome e o telefone dos autores;

```
SELECT au_fname, au_lname, phone FROM authors
```

### *c)* Consulta definida em b) mas ordenada pelo primeiro nome (ascendente) e depois o último nome (ascendente); 

```
SELECT au_fname, au_lname, phone
	FROM authors
	ORDER BY au_fname, au_lname
```

### *d)* Consulta definida em c) mas renomeando os atributos para (first_name, last_name, telephone); 

```
SELECT au_fname AS first_name, au_lname AS last_name, phone as telephone
	FROM authors
	ORDER BY au_fname, au_lname
```

### *e)* Consulta definida em d) mas só os autores da Califórnia (CA) cujo último nome é diferente de ‘Ringer’; 

```
SELECT au_fname AS first_name, au_lname AS last_name, phone as telephone
	FROM authors
	WHERE [state] = 'CA' and au_lname <> 'Ringer' 
	ORDER BY au_fname, au_lname
```

### *f)* Todas as editoras (publishers) que tenham ‘Bo’ em qualquer parte do nome; 

```
SELECT * FROM publishers WHERE pub_name LIKE '%Bo%'; 
```

### *g)* Nome das editoras que têm pelo menos uma publicação do tipo ‘Business’; 

```
SELECT DISTINCT(pub_name)
	FROM (publishers
	JOIN titles
	ON publishers.pub_id = titles.pub_id)
	WHERE type = 'Business';
```

### *h)* Número total de vendas de cada editora; 

```
SELECT publishers.pub_name, SUM(titles.ytd_sales) AS Vendas
	FROM publishers
	JOIN titles
	ON publishers.pub_id = titles.pub_id
	GROUP BY publishers.pub_name;
```

### *i)* Número total de vendas de cada editora agrupado por título; 

```
SELECT publishers.pub_name, titles.title, SUM(titles.ytd_sales) AS Vendas
	FROM publishers
	JOIN titles
	ON publishers.pub_id = titles.pub_id
	GROUP BY pub_name, title
	ORDER BY pub_name;
```

### *j)* Nome dos títulos vendidos pela loja ‘Bookbeat’; 

```
SELECT title FROM ((stores JOIN sales ON stores.stor_id=sales.stor_id) JOIN titles ON titles.title_id=sales.title_id) WHERE stor_name = 'Bookbeat';
```

### *k)* Nome de autores que tenham publicações de tipos diferentes; 

```
SELECT authors.au_id, titles.type
	FROM authors
	INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
	INNER JOIN titles ON titles.title_id = titleauthor.title_id
	GROUP BY authors.au_id, titles.type
	HAVING COUNT(titles.type) > 1
```

### *l)* Para os títulos, obter o preço médio e o número total de vendas agrupado por tipo (type) e editora (pub_id);

```
SELECT type, publishers.pub_name, SUM(qty) AS Sales, AVG(price) AS Avg_Price FROM
publishers JOIN titles ON publishers.pub_id=titles.pub_id
JOIN sales ON sales.title_id=titles.title_id
GROUP BY type, publishers.pub_name;
```

### *m)* Obter o(s) tipo(s) de título(s) para o(s) qual(is) o máximo de dinheiro “à cabeça” (advance) é uma vez e meia superior à média do grupo (tipo);

```
SELECT type FROM titles
GROUP BY type
HAVING MAX(advance) >= AVG(advance) * 1.5;
```

### *n)* Obter, para cada título, nome dos autores e valor arrecadado por estes com a sua venda;

```
SELECT title, au_lname, au_fname, royaltyper * (ytd_sales*price) * royalty / 10000 AS earnings
FROM (
SELECT authors.au_id, title_id, royaltyper, au_lname, au_fname
FROM titleauthor
JOIN authors
ON authors.au_id=titleauthor.au_id) AS A
JOIN titles
ON titles.title_id=A.title_id
ORDER BY title;
```

### *o)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, a faturação total, o valor da faturação relativa aos autores e o valor da faturação relativa à editora;

```
SELECT title, ytd_sales, ytd_sales*price AS total_earnings, ytd_sales*price * royalty / 100 AS author_earnings, ytd_sales*price - (ytd_sales*price * royalty / 100) AS publisher_earnings
FROM titles
ORDER BY title;
```

### *p)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, o nome de cada autor, o valor da faturação de cada autor e o valor da faturação relativa à editora;

```
SELECT title, ytd_sales, (au_lname + ' ' + au_fname) AS author_name, ytd_sales*price * royalty * royaltyper / 10000 AS author_earnings, ytd_sales*price - (ytd_sales*price * royalty / 100) AS publisher_earnings
FROM titles
JOIN titleauthor
ON titleauthor.title_id=titles.title_id
JOIN authors
ON authors.au_id=titleauthor.au_id
ORDER BY title;
```

### *q)* Lista de lojas que venderam pelo menos um exemplar de todos os livros;

```
SELECT stor_id
FROM sales
GROUP BY stor_id
HAVING COUNT(DISTINCT(title_id)) >= (SELECT COUNT(title_id) FROM titles);
```

### *r)* Lista de lojas que venderam mais livros do que a média de todas as lojas;

```
SELECT stor_id, SUM(qty) FROM sales
GROUP BY stor_id
HAVING SUM(qty) > (SELECT AVG(sum_qty) AS avg_all_stores FROM (SELECT stor_id, SUM(qty) AS sum_qty FROM sales GROUP BY stor_id) AS A);
```

### *s)* Nome dos títulos que nunca foram vendidos na loja “Bookbeat”;

```
SELECT title FROM titles
WHERE title_id NOT IN
(SELECT title_id FROM sales
FULL OUTER JOIN stores
ON sales.stor_id=stores.stor_id
WHERE stor_name='Bookbeat');
```

### *t)* Para cada editora, a lista de todas as lojas que nunca venderam títulos dessa editora; 

```
(SELECT pub_name, stor_name
FROM stores, publishers )
EXCEPT
(SELECT pub_name, stor_name
FROM publishers JOIN (SELECT pub_id AS ppid, sales.stor_id, stor_name
FROM titles JOIN sales
ON titles.title_id=sales.title_id
JOIN stores
ON sales.stor_id=stores.stor_id) AS T
ON pub_id=ppid);
```

## Problema 6.2

### ​5.1

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_1_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_1_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
... Write here your answer ...
```

##### *b)* 

```
... Write here your answer ...
```

##### *c)* 

```
... Write here your answer ...
```

##### *d)* 

```
... Write here your answer ...
```

##### *e)* 

```
... Write here your answer ...
```

##### *f)* 

```
... Write here your answer ...
```

##### *g)* 

```
... Write here your answer ...
```

##### *h)* 

```
... Write here your answer ...
```

##### *i)* 

```
... Write here your answer ...
```

### 5.2

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_2_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_2_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
... Write here your answer ...
```

##### *b)* 

```
... Write here your answer ...
```


##### *c)* 

```
... Write here your answer ...
```


##### *d)* 

```
... Write here your answer ...
```

### 5.3

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_3_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_3_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
... Write here your answer ...
```

##### *b)* 

```
... Write here your answer ...
```


##### *c)* 

```
... Write here your answer ...
```


##### *d)* 

```
... Write here your answer ...
```

##### *e)* 

```
... Write here your answer ...
```

##### *f)* 

```
... Write here your answer ...
```
