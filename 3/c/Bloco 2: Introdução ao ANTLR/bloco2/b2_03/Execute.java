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
      Long res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Long visitExprUnary(CalculatorParser.ExprUnaryContext ctx) {
      Long res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Long visitExprInteger(CalculatorParser.ExprIntegerContext ctx) {
      Long res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Long visitExprParenthesis(CalculatorParser.ExprParenthesisContext ctx) {
      Long res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Long visitExprMultDivMod(CalculatorParser.ExprMultDivModContext ctx) {
      Long res = null;
      return visitChildren(ctx);
      //return res;
   }
}
