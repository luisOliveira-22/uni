@SuppressWarnings("CheckReturnValue")
public class VInterpreter extends ShapesBaseVisitor<Object> {

   @Override public Object visitStat(ShapesParser.StatContext ctx) {
      Double res = null;
      res = (Double)visit(ctx.expr());
      if(res != null)
         System.out.println("Result: " + res);
      return res;
   }

   @Override public Object visitDistance(ShapesParser.DistanceContext ctx) {
      Double res = null;
      Point p1 = (Point)visit(ctx.point(0));
      Point p2 = (Point)visit(ctx.point(1));
      if(p1 != null && p2 != null)
         res = p1.distance(p2);
      return res;
   }

   @Override public Object visitPoint(ShapesParser.PointContext ctx) {
      Point res = null;
      Double x = (Double)visit(ctx.expr(0));
      Double y = (Double)visit(ctx.expr(1));
      if(x != null && y != null)
         res = new Point(x, y);
      return res;
   }

   @Override public Object visitExprNUm(ShapesParser.ExprNUmContext ctx) {
      return Double.parseDouble(ctx.NUM().getText());
   }

   @Override public Object visitExprMulDiv(ShapesParser.ExprMulDivContext ctx) {
      Double res = null;
      Double e1 = (Double)visit(ctx.expr(0));
      Double e2 = (Double)visit(ctx.expr(1));
      if(e1 != null && e2 != null)
         switch(ctx.op.getText()){
            case "*":
               res = e1 * e2;
               break;
            case "/":
               if(e2 == 0)
                  System.err.println("ERRO: DIVISÃO POR 0!");
               else
                  res = e1 / e2;
               break;
         }
      return res;
   }

   @Override public Object visitExprSumSub(ShapesParser.ExprSumSubContext ctx) {
      Double res = null;
      Double e1 = (Double)visit(ctx.expr(0));
      Double e2 = (Double)visit(ctx.expr(1));
      if(e1 != null && e2 != null)
         switch(ctx.op.getText()){
            case "+":
               res = e1 + e2;
               break;
            case "-":
               res = e1 - e2;
               break;
         }
      return res;
   }

   @Override public Object visitExprDistance(ShapesParser.ExprDistanceContext ctx) {
      return visit(ctx.distance());
   }

   @Override public Object visitExprParentheses(ShapesParser.ExprParenthesesContext ctx) {
      return visit(ctx.expr());
   }
}
