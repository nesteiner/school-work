package com.ownlisp.main;

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.io.FileInputStream;
import java.io.IOException;

import com.ownlisp.antlr.LispLexer;
import com.ownlisp.antlr.LispParser;
import com.ownlisp.main.EvalVisitor;

public class Main {
    public static void main(String [] args) throws IOException {
        String inputFile = "src/com/ownlisp/main/data";
        ANTLRInputStream input = new ANTLRInputStream(new FileInputStream(inputFile));
        LispLexer lexer = new LispLexer(input);

        CommonTokenStream tokens = new CommonTokenStream(lexer);
        LispParser parser = new LispParser(tokens);
        ParseTree tree = parser.lispy();
        EvalVisitor eval = new EvalVisitor();
        System.out.println(eval.visit(tree));
    }
}
