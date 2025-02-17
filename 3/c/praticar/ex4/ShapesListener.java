// Generated from Shapes.g4 by ANTLR 4.13.1
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link ShapesParser}.
 */
public interface ShapesListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link ShapesParser#main}.
	 * @param ctx the parse tree
	 */
	void enterMain(ShapesParser.MainContext ctx);
	/**
	 * Exit a parse tree produced by {@link ShapesParser#main}.
	 * @param ctx the parse tree
	 */
	void exitMain(ShapesParser.MainContext ctx);
	/**
	 * Enter a parse tree produced by {@link ShapesParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterStat(ShapesParser.StatContext ctx);
	/**
	 * Exit a parse tree produced by {@link ShapesParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitStat(ShapesParser.StatContext ctx);
	/**
	 * Enter a parse tree produced by {@link ShapesParser#distance}.
	 * @param ctx the parse tree
	 */
	void enterDistance(ShapesParser.DistanceContext ctx);
	/**
	 * Exit a parse tree produced by {@link ShapesParser#distance}.
	 * @param ctx the parse tree
	 */
	void exitDistance(ShapesParser.DistanceContext ctx);
	/**
	 * Enter a parse tree produced by {@link ShapesParser#point}.
	 * @param ctx the parse tree
	 */
	void enterPoint(ShapesParser.PointContext ctx);
	/**
	 * Exit a parse tree produced by {@link ShapesParser#point}.
	 * @param ctx the parse tree
	 */
	void exitPoint(ShapesParser.PointContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprNUm}
	 * labeled alternative in {@link ShapesParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprNUm(ShapesParser.ExprNUmContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprNUm}
	 * labeled alternative in {@link ShapesParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprNUm(ShapesParser.ExprNUmContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprMulDiv}
	 * labeled alternative in {@link ShapesParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprMulDiv(ShapesParser.ExprMulDivContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprMulDiv}
	 * labeled alternative in {@link ShapesParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprMulDiv(ShapesParser.ExprMulDivContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprSumSub}
	 * labeled alternative in {@link ShapesParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprSumSub(ShapesParser.ExprSumSubContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprSumSub}
	 * labeled alternative in {@link ShapesParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprSumSub(ShapesParser.ExprSumSubContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprDistance}
	 * labeled alternative in {@link ShapesParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprDistance(ShapesParser.ExprDistanceContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprDistance}
	 * labeled alternative in {@link ShapesParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprDistance(ShapesParser.ExprDistanceContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprParentheses}
	 * labeled alternative in {@link ShapesParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprParentheses(ShapesParser.ExprParenthesesContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprParentheses}
	 * labeled alternative in {@link ShapesParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprParentheses(ShapesParser.ExprParenthesesContext ctx);
}