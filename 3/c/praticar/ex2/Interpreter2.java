@SuppressWarnings("CheckReturnValue")
public class Interpreter2 extends FracLangBaseVisitor<String> {

   @Override public String visitMain(FracLangParser.MainContext ctx) {
      String res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public String visitAssign(FracLangParser.AssignContext ctx) {
      String res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public String visitDisplay(FracLangParser.DisplayContext ctx) {
      String res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public String visitExprFract(FracLangParser.ExprFractContext ctx) {
      String res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public String visitSumSub(FracLangParser.SumSubContext ctx) {
      String res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public String visitParenthesis(FracLangParser.ParenthesisContext ctx) {
      String res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public String visitExprNum(FracLangParser.ExprNumContext ctx) {
      String res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public String visitPrefix(FracLangParser.PrefixContext ctx) {
      String res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public String visitExprId(FracLangParser.ExprIdContext ctx) {
      String res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public String visitMultDiv(FracLangParser.MultDivContext ctx) {
      String res = null;
      return visitChildren(ctx);
      //return res;
   }
}
