Main.odin calls 2 functions.  They are almost the same, except that 
- no_assertf_fail_fn explicitly tests `ok` and prints an error message using `fmt.printf()`
- fail_fn calls `fmt.assertf()` to do the same testing, but crashes

This might be a MacOS issue...

On my Mac (Intel, MacOS Ventura 13.6.1), the second call crashes. As far as I can tell, the failure happens due to `core:fmt` (namely `assertf`).

```
$ make
make
rm -f bug3
odin build . -debug -o:none
ld: warning: no platform load command found in '/Users/tarvydas/quicklisp/local-projects/odin-bug3/odin-bug3.o', assuming: macOS
odin run .
ld: warning: no platform load command found in '/Users/tarvydas/quicklisp/local-projects/odin-bug3/odin-bug3.o', assuming: macOS
  DEBUG: name xyz
  DEBUG: ok=false
  DEBUG: len (name) 3

*** Error: Can't find component xyz
  DEBUG: name xyz
  DEBUG: ok=false
  DEBUG: len (name) 3
make: *** [bug3] Error 12
$ 
```

To duplicate:
clone https://github.com/guitarvydas/odin-bug3.git
make

(Maybe this works fine on Linux, but crashes on MacOS).


