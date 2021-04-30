package com.calculator.main;

import com.calculator.antlr.CalculatorBaseVisitor;
import com.calculator.antlr.CalculatorParser;

import java.util.HashMap;
import java.util.Map;

public class EvalVisitor extends CalculatorBaseVisitor<Integer> {
    Map<String, Integer> dict = new HashMap<>();
    @Override
    public Integer visitPrintExpr(CalculatorParser.PrintExprContext ctx) {
        Integer value = visit(ctx.expr());
        System.out.println(value);
        return null;
    }

    @Override
    public Integer visitAssign(CalculatorParser.AssignContext ctx) {
        String name = ctx.ID().getText();
        Integer value = visit(ctx.expr());
        dict.put(name, value);
        return null;
    }

    @Override
    public Integer visitBlank(CalculatorParser.BlankContext ctx) {
        return null;
    }

    @Override
    public Integer visitMulDiv(CalculatorParser.MulDivContext ctx) {
        Integer left = visit(ctx.expr(0));
        Integer right = visit(ctx.expr(1));

        if(ctx.hello.getType() == CalculatorParser.MUL) {
            return left * right;
        } else {
            return left / right;
        }
    }

    @Override
    public Integer visitAddSub(CalculatorParser.AddSubContext ctx) {
        Integer left = visit(ctx.expr(0));
        Integer right = visit(ctx.expr(1));

        if(ctx.hello.getType() == CalculatorParser.ADD) {
            return left + right;
        } else {
            return left - right;
        }
    }

    @Override
    public Integer visitInt(CalculatorParser.IntContext ctx) {
        return Integer.valueOf(ctx.INT().getText());
    }

    @Override
    public Integer visitId(CalculatorParser.IdContext ctx) {
        String id = ctx.ID().getText();
        return dict.getOrDefault(id, null);
    }

    @Override
    public Integer visitParens(CalculatorParser.ParensContext ctx) {
        return visit(ctx.expr());
    }
}
