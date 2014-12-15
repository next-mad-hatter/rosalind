(*
 * $File$
 * $Author$
 * $Date$
 * $Revision$
 *)

(* Computes firts n elements of sequence F_n,
 *    where F_n = F_(n-1) + k*F_(n-2),
 *          F_1 = F_2 = 1
 * k, n are read from stdin (value per line).
 *)

open CML;

fun forever init f = let
  fun loop s = loop (f s)
in
  ignore (spawn (fn () => loop init))
end

fun add (k, inCh1, inCh2, outCh: IntInf.int chan) =
  forever () (fn () =>
    send (outCh, (recv inCh1) + k * (recv inCh2)))

fun copy (inCh, outCh1, outCh2: IntInf.int chan) =
  forever () (fn () => let
    val x = recv inCh
    in
      send (outCh1, x); send (outCh2, x)
    end)

fun delay init (inCh, outCh) =
  forever init (
    fn NONE => SOME (recv inCh)
     | SOME x => (
         send (outCh, x);
         NONE
       )
     )

fun mkFibNetwork k = let
  val outCh = channel ()
  val c1 = channel () and c2 = channel () and c3 = channel ()
  val c4 = channel () and c5 = channel ()
in
  delay (SOME (IntInf.fromInt 0)) (c4, c5);
  copy (c2, c3, c4);
  add (k, c3, c5, c1);
  copy (c1, c2, outCh);
  send (c1, (IntInf.fromInt 1));
  outCh
end

fun fib k n =
let
  val ch = mkFibNetwork k
  fun loop (0, l) = rev l
    | loop (n, l) = loop (n-1, (recv ch)::l)
in
  loop (n, [])
end

fun main k n = fn () =>
(
  let
    val fs = ListPair.zip (List.tabulate (n,fn x => x+1), fib k n)
  in
    map (fn x => (
      print ((Int.toString o #1) x);
      print " ";
      print ((IntInf.toString o #2) x);
      print "\n"
    )) fs;
    RunCML.shutdown OS.Process.success
  end
  handle Exception => OS.Process.exit OS.Process.failure
)

val _ =
  let
    val k = (valOf o IntInf.fromString o valOf o TextIO.inputLine) TextIO.stdIn
    val n = (valOf o Int.fromString o valOf o TextIO.inputLine) TextIO.stdIn
    val p = RunCML.doit (main k n, NONE);
  in
    if OS.Process.isSuccess p then print "Done.\n" else ();
    OS.Process.exit p
  end

