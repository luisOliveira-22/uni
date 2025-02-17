import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.antlr.v4.runtime.tree.*;

@SuppressWarnings("CheckReturnValue")
public class Interpreter extends VectorBaseVisitor<Vector> {

   private Map<String, Vector> map = new HashMap<>();

   @Override public Vector visitMain(VectorParser.MainContext ctx) {
      return visitChildren(ctx);
      //return res;
   }

   @Override public Vector visitAssign(VectorParser.AssignContext ctx) {
      Vector vector = visit(ctx.expr());
      String variable = ctx.ID().getText();
      map.put(variable, vector);
      return null;
   }

   @Override public Vector visitDisplay(VectorParser.DisplayContext ctx) {
      Vector vector = visit(ctx.expr());
      if (vector != null) {
         System.out.println(vector);
      }
      return null;
   }

   @Override public Vector visitExprVector(VectorParser.ExprVectorContext ctx) {
      List<Integer> values = new ArrayList<>();
      for(TerminalNode number : ctx.NUMBER()){
         values.add(Integer.valueOf(number.getText()));
      }
      Vector vector = new Vector(values);
      return vector;
   }

   @Override public Vector visitExprId(VectorParser.ExprIdContext ctx) {
      String variable = ctx.ID().getText();
      Vector vector = map.get(variable);
      if (vector == null) {
         System.err.printf("ERROR: bad variable %s\n", variable);
      }
      return vector;
   }

   @Override public Vector visitExprNum(VectorParser.ExprNumContext ctx) {
      double number = Double.valueOf(ctx.NUMBER().getText());
      Vector vector = new Vector(number);
      return vector;
   }
}
