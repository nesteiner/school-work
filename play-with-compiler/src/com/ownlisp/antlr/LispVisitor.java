// Generated from /home/steiner/school-work/play-with-compiler/src/Lisp.g4 by ANTLR 4.9.1
package com.ownlisp.antlr;
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link LispParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface LispVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by the {@code lispLispy}
	 * labeled alternative in {@link LispParser#lispy}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLispLispy(LispParser.LispLispyContext ctx);
	/**
	 * Visit a parse tree produced by the {@code lispNumber}
	 * labeled alternative in {@link LispParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLispNumber(LispParser.LispNumberContext ctx);
	/**
	 * Visit a parse tree produced by the {@code lispSymbol}
	 * labeled alternative in {@link LispParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLispSymbol(LispParser.LispSymbolContext ctx);
	/**
	 * Visit a parse tree produced by the {@code lispSexpr}
	 * labeled alternative in {@link LispParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLispSexpr(LispParser.LispSexprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code lispQexpr}
	 * labeled alternative in {@link LispParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLispQexpr(LispParser.LispQexprContext ctx);
	/**
	 * Visit a parse tree produced by {@link LispParser#sexpr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSexpr(LispParser.SexprContext ctx);
	/**
	 * Visit a parse tree produced by {@link LispParser#qexpr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitQexpr(LispParser.QexprContext ctx);
	/**
	 * Visit a parse tree produced by {@link LispParser#symbol}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSymbol(LispParser.SymbolContext ctx);
}