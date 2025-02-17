package ex1;

import java.util.*;

public class ex1a {
    public static void main(String[] args) {

        Employee emp1 = new Employee("Pedro", 98620, 3000);
        Employee emp2 = new Employee("Francisco", 97640, 3000);

        Database db = new Database();
        db.addEmployee(emp1);
        db.addEmployee(emp2);

        db.deleteEmployee(97640);
        db.deleteEmployee(12345);

        Employee[] listaEmpregados = db.getAllEmployees();
        for (Employee emp : listaEmpregados){
            System.out.println(emp.getEmpNum() + ": " + emp.getName() + "; Salário: €" + emp.getSalary());
        }

        System.out.println();
        Empregado empregado1 = new Empregado("Luís", "Oliveira", 98543, 1500);
        Empregado empregado2 = new Empregado("Afonso", "Castanheta", 98584, 5100);

        Registos reg = new Registos();
        reg.insere(empregado1);
        reg.insere(empregado2);
        reg.remove(98584);

        System.out.println(reg.isEmpregado(98584));
        List<Empregado> list = reg.listaDeEmpregados();
        for (Empregado empregado : list)
            System.out.println(empregado.codigo() + ": " + empregado.nome() + " " + empregado.apelido() + "; Salário: €");
        System.out.println("");
        


        // ex 2 b)
        CompanyAdapter pst = new CompanyAdapter(reg, db);

        Empregado empregado3 = new Empregado("Elon", "Musk", 99999, 1000000);
        Employee emp3 = new Employee("Jesus", 1, 1000001);
        pst.adicionarEmpregado(empregado3);
        pst.adicionarEmpregado(emp3);
        pst.removerEmpregado(99999);
        System.out.println("Employee 1 exists: " + pst.existeEmpregado(1));
        System.out.println(pst.printRegistos());
    }
}
