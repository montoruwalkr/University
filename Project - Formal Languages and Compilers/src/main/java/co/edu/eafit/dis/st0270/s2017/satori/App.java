package co.edu.eafit.dis.st0270.s2017.satori;
import java_cup.runtime.Scanner;
import gnu.getopt.Getopt;
import java_cup.runtime.Symbol;
import java_cup.runtime.ComplexSymbolFactory;
import co.edu.eafit.dis.st0270.s2017.satori.lexer.satoriScanner;
import co.edu.eafit.dis.st0270.s2017.satori.parser.satoriParser;
import co.edu.eafit.dis.st0270.javacalc.abstree.AbsTree;
import co.edu.eafit.dis.st0270.javacalc.visitor.Visitor;
import co.edu.eafit.dis.st0270.s2017.satori.visitor.SatoriVisitor;
import java.io.*;
import java.util.ArrayList;

/**
 * Clase App, contiene el main y la linea de comandos de la aplicacion.
 * 
 */

public class App 
{
    public static void main(String[] args) throws FileNotFoundException
    {
	Getopt getOpt = new Getopt("App", args, "spnf");
	int c;
	boolean s = false;
	boolean p = false;
	boolean n = false;
	boolean f = false;
	int ficheros = 0;
	
	while ((c = getOpt.getopt()) != -1 ){
	    
	    switch (c){
	    case 's':
		s = true;
		ficheros++;
		break;
	    case 'p':
		p = true;
		ficheros++;
		break;
	    case 'n':
		n = true;
		ficheros++;
		break;
	    case 'f':
		f = true;
		ficheros++;
		break;
	    default:
		break;
	    }
	}
    
	for (int i = ficheros; i<args.length;i++){
	    
	    try{
		satoriScanner scanner = new satoriScanner(new FileReader(args[i]));
		satoriParser parser = new satoriParser(scanner);
		AbsTree tree = (AbsTree)parser.parse().value;
		if (s){
		    try{		    
			for (String object: scanner.Tokens){
			    System.out.println(object);
			}
		    } catch (Exception e){
		    }
		}
		
		if (p){
		    try{
			System.out.println("File: " + args[i] +  " Parser: True");
		    }catch(Exception e){
			System.err.println("File: " + args[i] +  " Parser: False");
		    }
		}
		
		if (n){
		    try{
		    } catch (Exception e){
			System.err.println("Expresión invalida");
		    }
		}
		
		if (f){
		}
		
		if (!n){
		SatoriVisitor visitor = new SatoriVisitor();
		tree.accept(visitor);

		System.out.println("= " + visitor.getRes());
		}
		
	    } catch (Exception e){
		System.err.println("No se encontro fichero");
	    }
	}
    }
}
