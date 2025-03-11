@SuppressWarnings("CheckReturnValue")
public class Execute extends CalculatorBaseVisitor<Long> {

   @Override public Long visitProgram(CalculatorParser.ProgramContext ctx) {
      Long res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Long visitStat(CalculatorParser.StatContext ctx) {
      Long res = null;
      if(ctx.expr() != null){
         res = visit(ctx.expr());
         System.out.println(res == null ? "Error" : res);
      }
      return visitChildren(ctx);
   }

   @Override public Long visitExprAddSub(CalculatorParser.ExprAddSubContext ctx) {
      Long n1 = visit(ctx.expr(0));
      String op = ctx.op.getText();
      Long n2 = visit(ctx.expr(1));

      if(op.equals("+"))
         return n1 + n2;
      else if(op.equals("-"))
         return n1 - n2;
      
      return null;
   }

   @Override public Long visitExprUnary(CalculatorParser.ExprUnaryContext ctx) {
      Long num = visit(ctx.expr());
      if(num == null)
         return null;
      if(ctx.op.getText().equals("-"))
         return num * -1;
      return num;
   }

   @Override public Long visitExprInteger(CalculatorParser.ExprIntegerContext ctx) {
      return Long.parseLong(ctx.Integer().getText());
   }

   @Override public Long visitExprParenthesis(CalculatorParser.ExprParenthesisContext ctx) {
      return visit(ctx.expr());
   }

   @Override public Long visitExprMultDivMod(CalculatorParser.ExprMultDivModContext ctx) {
      Long n1 = visit(ctx.expr(0));
      String op = ctx.op.getText();
      Long n2 = visit(ctx.expr(1));

      if(op.equals("*"))
         return n1 * n2;
      else if("/"){
         if(n2 == 0)
            System.err.print("ERROR: can't divide by 0!\n");
         else
            return n1 / n2;
      }
      else if(op.equals("%"))
         return n1 % n2;
      
      return null;
   }
}
