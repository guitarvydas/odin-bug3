package bug3

import "core:fmt"

fail_fn :: proc (ok : bool, name : string) {
    fmt.printf ("  DEBUG: name %v\n", name)
    fmt.printf ("  DEBUG: ok=%v\n", ok)
    fmt.printf ("  DEBUG: len (name) %v\n", len (name))
    fmt.assertf (ok, "\n*** Error: Can't find component %v\n", name)
}

no_assertf_fail_fn :: proc (ok : bool, name : string) {
    fmt.printf ("  DEBUG: name %v\n", name)
    fmt.printf ("  DEBUG: ok=%v\n", ok)
    fmt.printf ("  DEBUG: len (name) %v\n", len (name))
    if !ok {
	fmt.printf ("\n*** Error: Can't find component %v\n", name)
    }
}


main :: proc () {
    msg := "xyz"
    no_assertf_fail_fn (false, msg)
    fail_fn (false, msg)
}

