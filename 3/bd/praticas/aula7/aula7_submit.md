# BD: Guião 7


## ​7.2 
 
### *a)*

```
... Write here your answer ...
It is possible to <u>underline</u> -> {A, B,.. }
-> R1 (_A_, B, C)
-> R2 (B,F)

R: 1FN porque tem dependências parciais e transitivas
```

### *b)* 

```
2FN:
R1(<u>Titulo_Livro</u>, <u>Nome_Autor</u>, Tipo_Livro, Preço, NoPaginas, Editor, Endereço_Editor, Ano_Publicacao)
R2(<u>Nome_Autor</u>, Afiliacao_Autor)

3FN:
R1(<u>Titulo_Livro</u>, <u>Nome_Autor</u>, Tipo_Livro, NoPaginas, Editor, Ano_Publicacao)
R2(<u>Nome_Autor</u>, Afiliacao_Autor)
R3(<u>Tipo_Livro, <u>NoPAginas</u>, Preco)
R4(<u>Editor</u>, Endereco_Editor)
```




## ​7.3
 
### *a)*

```
A B
```


### *b)* 

```
R1(<u>A</u>, <u>B</u>, C)
R2(<u>A</u> , D, E, I, J)
R3(<u>B</u> , F, G, H)
```


### *c)* 

```
R1(<u>A</u>, <u>B</u>, C)
R2(<u>A</u>, D, E)
R3(<u>B</u>, F)
R4(<u>D</u>, I, J)
R5(<u>F</u>, G, H)
```


## ​7.4
 
### *a)*

```
B C
```


### *b)* 

```
R1(<u>A</u>, <u>B</u>, C, D)
R2(<u>D</u>, E)

```


### *c)* 

```
R1(<u>B</u>, C, D)
R2(<u>C</u>, A)
R3(<u>D</u>, E)
```



## ​7.5
 
### *a)*

```
A B
```

### *b)* 

```
R1(<u>A</u>, <u>B</u>, C, D, E)
R2(<u>A</u>, C)
```


### *c)* 

```
R1(<u>A</u>, B, E)
R2(<u>A</u>, C)
R3(<u>C</u>, D)
```

### *d)* 

```
R1(<u>A</u>, <u>B</u>, E)
R2(<u>A</u>, C)
R3(<u>C</u>, D)
```
