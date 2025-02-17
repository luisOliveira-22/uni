// Generated from Vector.g4 by ANTLR 4.13.1
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link VectorParser}.
 */
public interface VectorListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link VectorParser#main}.
	 * @param ctx the parse tree
	 */
	void enterMain(VectorParser.MainContext ctx);
	/**
	 * Exit a parse tree produced by {@link VectorParser#main}.
	 * @param ctx the parse tree
	 */
	void exitMain(VectorParser.MainContext ctx);
	/**
	 * Enter a parse tree produced by the {@code Assign}
	 * labeled alternative in {@link VectorParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterAssign(VectorParser.AssignContext ctx);
	/**
	 * Exit a parse tree produced by the {@code Assign}
	 * labeled alternative in {@link VectorParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitAssign(VectorParser.AssignContext ctx);
	/**
	 * Enter a parse tree produced by the {@code Display}
	 * labeled alternative in {@link VectorParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterDisplay(VectorParser.DisplayContext ctx);
	/**
	 * Exit a parse tree produced by the {@code Display}
	 * labeled alternative in {@link VectorParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitDisplay(VectorParser.DisplayContext ctx);
	/**
	 * Enter a parse tree produced by the {@code exprVector}
	 * labeled alternative in {@link VectorParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprVector(VectorParser.ExprVectorContext ctx);
	/**
	 * Exit a parse tree produced by the {@code exprVector}
	 * labeled alternative in {@link VectorParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprVector(VectorParser.ExprVectorContext ctx);
	/**
	 * Enter a parse tree produced by the {@code exprId}
	 * labeled alternative in {@link VectorParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprId(VectorParser.ExprIdContext ctx);
	/**
	 * Exit a parse tree produced by the {@code exprId}
	 * labeled alternative in {@link VectorParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprId(VectorParser.ExprIdContext ctx);
	/**
	 * Enter a parse tree produced by the {@code exprNum}
	 * labeled alternative in {@link VectorParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprNum(VectorParser.ExprNumContext ctx);
	/**
	 * Exit a parse tree produced by the {@code exprNum}
	 * labeled alternative in {@link VectorParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprNum(VectorParser.ExprNumContext ctx);
}