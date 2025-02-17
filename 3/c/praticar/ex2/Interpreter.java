import java.util.*;
import java.math.*;

@SuppressWarnings("CheckReturnValue")
public class Interpreter extends FracLangBaseVisitor<String> {
   private Map<String, String> map = new HashMap<>();

   @Override public String visitMain(FracLangParser.MainContext ctx) {
      return visitChildren(ctx);
   }

   @Override public String visitAssign(FracLangParser.AssignContext ctx) {
      String id = ctx.ID().getText();
      String expr = visit(ctx.expr());
      map.put(id, expr);
      return null;
   }

   @Override public String visitDisplay(FracLangParser.DisplayContext ctx) {
      String expr = visit(ctx.expr());

      if (expr == null) {
         System.err.println("Variable not found");
      }

      System.out.println(expr);
      return null;
   }

   @Override public String visitExprFract(FracLangParser.ExprFractContext ctx) {
      int numerator = Integer.parseInt(ctx.NUMBER(0).getText());
      int denominator = Integer.parseInt(ctx.NUMBER(1).getText());
      Fraction f = new Fraction(numerator, denominator);
      return f.toString();
   }

   @Override public String visitExprNum(FracLangParser.ExprNumContext ctx) {
      int num = Integer.parseInt(ctx.NUMBER().getText());
      Fraction f = new Fraction(num);
      return f.toString();
   }

   @Override public String visitExprId(FracLangParser.ExprIdContext ctx) {
      String id = ctx.ID().getText();
      return map.get(id);
   }



   @Override public String visitSumSub(FracLangParser.SumSubContext ctx) {
      String expr1 = visit(ctx.expr(0));
      String expr2 = visit(ctx.expr(1));
      String op = ctx.OP2().getText();
      Fraction f1 = Fraction.parse(expr1);
      Fraction f2 = Fraction.parse(expr2);

      switch (op) {
         case "+":
            f1.add(f2);
            return f1.toString();
         case "-":
            f1.sub(f2);
            return f1.toString();
      }

      return null;
   }


   @Override public String visitParenthesis(FracLangParser.ParenthesisContext ctx) {
      return visit(ctx.expr());
   }

   @Override public String visitPrefix(FracLangParser.PrefixContext ctx) {
      String expr1 = visit(ctx.expr());
      String op = ctx.OP2().getText();
      Fraction f = Fraction.parse(expr1);

      switch (op) {
         case "+":
            f.setNumerator(Math.abs(f.getNumerator()));
         case "-":
         f.setNumerator(Math.abs(f.getNumerator()) * -1);

      }

      return f.toString(); 
   }

   @Override public String visitMultDiv(FracLangParser.MultDivContext ctx) {
      String expr1 = visit(ctx.expr(0));
      String expr2 = visit(ctx.expr(1));
      String op = ctx.OP1().getText();
      Fraction f1 = Fraction.parse(expr1);
      Fraction f2 = Fraction.parse(expr2);

      switch (op) {
         case "*":
            f1.mul(f2);
            return f1.toString();
         case ":":
            f1.div(f2);
            return f1.toString();
      }

      return null;
   }
}
