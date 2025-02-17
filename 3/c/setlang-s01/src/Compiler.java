import java.io.File;
import java.util.*;
import org.stringtemplate.v4.*;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.antlr.v4.runtime.ParserRuleContext;

@SuppressWarnings("CheckReturnValue")
public class Compiler extends SetLangBaseVisitor<ST> {

   File f = new File("main.stg");
   protected STGroup stg = new STGroupFile("templates/main.stg");
   private Map<String, String> idList = new HashMap<>();
   private Map<String, String> idToType = new HashMap<>();
   private int counter = 0;
   private int tmpCounter = 0;

   @Override public ST visitMain(SetLangParser.MainContext ctx) {
      ST res = stg.getInstanceOf("mainClass");

      for (SetLangParser.StatContext statCtx : ctx.stat()) {
         res.add("stat", visit(statCtx).render());
     }
      return res;
   }

   @Override public ST visitDeclareAssign(SetLangParser.DeclareAssignContext ctx) {
      String var_id = ctx.ID().getText();
      String id = parseId(var_id, false);
      String type = parseType(ctx.type().getText());
      idToType.put(id, type);

      ST res1 = stg.getInstanceOf("declare");
      res1.add("type", type);
      res1.add("id", id);
      res1.add("isSet", isSet(type));

      ST e = visit(ctx.expr());
      validateTypes(type, ctx.expr().varType);

      ST res2 = stg.getInstanceOf("assign");
      res2.add("stat", res1.render());
      res2.add("stat", e.render());
      res2.add("id", id);
      res2.add("value", ctx.expr().var);

      return res2;
   }

   @Override public ST visitDeclare(SetLangParser.DeclareContext ctx) {
      String var_id = ctx.ID().getText();
      String id = parseId(var_id, false);
      String type = parseType(ctx.type().getText());
      idToType.put(id, type);

      ST res = stg.getInstanceOf("declare");
      res.add("type", type);
      res.add("id", id);
      res.add("isSet", isSet(type));

      return res;
   }

   @Override public ST visitAssign(SetLangParser.AssignContext ctx) {
      String var_id = ctx.ID().getText();
      String id = parseId(var_id, true);

      ST e = visit(ctx.expr());
      String type = idToType.get(id);
      validateTypes(type, ctx.expr().varType);

      ST res = stg.getInstanceOf("assign");
      res.add("stat", e.render());
      res.add("id", id);
      res.add("value", ctx.expr().var);

      return res;
   }

   @Override public ST visitWrite(SetLangParser.WriteContext ctx) {
      ST res = stg.getInstanceOf("print");
      res.add("stat", visit(ctx.expr()).render());
      res.add("message",ctx.expr().var);
      return res;
   }

   @Override public ST visitExprRead(SetLangParser.ExprReadContext ctx) {
      ctx.var = newId();
      ctx.varType = "String";

      String msg = ctx.STRING().getText();

      ST res = stg.getInstanceOf("readInput");
      res.add("id", ctx.var);
      res.add("message", msg);

      return res;
   }

   @Override public ST visitExprAddSub(SetLangParser.ExprAddSubContext ctx) {
      ctx.var = newId();
      ST e1 = visit(ctx.expr(0));
      ST e2 = visit(ctx.expr(1));

      if (ctx.op.getText().equals("+") &&
         isSetConcat(ctx.expr(0).varType, ctx.expr(1).varType)) {
         // Enable set+string concatenation
         ctx.varType = "String";
      }
      else {
         validateTypes(ctx.expr(0).varType, ctx.expr(1).varType);
         ctx.varType = ctx.expr(0).varType;
         validateBinaryOp(ctx.varType, ctx.op.getText());
      }

      return renderBinaryExpr(
               ctx,
               e1.render(),
               e2.render(),
               ctx.varType,
               ctx.var,
               ctx.expr(0).var,
               ctx.op.getText(),
               ctx.expr(1).var
            );
   }

   @Override public ST visitExprMulDiv(SetLangParser.ExprMulDivContext ctx) {
      ST e1 = visit(ctx.expr(0));
      ST e2 = visit(ctx.expr(1));

      validateTypes(ctx.expr(0).varType, ctx.expr(1).varType);

      ctx.var = newId();
      ctx.varType = ctx.expr(0).varType;
      validateBinaryOp(ctx.varType, ctx.op.getText());


      return renderBinaryExpr(
               ctx,
               e1.render(),
               e2.render(),
               ctx.varType,
               ctx.var,
               ctx.expr(0).var,
               ctx.op.getText(),
               ctx.expr(1).var
            );
   }

   @Override public ST visitExprCast(SetLangParser.ExprCastContext ctx) {
      ST e = visit(ctx.expr());

      String type = parseType(ctx.type().getText());
      String oldType = ctx.expr().varType;

      ctx.varType = type;
      ctx.var = newId();
      return renderCast(
               ctx,
               e.render(),
               oldType,
               ctx.expr().var,
               ctx.varType,
               ctx.var
            );
   }

   @Override public ST visitExprUnary(SetLangParser.ExprUnaryContext ctx) {
      ST e = visit(ctx.expr());
      ctx.varType = ctx.expr().varType;

      validateUnaryOp(ctx.varType, ctx.op.getText());

      ctx.var = newId();

      ST res = renderUnaryExpr(
               ctx,
               e.render(),
               ctx.varType,
               ctx.var,
               ctx.op.getText(),
               ctx.expr().var
            );

      ctx.varType = isSet(ctx.expr().varType) ? "int" : ctx.expr().varType;

      return res;
   }

   @Override public ST visitExprReal(SetLangParser.ExprRealContext ctx) {
      ST res = stg.getInstanceOf("stats");
      ST decl = stg.getInstanceOf("declare");
      ST assign = stg.getInstanceOf("assign");

      String tmpId = newId();

      ctx.var = tmpId;
      ctx.varType = "double";

      decl.add("type", "double");
      decl.add("id", tmpId);
      decl.add("isSet", false);

      assign.add("stat", decl.render());
      assign.add("id", tmpId);
      assign.add("value", ctx.REAL().getText());

      res.add("stat", assign.render());

      return res;
   }

   @Override public ST visitExprInteger(SetLangParser.ExprIntegerContext ctx) {
      ST res = stg.getInstanceOf("stats");
      ST decl = stg.getInstanceOf("declare");
      ST assign = stg.getInstanceOf("assign");

      String tmpId = newId();

      ctx.var = tmpId;
      ctx.varType = "int";

      decl.add("type", "int");
      decl.add("id", tmpId);
      decl.add("isSet", false);

      assign.add("stat", decl.render());
      assign.add("id", tmpId);
      assign.add("value", ctx.INTEGER().getText());

      res.add("stat", assign.render());

      return res;
   }

   @Override public ST visitExprStr(SetLangParser.ExprStrContext ctx) {
      ST res = stg.getInstanceOf("stats");
      ST decl = stg.getInstanceOf("declare");
      ST assign = stg.getInstanceOf("assign");

      String tmpId = newId();

      ctx.var = tmpId;
      ctx.varType = "String";

      decl.add("type", "String");
      decl.add("id", tmpId);
      decl.add("isSet", false);

      assign.add("stat", decl.render());
      assign.add("id", tmpId);
      assign.add("value", ctx.STRING().getText());

      res.add("stat", assign.render());
      return res;
   }

   @Override public ST visitExprId(SetLangParser.ExprIdContext ctx) {
      ST res = stg.getInstanceOf("stats");

      String var_id = ctx.ID().getText();
      String id = parseId(var_id, true);

      ctx.var = id;
      ctx.varType = idToType.get(id);

      return res;
   }

   @Override public ST visitExprSet(SetLangParser.ExprSetContext ctx) {
      ST res = stg.getInstanceOf("stats");
      ST set = visit(ctx.set());

      res.add("stat", set.render());

      ctx.var = ctx.set().var;
      ctx.varType = ctx.set().varType;

      return res;
   }

   @Override public ST visitSet(SetLangParser.SetContext ctx) {
      Set<String> types = new HashSet<>();
      String type = "";
      String id = newId();

      ST stats = stg.getInstanceOf("stats");
      for (SetLangParser.ExprContext e : ctx.expr()) {
         ST elements = stg.getInstanceOf("addSetElement");
         elements.add("stat", visit(e).render());
         elements.add("id", id);
         elements.add("element", e.var);
         stats.add("stat", elements.render());

         types.add(e.varType);
         type = e.varType;
      }

      if (types.size() != 1) {
         System.err.println("ERROR: set contains diferent types");
         System.exit(1);
      }

      ST res = stg.getInstanceOf("stats");
      ST decl = stg.getInstanceOf("declare");

      switch (type) {
         case "int":
            type = "Set<Integer>";
            break;
         case "String":
            type = "Set<String>";
            break;
         case "double":
            type = "Set<Double>";
            break;
         default:
            System.err.println("ERROR: invalid set type");
            System.exit(1);
            break;
      }

      decl.add("type", type);
      decl.add("id", id);
      decl.add("isSet", true);

      res.add("stat", decl.render());
      res.add("stat", stats.render());

      ctx.var = id;
      ctx.varType = type;
      return res;
   }

   private String parseType(String type){
      String parsedType = null;
      switch (type) {
         case "integer":
            parsedType = "int";
            break;
         case "text":
            parsedType = "String";
            break;
         case "real":
            parsedType = "double";
            break;
         case "set<integer>":
            parsedType = "Set<Integer>";
            break;
         case "set<real>":
            parsedType = "Set<Double>";
            break;
         case "set<text>":
            parsedType = "Set<String>";
            break;
         default:
            System.err.println("ERROR: invalid type \""+type+"\"");
            System.exit(1);
            break;
      }
      return parsedType;
   }

   private boolean isSet(String type) {
      return type.startsWith("Set");
   }

   private String parseId(String id, boolean exists) {
      String newId = idList.get(id);

      if(newId == null) {
         if(exists == true) {
            System.err.println("ERROR: variable with id \""+id+"\"" + " is not initialized");
            System.exit(1);
         }

         newId = "var" + counter;
         idList.put(id, newId);
         counter++;
      }
      else {
         if(exists == false) {
            System.err.println("ERROR: variable with id \""+id+"\"" + " already exists");
            System.exit(1);
         }
      }

      return newId;
   }

   private String newId() {
      String id = "tmp" + tmpCounter;
      tmpCounter++;
      return id;
   }

   private ST numericBinaryExpr(ParserRuleContext ctx, String e1Stats, String e2Stats, String type, String var, String e1Var, String op, String e2Var) {
      ST res = stg.getInstanceOf("numericBinaryExpr");
      res.add("stat", e1Stats);
      res.add("stat", e2Stats);
      res.add("type", type);
      res.add("var", var);
      res.add("e1", e1Var);
      res.add("op", parseOp(op));
      res.add("e2", e2Var);
      return res;
   }

   private ST numericUnaryExpr(ParserRuleContext ctx, String eStats, String type, String var, String op, String eVar) {
      ST res = stg.getInstanceOf("numericUnaryExpr");
      res.add("stat", eStats);
      res.add("type", type);
      res.add("var", var);
      res.add("op", parseOp(op));
      res.add("e", eVar);
      return res;
   }

   private ST setBinaryExpr(ParserRuleContext ctx, String e1Stats, String e2Stats, String type, String var, String e1Var, String op, String e2Var) {
      ST res = stg.getInstanceOf("stats");
      res.add("stat", e1Stats);
      res.add("stat", e2Stats);

      ST decl = stg.getInstanceOf("declare");
      decl.add("type", type);
      decl.add("id", var);
      decl.add("isSet", true);

      ST addSE = stg.getInstanceOf("addSetElement");
      addSE.add("stat", decl.render());
      addSE.add("id", var);
      addSE.add("element", e1Var);
      addSE.add("addAll", true);

      ST setOp = stg.getInstanceOf("setOperation");
      setOp.add("stat", addSE.render());
      setOp.add("e1", var);
      setOp.add("op", parseSetOp(op));
      setOp.add("e2", e2Var);

      res.add("stat", setOp.render());

      return res;
   }

   private ST setUnaryExpr(ParserRuleContext ctx, String eStats, String type, String var, String op, String eVar) {
      ST decl = stg.getInstanceOf("declare");
      decl.add("type", "int");
      decl.add("id", var);

      ST setOp = stg.getInstanceOf("setOperation");
      setOp.add("e1", eVar);
      setOp.add("op", parseSetOp(op));
      setOp.add("isAssignment", true);

      ST res = stg.getInstanceOf("assign");
      res.add("stat", decl.render());
      res.add("stat", eStats);
      res.add("id", var);
      res.add("value", setOp.render());

      return res;
   }

   private ST renderBinaryExpr(ParserRuleContext ctx, String e1Stats, String e2Stats, String type, String var, String e1Var, String op, String e2Var) {
      if (isSet(type)) {
         return setBinaryExpr(ctx, e1Stats, e2Stats, type, var, e1Var, op, e2Var);
      }
      else {
         return numericBinaryExpr(ctx, e1Stats, e2Stats, type, var, e1Var, op, e2Var);
      }
   }

   private ST renderUnaryExpr(ParserRuleContext ctx, String eStats, String type, String var, String op, String eVar) {
      if (isSet(type)) {
         return setUnaryExpr(ctx, eStats, type, var, op, eVar);
      }
      else {
         return numericUnaryExpr(ctx, eStats, type, var, op, eVar);
      }
   }

   private ST numericCast(ParserRuleContext ctx, String eStats, String oldType, String oldVar, String newType, String var) {
      ST res = stg.getInstanceOf("numToNum");
      res.add("stat", eStats);
      res.add("type1", newType);
      res.add("var1", var);
      res.add("type2", newType);
      res.add("var2", oldVar);
      return res;
   }
   private ST numericToString(ParserRuleContext ctx, String eStats, String oldType, String oldVar, String newType, String var) {
      ST res = stg.getInstanceOf("numToString");
      res.add("stat", eStats);
      res.add("var1", var);
      res.add("var2", oldVar);
      return res;
   }
   private ST stringToNumeric(ParserRuleContext ctx, String eStats, String oldType, String oldVar, String newType, String var) {
      String type = "";
      switch (newType) {
         case "int":
            type = "Integer";
            break;
         case "double":
            type = "Double";
            break;
         default:
            System.err.println("ERROR: invalid cast type \""+newType+"\"");
            System.exit(1);
      }

      ST res = stg.getInstanceOf("stringToNum");
      res.add("stat", eStats);
      res.add("type", type);
      res.add("var1", var);
      res.add("var2", oldVar);
      return res;
   }
   private ST stringToSet(ParserRuleContext ctx, String eStats, String oldType, String oldVar, String newType, String var) {
      // uses "," to separate elements
      String type = "";
      String method = "";
      switch (newType) {
         case "Set<Integer>":
            type = "Integer";
            method = "parseInt";
            break;
         case "Set<Double>":
            type = "Double";
            method = "parseDouble";
            break;
         case "Set<String>":
            type = "String";
            method = "valueOf";
            break;
         default:
            System.err.println("ERROR: invalid cast type \""+newType+"\"");
            System.exit(1);
      }

      ST res = stg.getInstanceOf("setToNum");
      res.add("stat", eStats);
      res.add("type", type);
      res.add("var1", var);
      res.add("var2", oldVar);
      res.add("method", method);
      return res;
   }


   private ST renderCast(ParserRuleContext ctx, String eStats, String oldType, String oldVar, String newType, String var) {
      if (isNumeric(oldType) && isNumeric(newType)) {
         return numericCast(ctx, eStats, oldType, oldVar, newType, var);
      }
      else if (isNumeric(oldType) && newType.equals("String")) {
         return numericToString(ctx, eStats, oldType, oldVar, newType, var);
      }
      else if (oldType.equals("String") && isNumeric(newType)) {
         return stringToNumeric(ctx, eStats, oldType, oldVar, newType, var);
      }
      else if (oldType.equals("String") && isSet(newType)) {
         return stringToSet(ctx, eStats, oldType, oldVar, newType, var);
      }
      else {
         System.err.println("ERROR: invalid conversion from \""+oldType+"\"" + " to "+ "\""+newType+"\"");
         System.exit(1);
         return null;
      }
   }

   private void validateTypes(String t1, String t2) {
      if (t1 == null || t2 == null || !t1.equals(t2)) {
         System.err.println("ERROR: invalid types \""+t1+"\"" + " and "+ "\""+t2+"\"");
         System.exit(1);
      }
   }

   private boolean isSetConcat(String t1, String t2) {
      return (isSet(t1) && t2.equals("String")) ||
               (t1.equals("String") && isSet(t2));
   }

   private boolean isRealBinaryOp(String op) {
      return Arrays.asList("*", "/", "+", "-").contains(op);
   }

   private boolean isIntegerBinaryOp(String op) {
      return Arrays.asList("*", "//", "\\\\", "+", "-").contains(op);
   }

   private boolean isTextBinaryOp(String op) {
      return "+".equals(op);
   }

   private boolean isSetBinaryOp(String op) {
      return Arrays.asList("+", "-", "&").contains(op);
   }

   private void validateBinaryOp(String type, String op) {
      if((type.equals("double") && !isRealBinaryOp(op)) ||
         (type.equals("int") && !isIntegerBinaryOp(op)) ||
         (type.equals("String") && !isTextBinaryOp(op)) ||
         (isSet(type) && !isSetBinaryOp(op))) {
            System.err.println("ERROR: invalid operator \""+op+"\"" + " for type \""+type+"\"");
            System.exit(1);
         }
   }

   private boolean isNumericUnaryOp(String op) {
      return Arrays.asList("+", "-").contains(op);
   }

   private boolean isNumeric(String type) {
      return Arrays.asList("int", "double").contains(type);
   }

   private boolean isSetUnaryOp(String op) {
      return "#".equals(op);
   }

   private void validateUnaryOp(String type, String op) {
      if((isNumeric(type) && !isNumericUnaryOp(op)) || (isSet(type) && !isSetUnaryOp(op))) {
            System.err.println("ERROR: invalid operator \""+op+"\"" + " for type \""+type+"\"");
            System.exit(1);
         }
   }

   private String parseOp(String op) {
      String res = op;
      switch(op) {
         case "+":
            break;
         case "-":
            break;
         case "*":
            break;
         case "/":
            break;
         case "#":
            break;
         case "//":
            res = "/";
            break;
         case "\\\\":
            res = "%";
            break;
         default:
            System.err.println("ERROR: invalid operator \""+op+"\"");
            System.exit(1);
      }
      return res;
   }

   private String parseSetOp(String op) {
      String method = "";
      switch(op) {
         case "+":
            method = "addAll";
            break;
         case "-":
            method = "removeAll";
            break;
         case "&":
            method = "retainAll";
            break;
         case "#":
            method = "size";
            break;
         default:
            System.err.println("ERROR: invalid set operator \""+op+"\"");
            System.exit(1);
      }
      return method;
   }
}
