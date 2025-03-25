import java.util.Map;
import java.util.HashMap;

@SuppressWarnings("CheckReturnValue")
public class Execute extends CalculatorBaseVisitor<Long> {

   protected Map<String, Long> map = new HashMap<>();
   
   @Override public Long visitProgram(CalculatorParser.ProgramContext ctx) {
      return visitChildren(ctx);
   }

   @Override public Long visitStat(CalculatorParser.StatContext ctx) {
      if (ctx.expr() != null) {
			Long result = visit(ctx.expr());
			System.out.println(result == null ? "Error" : result);
		}
		return visitChildren(ctx);
   }

   @Override public Long visitAssignment(CalculatorParser.AssignmentContext ctx) {
      String variable = ctx.ID().getText();
		Long value = visit(ctx.expr());
		map.put(variable, value);
		return visitChildren(ctx);
   }

   @Override public Long visitExprAddSub(CalculatorParser.ExprAddSubContext ctx) {
      Long n1 = visit(ctx.expr(0));
		Long n2 = visit(ctx.expr(1));

		if (n1 == null || n2 == null)
			return null;

		if (ctx.op.getText().equals("+"))
			return n1 + n2;

		return n1 - n2;
   }

   @Override public Long visitExprUnary(CalculatorParser.ExprUnaryContext ctx) {
      Long num = visit(ctx.expr());
		if (num == null)
			return null;

		if (ctx.op.getText().equals("-"))
			return num * -1;

		return num;
   }

   @Override public Long visitExprInteger(CalculatorParser.ExprIntegerContext ctx) {
      return Long.parseLong(ctx.Integer().getText());
   }

   @Override public Long visitExprParenthesis(CalculatorParser.ExprParenthesisContext ctx) {
      return visit(ctx.expr());
   }

   @Override public Long visitExprID(CalculatorParser.ExprIDContext ctx) {
      String key = ctx.ID().getText();
		if (map.containsKey(key))
			return map.get(key);

		System.out.println("Variable " + key + " does not exist!");
		return null;
   }

   @Override public Long visitExprMultDivMod(CalculatorParser.ExprMultDivModContext ctx) {
      Long n1 = visit(ctx.expr(0));
		Long n2 = visit(ctx.expr(1));

		if (n1 == null || n2 == null)
			return null;

		String op = ctx.op.getText();

		if (op.equals("*"))
			return n1 * n2;

		if (n2 != 0) {
			if (op.equals("/"))
				return n1 / n2;

			return n1 % n2;
		}
		return null;
   }
}