// Generated from Shapes.g4 by ANTLR 4.13.1
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link ShapesParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface ShapesVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link ShapesParser#main}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMain(ShapesParser.MainContext ctx);
	/**
	 * Visit a parse tree produced by {@link ShapesParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat(ShapesParser.StatContext ctx);
	/**
	 * Visit a parse tree produced by {@link ShapesParser#distance}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDistance(ShapesParser.DistanceContext ctx);
	/**
	 * Visit a parse tree produced by {@link ShapesParser#point}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPoint(ShapesParser.PointContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ExprNUm}
	 * labeled alternative in {@link ShapesParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprNUm(ShapesParser.ExprNUmContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ExprMulDiv}
	 * labeled alternative in {@link ShapesParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprMulDiv(ShapesParser.ExprMulDivContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ExprSumSub}
	 * labeled alternative in {@link ShapesParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprSumSub(ShapesParser.ExprSumSubContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ExprDistance}
	 * labeled alternative in {@link ShapesParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprDistance(ShapesParser.ExprDistanceContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ExprParentheses}
	 * labeled alternative in {@link ShapesParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprParentheses(ShapesParser.ExprParenthesesContext ctx);
}