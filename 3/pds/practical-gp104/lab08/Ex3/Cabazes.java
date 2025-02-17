package Ex3;


public class Cabazes {
    public static void main(String[] args) {
        Caixa principal = new Caixa("Principal", 4);
        Caixa top = new Caixa("Topo", 2);
        Caixa bot = new Caixa("Especialidades", 2);
        Bebida vinhoReserva2017 = new Bebida("Vinho Reserva UA 2017", 6);
        Bebida vinhoReserva2018 = new Bebida("Vinho Reserva UA 2018", 6);
        Conserva atumAlgarvia = new Conserva("Atum à Algarvia", 3);
        Doce morango = new Doce("Morango", 2);
        Caixa interior = new Caixa("Interior", 1);
        Conserva sardinhasAzeite = new Conserva("Sardinhas em Azeite", 5);

        top.add(vinhoReserva2017);
        top.add(vinhoReserva2018);
        top.add(interior);
        interior.add(sardinhasAzeite);
        bot.add(atumAlgarvia);
        bot.add(morango);
        principal.add(top);
        principal.add(bot);

        principal.draw();
    }
}