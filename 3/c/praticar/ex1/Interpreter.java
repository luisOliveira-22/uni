import java.util.*;
@SuppressWarnings("CheckReturnValue")
public class Interpreter extends StrLangBaseVisitor<String> {
  private Map<String, String> map = new HashMap<>();
  private static Scanner sc = new Scanner(System.in);

  @Override
  public String visitMain(StrLangParser.MainContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitAssign(StrLangParser.AssignContext ctx) {
    String id = ctx.ID().getText();
    String expr = visit(ctx.expr());
    map.put(id, expr);
    return null;
  }

  @Override
  public String visitPrint(StrLangParser.PrintContext ctx) {
    String expr = visit(ctx.expr());
    System.out.println(expr);
    return null;
  }

  @Override
  public String visitInput(StrLangParser.InputContext ctx) {
    String str = ctx.STRING().getText();
    System.out.println(str);

    return sc.nextLine();
  }

  @Override public String visitConcat(StrLangParser.ConcatContext ctx) {
    String expr1 = visit(ctx.expr(0));
    String expr2 = visit(ctx.expr(1));

    String out = new StringBuilder(expr1).append(expr2).toString();
    return out;
  }

  @Override public String visitSubstitution(StrLangParser.SubstitutionContext ctx) {
    String expr1 = visit(ctx.expr(0));
    String expr2 = visit(ctx.expr(1));
    String expr3 = visit(ctx.expr(2));

    return expr1.replace(expr2, expr3);
  }

  @Override public String visitTrim(StrLangParser.TrimContext ctx) {
    String expr = visit(ctx.expr());
    return expr.trim();
  }

  @Override public String visitParentesis(StrLangParser.ParentesisContext ctx) {
    return visit(ctx.expr());
  }

  @Override public String visitRem(StrLangParser.RemContext ctx) {
    String expr1 = visit(ctx.expr(0));
    String expr2 = visit(ctx.expr(1));
    String out = expr1.replace(expr2, "");
    return out;
  }

  @Override
  public String visitExprString(StrLangParser.ExprStringContext ctx) {
    String str = ctx.STRING().getText();
    return str.substring(1, str.length()-1);
  }

  @Override
  public String visitExprId(StrLangParser.ExprIdContext ctx) {
    String id = ctx.ID().getText();
    return map.get(id);
  }
}
