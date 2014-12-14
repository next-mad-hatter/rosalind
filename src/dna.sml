exception Invalid

fun nuc_count s =
let
  fun count (#"A", (a, c, g, t)) = (a + 1, c, g, t)
    | count (#"C", (a, c, g, t)) = (a, c + 1, g, t)
    | count (#"G", (a, c, g, t)) = (a, c, g + 1, t)
    | count (#"T", (a, c, g, t)) = (a, c, g, t + 1)
    | count (_, c) = c
in
  CharVector.foldl count (0,0,0,0) s
end

fun to_s (x: int * int * int * int) =
  ((Int.toString o #1) x) ^ " " ^
  ((Int.toString o #2) x) ^ " " ^
  ((Int.toString o #3) x) ^ " " ^
  ((Int.toString o #4) x)

fun readLines () =
let
  fun read lines = case (TextIO.inputLine TextIO.stdIn) of
                        NONE => lines
                      | (SOME "") => read lines
                      | (SOME l) => read (l::lines)
in
  rev (read [])
end

val _ =
  let
    val ls = readLines ()
    val cs = map (fn l => (((to_s o nuc_count) l) ^ "\n")) ls
  in
    map print cs
  end

