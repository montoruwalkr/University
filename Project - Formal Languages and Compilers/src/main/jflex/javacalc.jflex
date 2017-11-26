package co.edu.eafit.dis.st0270.s2017.satori.lexer;

import co.edu.eafit.dis.st0270.s2017.satori.parser.satoriParser;
import co.edu.eafit.dis.st0270.s2017.satori.parser.satoriSymbols;
import co.edu.eafit.dis.st0270.javacalc.abstree.*;
import java_cup.runtime.Symbol;
import java_cup.runtime.SymbolFactory;
import java_cup.runtime.ComplexSymbolFactory;
import java.util.ArrayList;
%%

%class satoriScanner
%line
%column
%cup
%unicode
%public

%{
private SymbolFactory sf = new ComplexSymbolFactory();
public int getline() {
return yyline;
}
public int getColumn() {
return yycolumn;
}
%}

%{
public ArrayList<String> Tokens = new ArrayList<String>();
%}

EOL		= \r| \n |\r\n
WhiteSpace	= {EOL} | [ \t\n]
Identifier	= [a-z][a-z|0-9]*
Number		= 0 | [1-9][0-9]*
%%

<YYINITIAL> {
"max"		{ Tokens.add("MAX"); return sf.newSymbol("MAX", satoriSymbols.MAX, yytext()); }
"min"		{ Tokens.add("MIN"); return sf.newSymbol("MIN", satoriSymbols.MIN, yytext()); }
"swap"		{ Tokens.add("SWAP"); return sf.newSymbol("SWAP", satoriSymbols.SWAP, yytext()); }
{Identifier}	{ Tokens.add("IDENTIFIER"); return sf.newSymbol("IDENTIFIER", satoriSymbols.IDENTIFIER, yytext()); }
{Number}	{ Tokens.add("NUMBER"); return sf.newSymbol("NUMBER", satoriSymbols.NUMBER, new Integer(yytext())); }
"*"		{ Tokens.add("TIMES"); return new Symbol(satoriSymbols.TIMES); }
"<<"		{ Tokens.add("SHIFTL"); return new Symbol(satoriSymbols.SHIFTL); }
"+"		{ Tokens.add("ADD"); return new Symbol(satoriSymbols.PLUS); }
")"		{ Tokens.add("RPAREN"); return new Symbol(satoriSymbols.RPAREN); }
"S"		{ Tokens.add("STORE"); return new Symbol(satoriSymbols.S); }
"R"		{ Tokens.add("RECALL"); return new Symbol(satoriSymbols.R); }
"P"		{ Tokens.add("PLUS"); return new Symbol(satoriSymbols.P); }
"M"		{ Tokens.add("MINUS"); return new Symbol(satoriSymbols.M); }
"("		{ Tokens.add("LPAREN"); return new Symbol(satoriSymbols.LPAREN); }
"="		{ Tokens.add("EQUALS"); return new Symbol(satoriSymbols.EQUALS); }
"C"		{ Tokens.add("CLEAR"); return new Symbol(satoriSymbols.C); }
"/"		{ Tokens.add("DIVIDE"); return new Symbol(satoriSymbols.DIVIDE); }
"-"		{ Tokens.add("MINUS"); return new Symbol(satoriSymbols.MINUS); }
">>"		{ Tokens.add("SHIFTR"); return new Symbol(satoriSymbols.SHIFTR); }
{EOL}		{ Tokens.add("EOL"); return new Symbol(satoriSymbols.EOL); }
{WhiteSpace}	{ }
}
<<EOF>>		{ /*Tokens.add("EOF");*/ return new Symbol(satoriSymbols.EOF);	   }
.		{ return new Symbol(satoriSymbols.error); }


