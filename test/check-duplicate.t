  $ moonc build-package ../duplicate_method/*.moon -pkg hongbo.com/test_proj/duplicate_method
  ../duplicate_method/iter2.moon:9:14-9:18 Warning 002: Unused variable 'self'
  ../duplicate_method/iter2.moon:12:15-12:19 Warning 002: Unused variable 'self'

  $ moonc build-package -i ./duplicate_method.mi ../call_duplicate/*.moon -pkg hongbo.com/test_proj/call_duplicate
  ../call_duplicate/hello.moon:2:27-2:28 Warning 013: The type of this expression is _/0, which contains unresolved type variables. The type variable is default to Unit.
  ../call_duplicate/hello.moon:2:5-2:26 Warning 013: The type of this expression is (_/0) -> unit, which contains unresolved type variables. The type variable is default to Unit.
  ../call_duplicate/hello.moon:2:27-2:28 This expression has type _/0, which is a unknown type and not a variant.
  ../call_duplicate/hello.moon:2:5-2:26 Method name has been defined for the following types:
   ../duplicate_method/iter2.moon:12:10  b
  ../duplicate_method/iter2.moon:9:10  a.
  [2]
  $ moonc build-package -i ./duplicate_method.mi ../call_duplicate2/*.moon -pkg hongbo.com/test_proj/call_duplicate2 
  $ mooninfo ./duplicate_method.lambda   
  MLAMB230221
  ((info
    ((Top_fn (binder $hongbo.com/test_proj/duplicate_method.a::len)
      (expr ((params (self/1)) (body 1))) (is_pub_ true))
     (Top_fn (binder $hongbo.com/test_proj/duplicate_method.b::len)
      (expr ((params (self/2)) (body 2))) (is_pub_ true))))
   (pkg_name hongbo.com/test_proj/duplicate_method))
  $ moonc link -S ./duplicate_method.lambda ./call_duplicate2.lambda -o ./main.wat
  $ mooninfo ./main.lambda
  MLAMB230221
  ((info
    ((Top_fn (binder $hongbo.com/test_proj/duplicate_method.a::len)
      (expr ((params (self/1)) (body 1))) (is_pub_ true))
     (Top_fn (binder $hongbo.com/test_proj/duplicate_method.b::len)
      (expr ((params (self/2)) (body 2))) (is_pub_ true))
     (Top_init
      (Llet ((x/3 ((Pmakeblock (Constr_tag_regular (total 1) (index 0))))))
       (@print_int
        (Lapply (fn $hongbo.com/test_proj/duplicate_method.a::len)
         (args (x/3))))))))
   (pkg_name main))

# it should output 1, the link is error   
  $ moonrun ./main.wat
  1
