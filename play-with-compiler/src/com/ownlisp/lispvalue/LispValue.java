package com.ownlisp.lispvalue;

import javax.management.remote.JMXServerErrorException;

import static com.ownlisp.lispvalue.LispValueEnum.*;
import static com.ownlisp.lispvalue.LispErrorEnum.*;

public class LispValue {
    public LispValueEnum type;
    public Integer number;
    public LispErrorEnum error;
    public String stringValue; // to storage error, symbol, qexpr and sexpr

    public LispValue(Integer number) {
        this.type = LVAL_NUM;
        this.number = number;
    }

    public LispValue(LispErrorEnum error, String message) {
        this.type = LVAL_ERR;
        this.error = error;
        this.stringValue = message;
    }

    // contructor for qexpr, sexpr, and symbol
    public LispValue(LispValueEnum valueEnum, String stringValue) {
        this.type = valueEnum;
        this.stringValue = stringValue;
    }

    public String toString() {
//        switch (type) {
//            case LVAL_ERR: return error.toString() + ": " + stringValue;
//            case LVAL_NUM: return type.toString() + ": " + number.toString();
//            default: return type.toString() + ": " + stringValue;
//        }

        switch (type) {
            case LVAL_ERR: return error.toString() + ": " + stringValue;
            case LVAL_NUM: return number.toString();
            case LVAL_SYM: return stringValue;
            default: return type.toString() + ": " + stringValue;
        }
    }

}
