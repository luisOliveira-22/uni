# Tema **SetLang**, grupo **setlang-s01**
-----

## Constituição dos grupos e participação individual global

| NMec | Nome | Participação |
|:---:|:---|:---:|
|  98584 | AFONSO SILVA CASTANHETA | 40% |
|  98543 | LUÍS PEDRO DA SILVA SOARES OLIVEIRA | 30% |
|  98620 | PEDRO DUARTE SOARES FERREIRA | 30% |

## Relatório

# Desenvolvimento da Linguagem

A metodologia adotada para o desenvolvimento da linguagem abrange as seguintes etapas:

<ul>
    <li>Definição da gramática</li>
    <li>Implementação do analisador léxico e sintático</li>
    <li>Desenvolvimento dos StringTemplates</li>
</ul>


### Componentes da Gramática

1. **Instruções (`stat`):**
   - **Declaração e Atribuição de Variável:**
     - **DeclareAssign:** Declara uma variável com um tipo específico e atribui-lhe um valor (`type ID ':=' expr`).
     - **Declare:** Declara uma variável com um tipo específico sem atribuir um valor (`type ID`).
     - **Assign:** Atribui um valor a uma variável já declarada (`ID ':=' expr`).
   - **Operação de I/O:**
     - **Write:** Produz o valor de uma expressão (`'writeln' expr`).

2. **Expressões (`expr`):**
   - **Operação Unária:** Realiza operações unárias (`+' | '-' | '#'`) numa expressão.
   - **Multiplicação e Divisão:** Lida com multiplicação, divisão e outras operações relacionadas (`'*'|'/'|'//'|'\\'|'&'`).
   - **Adição e Subtração:** Lida com adição e subtração (`'+' | '-'`).
   - **Conversão de Tipo:** Converte uma expressão para um tipo especificado (`type '(' expr ')'`).
   - **Operação de Leitura:** Lê entrada de um tipo especificado a partir de uma string (`'read' STRING`).
   - **Construção de Conjunto:** Constrói um conjunto a partir de uma lista de expressões (`set`).
   - **Símobolos lexicais:** Representa números reais (`REAL`), inteiros (`INTEGER`), strings (`STRING`) e identificadores de variáveis (`ID`).

3. **Conjuntos (`set`):**
   - Define um conjunto como uma coleção de expressões (`'{' expr (',' expr)* '}'`).

4. **Tipos (`type`):**
   - Especifica um tipo, que pode ser um tipo base (`BTYPE`) ou um conjunto de um tipo base `'set<BTYPE>'`.

5. **Tipos Base (`BTYPE`):**
   - Define tipos de dados básicos: `integer`, `text` e `real`.
  
### Análise Semântica
Diferentes métodos da class visitor (visitDeclareAssign, visitDeclare, visitAssign, visitWrite, visitExprRead) são implementados para lidar com vários tipos de declarações definidas na gramática (DeclareAssign, Declare, Assign, Write, etc.). Em todas as operaçoes, o resultado é associado a uma variavel.

A verificação de types é realziada no visitor. Métodos como validateTypes, validateBinaryOp, validateUnaryOp e renderCast lidam com validação de tipos e detecção de erros relacionados com redeclaração de variáveis, variáveis não inicializadas, incompatibilidades de tipos, operações inválidas e inconsistências nos tipos de elementos de um conjunto.

Para manter modularidade e reusabilidade do codigo foram criadas funçoes render que constroem os string templates de acordo com o tipo correspondente ao use case.

De forma a demontrar casos específicos da análise semântica e o seu funcionamento, é possível executar a class main, dando como input ficheiros para serem compilados, por exemplo, p1.sl (que contém os exemplos de requisitos mínimos), e os ficheiros e*.sl (que contêm casos de deteção de erros).

### Templates do Grupo `main`

1. **`mainClass(stat)`:**
   - Gera o esqueleto de uma classe Java chamada `Output`, que importa os pacotes necessários, define um `Scanner` para entrada e inclui um método `main` onde as instruções fornecidas (`stat`) são inseridas.

2. **`stats(stat)`:**
   - Gera uma lista de instruções (`stat`).

### Templates do Grupo `stats`

1. **`declare(type, id, isSet)`:**
   - Gera código para declarar uma variável com o tipo e id fornecidos. Se `isSet` for verdadeiro, inicializa a variável como um `HashSet`.

2. **`assign(stat, id, value)`:**
   - Gera código para atribuir um valor a uma variável.

3. **`print(stat, message)`:**
   - Gera código para imprimir uma mensagem.

4. **`numericBinaryExpr(stat, type, var, e1, op, e2)`:**
   - Gera código para uma expressão numérica binária, atribuindo o resultado a uma variável. 

5. **`numericUnaryExpr(stat, type, var, op, e)`:**
   - Gera código para uma expressão numérica unária, atribuindo o resultado a uma variável. 

6. **`addSetElement(stat, id, element, addAll)`:**
   - Gera código para adicionar um elemento a um conjunto. Se `addAll` for verdadeiro, utiliza o método `addAll` em vez de `add`, que adiciona todos os elementos de um HashSet.

7. **`setOperation(stat, e1, op, e2, isAssignment)`:**
   - Gera código para operações com conjuntos como união, interseção, etc.

8. **`readInput(id, message)`:**
   - Gera código para ler o input do utilizador, exibindo uma mensagem e guardando a entrada numa variável.

---

## Contribuições

| NMec  | Nome              | Participação | Contribuição Detalhada |
|:---:|:---|:---|:---:|
| 98584 | Afonso Castanheta | 40%             | Gramática: 33%<br>Análise Semântica: 33%<br>String Templates: 35%<br>Exemplos: 100%|
| 98543 | Luís Oliveira     | 30%             | Gramática: 33%<br>Análise Semântica: 33%<br>String Templates: 35%<br>Exemplos: 0%|
| 98620 | Pedro Ferreira    | 30%             | Gramática: 33%<br>Análise Semântica: 33%<br>String Templates: 30%<br>Exemplos: 0%|

