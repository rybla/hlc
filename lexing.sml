structure Lexing = struct

open Utilities;

val snull : string -> bool = null o String.explode

val whitespace_chars : char list = [ #" ", #"\n" ]
val is_whitespace    : char -> bool = flip contains whitespace_chars

val separation_chars : char list = [ #"{", #"}", #"(", #")", #"\"", #";" ]
val is_separation    : char -> bool = flip contains separation_chars
					   
val lex : string -> string list =
    let
	fun lex' (w : string) (cs : char list) : string list =
	    case cs of
		[] => if snull w then [] else [w]
	      | (c::cs) =>
		if is_whitespace c then
		    if snull w then lex' "" cs
		    else w :: lex' "" cs
		else if is_separation c then
		    if snull w then Char.toString c :: lex' "" cs
		    else w :: Char.toString c :: lex' "" cs
		else
		    lex' (w ^ Char.toString c) cs
    in
	lex' "" o String.explode
    end

end
