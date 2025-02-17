// Generated from Vector.g4 by ANTLR 4.13.1
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link VectorParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface VectorVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link VectorParser#main}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMain(VectorParser.MainContext ctx);
	/**
	 * Visit a parse tree produced by the {@code Assign}
	 * labeled alternative in {@link VectorParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAssign(VectorParser.AssignContext ctx);
	/**
	 * Visit a parse tree produced by the {@code Display}
	 * labeled alternative in {@link VectorParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDisplay(VectorParser.DisplayContext ctx);
	/**
	 * Visit a parse tree produced by the {@code exprVector}
	 * labeled alternative in {@link VectorParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprVector(VectorParser.ExprVectorContext ctx);
	/**
	 * Visit a parse tree produced by the {@code exprId}
	 * labeled alternative in {@link VectorParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprId(VectorParser.ExprIdContext ctx);
	/**
	 * Visit a parse tree produced by the {@code exprNum}
	 * labeled alternative in {@link VectorParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprNum(VectorParser.ExprNumContext ctx);
}