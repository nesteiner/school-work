package com.ownlisp.main;
import com.ownlisp.antlr.LispParser;
import com.ownlisp.antlr.LispLexer;
import com.ownlisp.antlr.LispBaseVisitor;

import com.ownlisp.lispvalue.LispValue;

import java.util.List;

import static com.ownlisp.lispvalue.LispErrorEnum.*;
import static com.ownlisp.lispvalue.LispValueEnum.*;

/**
 * TODO FIXME, bug: ignore the unknown symbol
 * TODO FIXME, bug: send the space char to a special channel, I need to use it later
 */
public class EvalVisitor extends LispBaseVisitor<LispValue> {
    private LispValue evalOp(String op, LispValue left, LispValue right) {
        // 错误传递机制
        if(left.type == LVAL_ERR) {
            return left;
        }

        if(right.type == LVAL_ERR) {
            return right;
        }

        switch (op) {
            case "+": return new LispValue(left.number + right.number);
            case "-": return new LispValue(left.number - right.number);
            case "*": return new LispValue(left.number * right.number);
            case "/": return right.number == 0 ? new LispValue(LERR_DIV_ZERO, "divide by zero") : new LispValue(left.number / right.number);
            default: return new LispValue(LERR_BAD_OP, "no such op");
        }
    }

    @Override
    public LispValue visitLispLispy(LispParser.LispLispyContext ctx) {
        ctx.expr().stream().map(x -> visit(x)).forEach(value -> System.out.println(value));
        return null;
    }

    @Override
    public LispValue visitLispNumber(LispParser.LispNumberContext ctx) {
        Integer value = Integer.valueOf(ctx.Number().getText());
        return new LispValue(value);
    }

    @Override
    public LispValue visitLispSymbol(LispParser.LispSymbolContext ctx) {
        return new LispValue(LVAL_SYM, ctx.symbol().getText());
    }

    @Override
    public LispValue visitLispSexpr(LispParser.LispSexprContext ctx) {
        /**
         * match sexpr:
         * error when: '(+)', '(+ 1)' '(- 1)' '(number')
         * correct when: (+ 1 1) (+ 1 1 1 1)
         */
        List<LispParser.ExprContext> list = ctx.sexpr().expr();
        // error debug
        if(list.size() == 0 || list.size() == 1 || list.size() == 2) {
            return new LispValue(LERR_CALL, "参数太少");
        } else {
            // String op = visit(list.get(0)).stringValue;
            String op = list.get(0).getText();
            // use reduce return, but eltype is ExprContext
            LispValue init = visit(list.get(1));
            return list.stream().skip(2).map(x -> visit(x))
                    .reduce(init, (left, right) -> evalOp(op, left, right));

        }
    }

    @Override
    public LispValue visitLispQexpr(LispParser.LispQexprContext ctx) {
         return new LispValue(LVAL_QEXPR, ctx.qexpr().getText());
    }
}
