// Generated from /home/steiner/school-work/play-with-compiler/src/Lisp.g4 by ANTLR 4.9.1
package com.ownlisp.antlr;
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link LispParser}.
 */
public interface LispListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by the {@code lispLispy}
	 * labeled alternative in {@link LispParser#lispy}.
	 * @param ctx the parse tree
	 */
	void enterLispLispy(LispParser.LispLispyContext ctx);
	/**
	 * Exit a parse tree produced by the {@code lispLispy}
	 * labeled alternative in {@link LispParser#lispy}.
	 * @param ctx the parse tree
	 */
	void exitLispLispy(LispParser.LispLispyContext ctx);
	/**
	 * Enter a parse tree produced by the {@code lispNumber}
	 * labeled alternative in {@link LispParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterLispNumber(LispParser.LispNumberContext ctx);
	/**
	 * Exit a parse tree produced by the {@code lispNumber}
	 * labeled alternative in {@link LispParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitLispNumber(LispParser.LispNumberContext ctx);
	/**
	 * Enter a parse tree produced by the {@code lispSymbol}
	 * labeled alternative in {@link LispParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterLispSymbol(LispParser.LispSymbolContext ctx);
	/**
	 * Exit a parse tree produced by the {@code lispSymbol}
	 * labeled alternative in {@link LispParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitLispSymbol(LispParser.LispSymbolContext ctx);
	/**
	 * Enter a parse tree produced by the {@code lispSexpr}
	 * labeled alternative in {@link LispParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterLispSexpr(LispParser.LispSexprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code lispSexpr}
	 * labeled alternative in {@link LispParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitLispSexpr(LispParser.LispSexprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code lispQexpr}
	 * labeled alternative in {@link LispParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterLispQexpr(LispParser.LispQexprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code lispQexpr}
	 * labeled alternative in {@link LispParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitLispQexpr(LispParser.LispQexprContext ctx);
	/**
	 * Enter a parse tree produced by {@link LispParser#sexpr}.
	 * @param ctx the parse tree
	 */
	void enterSexpr(LispParser.SexprContext ctx);
	/**
	 * Exit a parse tree produced by {@link LispParser#sexpr}.
	 * @param ctx the parse tree
	 */
	void exitSexpr(LispParser.SexprContext ctx);
	/**
	 * Enter a parse tree produced by {@link LispParser#qexpr}.
	 * @param ctx the parse tree
	 */
	void enterQexpr(LispParser.QexprContext ctx);
	/**
	 * Exit a parse tree produced by {@link LispParser#qexpr}.
	 * @param ctx the parse tree
	 */
	void exitQexpr(LispParser.QexprContext ctx);
	/**
	 * Enter a parse tree produced by {@link LispParser#symbol}.
	 * @param ctx the parse tree
	 */
	void enterSymbol(LispParser.SymbolContext ctx);
	/**
	 * Exit a parse tree produced by {@link LispParser#symbol}.
	 * @param ctx the parse tree
	 */
	void exitSymbol(LispParser.SymbolContext ctx);
}