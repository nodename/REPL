package ;
import com.nodename.lisp.Cons;
import com.nodename.lisp.LispEnvironment;
import com.nodename.lisp.SExpressionParser;
import com.nodename.lisp.LispInterpreter;

/**
 * ...
 * @author Alan Shaw
 */

using com.nodename.lisp.Cons;
using com.nodename.lisp.SExpressionParser;
class REPL 
{
	public function new() 
	{
		var sum_:String = "
		  (lambda (list result)
		   (cond ((null list) result)
				(t (sum_ (cdr list) (+ (car list) result)))))
		";

		var min_:String = "
		  (lambda (list result)
		   (cond ((null list) result)
				(t (min_ (cdr list) (min (car list) result)))))
		";

		var sum:String = "
		  (lambda (list) (sum_ list 0))
		";

		var listmin:String = "
		  (lambda (list) (min_ list a_lot))
		";

		var nullExpression:String = "
		  (lambda (e) (eq e nil))
		";
			
		var rev_shift:String = " 
			(lambda (list result) 
				(cond ((null list) result) 
					  (t (rev_shift (cdr list) (cons (car list) result)))))
		";

		var reverse:String = "
			(lambda (list) (rev_shift list nil))
		";
	  
		var env:Hash<Dynamic> = (new LispEnvironment()
		.addFunction("sum_", sum_)
		.addFunction("min_", min_)
		.addFunction("sum", sum)
		.addFunction("listmin", listmin)
		.addFunction("null", nullExpression)
		.addAtom("min", Math.min)
		.addAtom("+", plus)
		.addAtom("t", true)
		.addAtom("nil", null)
		.addAtom("a_lot", 1000)

		.addFunction("rev_shift", rev_shift)
		.addFunction("reverse", reverse)
		.addFunction("null", nullExpression)
		).env();

		
		var lispExpressions:Array<String> = [
			"(listmin (quote(3 2 4)))",
			"(sum (quote(6 10 36)))",
			"(reverse (quote (a b c d e)))"
		];		
		
		for (lispExpression in lispExpressions)
		{
			//trace(lispExpression);
			var exp:Cons = lispExpression.parse();
			
			trace("EVAL: " + exp.toString());
			trace("  =>  " + LispInterpreter.eval(exp, env).toString());
		}		
	}

	static function plus(a:Float, b:Float):Float { return a + b; }
}