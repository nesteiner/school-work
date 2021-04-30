package com.calculator.main;

import java.io.FileInputStream;
import java.io.InputStream;

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import com.calculator.antlr.*;

public class Main {
    public static void main(String [] args) throws Exception {
        /** Try this
         def main(argv):
         input = FileStream(argv[1])
         lexer = CalculatorLexer(input)
         stream = CommonTokenStream(lexer)
         parser = CalculatorParser(stream)

         tree = parser.expr()
         v = CalculatorVisitor()
         print(v.visit(tree))
         *
         */
        String inputFile = "src/com/company/main/data";
        InputStream is = new FileInputStream(inputFile);
        ANTLRInputStream input = new ANTLRInputStream(is);

        CalculatorLexer lexer = new CalculatorLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        CalculatorParser parser = new CalculatorParser(tokens);
        ParseTree tree = parser.prog();
        EvalVisitor eval = new EvalVisitor();
        eval.visit(tree);

        System.out.println(tree.toStringTree(parser));
    }
}
