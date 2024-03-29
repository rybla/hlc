structure Utilities = struct

exception Unimplemented of string;

infix $;
fun f $ x = f x

infix &;
fun x & f = f x

val contains =
 fn a => List.exists (fn a' => a = a')
			
val flip : ('a -> 'b -> 'c) -> ('b -> 'a -> 'c) =
 fn f => fn b => fn a => f a b

fun replicate 0 a = []
  | replicate i a = a :: replicate (i - 1) a

fun unwords [] = ""
  | unwords [s] = s
  | unwords (s::ss) = s^" "^unwords ss

fun unlines [] = ""
  | unlines [s] = s
  | unlines (s::ss) = s^"\n"^unlines ss
				    
end
