# BD: Guião 5


## ​Problema 5.1
 
### *a)*

```
π Fname, Minit, Lname, Ssn
(employee
⨝ Ssn=Essn works_on
⨝ Pno=Pnumber project)
```


### *b)* 

```
π Fname, Minit, Lname (
	employee
	⨝ Super_ssn = Boss.Ssn (
		ρ Boss (π Ssn σ Fname = 'Carlos' ∧ Minit = 'D' ∧ Lname = 'Gomes' employee)
	)
)
```


### *c)* 

```
γ Pname; THours <- Sum(Hours)
(project
⨝ Pnumber=Pno works_on)
```


### *d)* 

```
π Fname, Minit, Lname, Hours, Dno
σ Dno = 3 ∧ Hours > 20 ∧ Pname = 'Aveiro Digital'
(employee
⨝ Ssn=Essn works_on
⨝ Pno=Pnumber project)
```


### *e)* 

```
π Fname, Minit, Lname
σ Essn = null
(employee
⟕ Ssn=Essn works_on)
```


### *f)* 

```
γ Dnumber, Dname; avg(Salary) -> avgSal (σ Sex = 'F' (employee ⨝Dno=Dnumber department))
```


### *g)* 

```
σ dependentes > 2
γ Essn, Fname, Minit, Lname; count(Essn) -> dependentes (employee⨝Ssn=Essn dependent)
```


### *h)* 

```
π Fname, Minit, Lname, Ssn
σ Essn = null (dependent ⟗Essn=Mgr_ssn (department ⨝Mgr_ssn=Ssn employee))
```


### *i)* 

```
π Fname, Minit, Lname, Address
σ Plocation = 'Aveiro' ∧ Dlocation ≠ 'Aveiro' (dept_location ⨝Dnumber=Dno (project ⨝Pnumber=Pno (employee ⨝Ssn=Essn works_on)))
```


## ​Problema 5.2

### *a)*

```
σ (encomenda.fornecedor=null) (encomenda⟗fornecedor=nif fornecedor)
```

### *b)* 

```
prod_avg = γ codProd; avg(unidades) -> avg_units (item)
π nome, avg_units (produto⨝codigo=codProd prod_avg)
```


### *c)* 

```
product_count = γ numEnc; count(codProd) -> p_count (item)
result = γ avg(p_count) -> avg_p_count (product_count)
πavg_p_count (result)
```


### *d)* 

```
fornecedor_encomenda = πencomenda.fornecedor,item.codProd,item.unidades (encomenda ⨝numero=numEnc item)
prodname_encomenda = πitem.codProd,item.unidades,fornecedor.nome (fornecedor_encomenda⨝encomenda.fornecedor=nif fornecedor)
result = γ produto.nome,fornecedor.nome; SUM(item.unidades) -> total_units (produto ⨝produto.codigo=item.codProd prodname_encomenda)
πproduto.nome,fornecedor.nome,total_units (result)
```


## ​Problema 5.3

### *a)*

```
σprescricao.numPresc=null (paciente⟕prescricao)
```

### *b)* 

```
especialidade_prescricao = πmedico.especialidade,prescricao.numPresc (prescricao⨝numMedico=numSNS medico)
γmedico.especialidade; COUNT(prescricao.numPresc) -> presc_count (especialidade_prescricao)
```


### *c)* 

```
γfarmacia.nome; COUNT(prescricao.numPresc) -> total_presc (prescricao⟖farmacia=nome farmacia)
```


### *d)* 

```
πfarmaco.numRegFarm,farmaco.nome (σpresc_farmaco.numPresc=null (presc_farmaco⟗nomeFarmaco=nome farmaco))
```

### *e)* 

```
γ farmacia, farmaceutica.nome ; COUNT(numPresc) -> sold (farmaceutica⨝numReg=numRegFarm (presc_farmaco⨝(σ farmacia≠null prescricao)))
```

### *f)* 

```
pat = γ numUtente; COUNT(numMedico) -> dif_doctors (π numUtente,numMedico prescricao)
π paciente.nome (paciente⨝(σ dif_doctors > 1 pat))
```
