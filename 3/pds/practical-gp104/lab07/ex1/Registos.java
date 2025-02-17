package ex1;

import java.util.*;

class Registos {
    // Data elements
    private ArrayList<Empregado> empregados; // Stores the employees
    public Registos() {
        empregados = new ArrayList<>();
    }

    public void insere(Empregado emp) {
        // Code to insert employee
        if (!empregados.contains(emp))
            empregados.add(emp);
    }

    public void remove(int codigo) {
        // Code to remove employee 
        for (Empregado e : empregados) {
            if (e.codigo() == codigo) {
                empregados.remove(e);
                break;
            }
        }
    }

    public boolean isEmpregado(int codigo) {
        // Code to find employee
        for (Empregado e : empregados) {
            if (e.codigo() == codigo)
                return true;
        }
        return false;
    }

    public List<Empregado> listaDeEmpregados() {
        // Code to retrieve collection 
        return empregados;
    }
}
