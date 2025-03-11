@SuppressWarnings("CheckReturnValue")
public class Execute extends SuffixCalculatorBaseVisitor<Double> {

   @Override public Double visitStat(SuffixCalculatorParser.StatContext ctx) {
      Double res = ctx.exprt();
      if (res != null) {
          System.out.println(res);
       }
      return res;
   }

   @Override public Double visitExprNumber(SuffixCalculatorParser.ExprNumberContext ctx) {
      return Double.parseDouble(ctx.Number().getText());
   }

   @Override public Double visitExprSuffix(SuffixCalculatorParser.ExprSuffixContext ctx) {
      Double res = null;
      Double e1 = visit(ctx.expr(0));
      Double e2 = visit(ctx.expr(1));
      String op = ctx.op.getText();

      if(e1 != null && e2 != null){
         switch(op){
            case "*":
               res = e1 * e2;
               break;
            case "/":
               if(e2 == 0)
                  System.err.print("ERROR: can't divide by 0!\n");
               else
                  res = e1 / e2;
               break;
            case "+":
               res = e1 + e2;
               break;
            case "-":
               res = e1 - e2;
               break;
         }
      }

      return res;
   }
}
