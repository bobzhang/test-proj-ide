  $ (cd ../build/; ./build.mk)
  + moonc build-package ../util/util.moon -pkg hongbo.com/test_proj/util
  ../util/util.moon:16:5-16:15 Warning 002: Unused variable 'magic_list'
  ../util/util.moon:39:8-39:13 Warning 004: Unused abstract type 'stock'
  ../util/util.moon:45:8-45:17 Warning 004: Unused abstract type 'decorator'
  + moonc build-package ../lib/ident/ident.moon -pkg hongbo.com/test_proj/lib/ident
  + moonc build-package ../lib/list/map.moon ../lib/list/rev.moon -pkg hongbo.com/test_proj/lib/list -i ./util.mi
  + moonc build-package ../lib/list2/data.moon -pkg hongbo.com/test_proj/lib/list2 -i ./util.mi
  + moonc build-package ../lib/queue/queue.moon -pkg hongbo.com/test_proj/lib/queue -i ./list.mi
  + moonc build-package ../main/main.moon -pkg main -i ./list.mi:L -i ./list2.mi:L2 -i ./queue.mi:Q -i ./ident.mi -i ./util.mi
  ../main/main.moon:17:22-17:23 Warning 002: Unused variable 'x'
  ../main/main.moon:17:24-17:26 Warning 002: Unused variable 'xs'
  + moonc link ./util.lambda ./ident.lambda ./list.lambda ./list2.lambda ./queue.lambda ./main.lambda -o ./main.wat
  $ echo $?
  0
  $ (cd ../check/  ; ./check.mk)
  + moonc check ../util/util.moon -pkg hongbo.com/test_proj/util
  ../util/util.moon:16:5-16:15 Warning 002: Unused variable 'magic_list'
  ../util/util.moon:39:8-39:13 Warning 004: Unused abstract type 'stock'
  ../util/util.moon:45:8-45:17 Warning 004: Unused abstract type 'decorator'
  + moonc check ../lib/ident/ident.moon -pkg hongbo.com/test_proj/lib/ident
  + moonc check ../lib/list/map.moon ../lib/list/rev.moon -pkg hongbo.com/test_proj/lib/list -i ./util.mi
  + moonc check ../lib/list2/data.moon -pkg hongbo.com/test_proj/lib/list2 -i ./util.mi
  + moonc check ../lib/queue/queue.moon -pkg hongbo.com/test_proj/lib/queue -i ./list.mi
  + moonc check ../main/main.moon -pkg main -i ./list.mi:L -i ./list2.mi:L2 -i ./queue.mi:Q -i ./ident.mi -i ./util.mi
  ../main/main.moon:17:22-17:23 Warning 002: Unused variable 'x'
  ../main/main.moon:17:24-17:26 Warning 002: Unused variable 'xs'
  $ echo $?
  0
  $ moonrun ../build/main.wat
  2 3 4
  1 2
  Idle
  Working on: 1
  Done
  12
  $ echo $?
  0
  $ pwd
  $TESTCASE_ROOT
  $ mooninfo ../check/*.mi
  MINTF230520
  ((export_values
    ((fresh
      ((typ
        (Tarrow
         (params_ty
          ((Tconstr (type_constructor (Predef string)) (tys ())
            (generic_ false))))
         (ret_ty
          (Tconstr
           (type_constructor
            (Toplevel (pkg hongbo.com/test_proj/lib/ident) (id t)))
           (tys ()) (generic_ false)))
         (generic_ false)))
       (pub true) (loc_ 12:10-12:15)))))
   (export_types
    ((t
      ((ty_constr (Toplevel (pkg hongbo.com/test_proj/lib/ident) (id t)))
       (ty_arity 0)
       (ty_desc
        (Record_type
         (((field_name name)
           (field_info
            ((pos 0)
             (ty_field
              (Tconstr (type_constructor (Predef string)) (tys ())
               (generic_ false)))
             (ty_record
              (Tconstr
               (type_constructor
                (Toplevel (pkg hongbo.com/test_proj/lib/ident) (id t)))
               (tys ()) (generic_ false)))
             (mut false) (pub true) (all_labels (name id)))))
          ((field_name id)
           (field_info
            ((pos 1)
             (ty_field
              (Tconstr (type_constructor (Predef int)) (tys ())
               (generic_ false)))
             (ty_record
              (Tconstr
               (type_constructor
                (Toplevel (pkg hongbo.com/test_proj/lib/ident) (id t)))
               (tys ()) (generic_ false)))
             (mut false) (pub true) (all_labels (name id))))))))
       (ty_vis Vis_pub) (ty_loc_ 1:12-1:13)))
     (int_ref
      ((ty_constr (Toplevel (pkg hongbo.com/test_proj/lib/ident) (id int_ref)))
       (ty_arity 0) (ty_desc Abstract_type) (ty_loc_ 6:8-6:15)))))
   (export_method_env ()) (name hongbo.com/test_proj/lib/ident))
  MINTF230520
  ((export_values ()) (export_types ())
   (export_method_env
    ((list
      ((map
        ((id $hongbo.com/test_proj/lib/list.list::map) (prim ())
         (self_typ
          (Tconstr (type_constructor (Predef list))
           (tys ((Tvar (link Tnolink) (generic_ true)))) (generic_ true)))
         (typ
          (Tarrow
           (params_ty
            ((Tarrow (params_ty ((Tvar (link Tnolink) (generic_ true))))
              (ret_ty (Tvar (link Tnolink) (generic_ true))) (generic_ true))))
           (ret_ty
            (Tconstr (type_constructor (Predef list))
             (tys ((Tvar (link Tnolink) (generic_ true)))) (generic_ true)))
           (generic_ true)))
         (pub true) (loc 1:10-1:13)
         (ty_params_
          (Cons (name X) (typ (Tvar (link Tnolink) (generic_ true)))
           (constraints ())
           (next
            (Cons (name Y) (typ (Tvar (link Tnolink) (generic_ true)))
             (constraints ()) (next Nil)))))))
       (list_rev
        ((id $hongbo.com/test_proj/lib/list.list::list_rev) (prim ())
         (self_typ
          (Tconstr (type_constructor (Predef list))
           (tys ((Tvar (link Tnolink) (generic_ true)))) (generic_ true)))
         (typ
          (Tarrow (params_ty ())
           (ret_ty
            (Tconstr (type_constructor (Predef list))
             (tys ((Tvar (link Tnolink) (generic_ true)))) (generic_ true)))
           (generic_ true)))
         (pub true) (loc 1:10-1:18)
         (ty_params_
          (Cons (name T) (typ (Tvar (link Tnolink) (generic_ true)))
           (constraints ()) (next Nil)))))))))
   (name hongbo.com/test_proj/lib/list))
  MINTF230520
  ((export_values ())
   (export_types
    ((myList
      ((ty_constr (Toplevel (pkg hongbo.com/test_proj/lib/list2) (id myList)))
       (ty_arity 1)
       (ty_desc
        (Variant_type
         (((constr_name Nil)
           (constr_info
            ((cs_arg ())
             (cs_res
              (Tconstr
               (type_constructor
                (Toplevel (pkg hongbo.com/test_proj/lib/list2) (id myList)))
               (tys ((Tvar (link Tnolink) (generic_ true)))) (generic_ true)))
             (cs_tag (Constr_tag_regular (total 2) (index 0))) (cs_pub true))))
          ((constr_name Cons)
           (constr_info
            ((cs_arg
              ((Tproduct
                (tys
                 ((Tvar (link Tnolink) (generic_ true))
                  (Tconstr
                   (type_constructor
                    (Toplevel (pkg hongbo.com/test_proj/lib/list2) (id myList)))
                   (tys ((Tvar (link Tnolink) (generic_ true))))
                   (generic_ true))))
                (generic_ true))))
             (cs_res
              (Tconstr
               (type_constructor
                (Toplevel (pkg hongbo.com/test_proj/lib/list2) (id myList)))
               (tys ((Tvar (link Tnolink) (generic_ true)))) (generic_ true)))
             (cs_tag (Constr_tag_regular (total 2) (index 1))) (cs_pub true)))))))
       (ty_vis Vis_pub) (ty_loc_ 1:10-1:16)))))
   (export_method_env ()) (name hongbo.com/test_proj/lib/list2))
  MINTF230520
  ((export_values ()) (export_types ()) (export_method_env ()) (name main))
  MINTF230520
  ((export_values
    ((from_list
      ((typ
        (Tarrow
         (params_ty
          ((Tconstr (type_constructor (Predef list))
            (tys ((Tvar (link Tnolink) (generic_ true)))) (generic_ true))))
         (ret_ty
          (Tconstr
           (type_constructor
            (Toplevel (pkg hongbo.com/test_proj/lib/queue) (id queue)))
           (tys ((Tvar (link Tnolink) (generic_ true)))) (generic_ true)))
         (generic_ true)))
       (pub true) (loc_ 6:10-6:19)
       (ty_params_
        (Cons (name T) (typ (Tvar (link Tnolink) (generic_ true)))
         (constraints ()) (next Nil)))))))
   (export_types
    ((queue
      ((ty_constr (Toplevel (pkg hongbo.com/test_proj/lib/queue) (id queue)))
       (ty_arity 1)
       (ty_desc
        (Record_type
         (((field_name front)
           (field_info
            ((pos 0)
             (ty_field
              (Tconstr (type_constructor (Predef list))
               (tys ((Tvar (link Tnolink) (generic_ true)))) (generic_ true)))
             (ty_record
              (Tconstr
               (type_constructor
                (Toplevel (pkg hongbo.com/test_proj/lib/queue) (id queue)))
               (tys ((Tvar (link Tnolink) (generic_ true)))) (generic_ true)))
             (mut false) (pub true) (all_labels (front back)))))
          ((field_name back)
           (field_info
            ((pos 1)
             (ty_field
              (Tconstr (type_constructor (Predef list))
               (tys ((Tvar (link Tnolink) (generic_ true)))) (generic_ true)))
             (ty_record
              (Tconstr
               (type_constructor
                (Toplevel (pkg hongbo.com/test_proj/lib/queue) (id queue)))
               (tys ((Tvar (link Tnolink) (generic_ true)))) (generic_ true)))
             (mut false) (pub true) (all_labels (front back))))))))
       (ty_vis Vis_pub) (ty_loc_ 1:12-1:17)))))
   (export_method_env
    ((queue
      ((peek
        ((id $hongbo.com/test_proj/lib/queue.queue::peek) (prim ())
         (self_typ
          (Tconstr
           (type_constructor
            (Toplevel (pkg hongbo.com/test_proj/lib/queue) (id queue)))
           (tys ((Tvar (link Tnolink) (generic_ true)))) (generic_ true)))
         (typ
          (Tarrow (params_ty ())
           (ret_ty
            (Tconstr (type_constructor (Predef option))
             (tys ((Tvar (link Tnolink) (generic_ true)))) (generic_ true)))
           (generic_ true)))
         (pub true) (loc 30:10-30:14)
         (ty_params_
          (Cons (name T) (typ (Tvar (link Tnolink) (generic_ true)))
           (constraints ()) (next Nil)))))
       (enqueue
        ((id $hongbo.com/test_proj/lib/queue.queue::enqueue) (prim ())
         (self_typ
          (Tconstr
           (type_constructor
            (Toplevel (pkg hongbo.com/test_proj/lib/queue) (id queue)))
           (tys ((Tvar (link Tnolink) (generic_ true)))) (generic_ true)))
         (typ
          (Tarrow (params_ty ((Tvar (link Tnolink) (generic_ true))))
           (ret_ty
            (Tconstr
             (type_constructor
              (Toplevel (pkg hongbo.com/test_proj/lib/queue) (id queue)))
             (tys ((Tvar (link Tnolink) (generic_ true)))) (generic_ true)))
           (generic_ true)))
         (pub true) (loc 24:10-24:17)
         (ty_params_
          (Cons (name T) (typ (Tvar (link Tnolink) (generic_ true)))
           (constraints ()) (next Nil)))))
       (is_empty
        ((id $hongbo.com/test_proj/lib/queue.queue::is_empty) (prim ())
         (self_typ
          (Tconstr
           (type_constructor
            (Toplevel (pkg hongbo.com/test_proj/lib/queue) (id queue)))
           (tys ((Tvar (link Tnolink) (generic_ true)))) (generic_ true)))
         (typ
          (Tarrow (params_ty ())
           (ret_ty
            (Tconstr (type_constructor (Predef bool)) (tys ())
             (generic_ false)))
           (generic_ true)))
         (pub true) (loc 10:10-10:18)
         (ty_params_
          (Cons (name T) (typ (Tvar (link Tnolink) (generic_ true)))
           (constraints ()) (next Nil)))))
       (norm
        ((id $hongbo.com/test_proj/lib/queue.queue::norm) (prim ())
         (self_typ
          (Tconstr
           (type_constructor
            (Toplevel (pkg hongbo.com/test_proj/lib/queue) (id queue)))
           (tys ((Tvar (link Tnolink) (generic_ true)))) (generic_ true)))
         (typ
          (Tarrow (params_ty ())
           (ret_ty
            (Tconstr
             (type_constructor
              (Toplevel (pkg hongbo.com/test_proj/lib/queue) (id queue)))
             (tys ((Tvar (link Tnolink) (generic_ true)))) (generic_ true)))
           (generic_ true)))
         (pub true) (loc 17:10-17:14)
         (ty_params_
          (Cons (name T) (typ (Tvar (link Tnolink) (generic_ true)))
           (constraints ()) (next Nil)))))
       (dequeue
        ((id $hongbo.com/test_proj/lib/queue.queue::dequeue) (prim ())
         (self_typ
          (Tconstr
           (type_constructor
            (Toplevel (pkg hongbo.com/test_proj/lib/queue) (id queue)))
           (tys ((Tvar (link Tnolink) (generic_ true)))) (generic_ true)))
         (typ
          (Tarrow (params_ty ())
           (ret_ty
            (Tconstr (type_constructor (Predef option))
             (tys
              ((Tconstr
                (type_constructor
                 (Toplevel (pkg hongbo.com/test_proj/lib/queue) (id queue)))
                (tys ((Tvar (link Tnolink) (generic_ true)))) (generic_ true))))
             (generic_ true)))
           (generic_ true)))
         (pub true) (loc 37:10-37:17)
         (ty_params_
          (Cons (name T) (typ (Tvar (link Tnolink) (generic_ true)))
           (constraints ()) (next Nil)))))))))
   (name hongbo.com/test_proj/lib/queue))
  MINTF230520
  ((export_values
    ((state
      ((typ
        (Tconstr (type_constructor (Predef ref))
         (tys
          ((Tconstr
            (type_constructor
             (Toplevel (pkg hongbo.com/test_proj/util) (id state)))
            (tys
             ((Tconstr (type_constructor (Predef int)) (tys ())
               (generic_ false))))
            (generic_ false))))
         (generic_ false)))
       (pub true) (loc_ 38:9-38:14)))
     (print_state
      ((typ
        (Tarrow (params_ty ())
         (ret_ty
          (Tconstr (type_constructor (Predef unit)) (tys ()) (generic_ false)))
         (generic_ false)))
       (pub true) (loc_ 26:10-26:21)))
     (fold_right
      ((typ
        (Tarrow
         (params_ty
          ((Tconstr (type_constructor (Predef list))
            (tys ((Tvar (link Tnolink) (generic_ true)))) (generic_ true))
           (Tarrow
            (params_ty
             ((Tvar (link Tnolink) (generic_ true))
              (Tvar (link Tnolink) (generic_ true))))
            (ret_ty (Tvar (link Tnolink) (generic_ true))) (generic_ true))
           (Tvar (link Tnolink) (generic_ true))))
         (ret_ty (Tvar (link Tnolink) (generic_ true))) (generic_ true)))
       (pub true) (loc_ 9:10-9:20)
       (ty_params_
        (Cons (name X) (typ (Tvar (link Tnolink) (generic_ true)))
         (constraints ())
         (next
          (Cons (name Y) (typ (Tvar (link Tnolink) (generic_ true)))
           (constraints ()) (next Nil)))))))
     (output_int_list
      ((typ
        (Tarrow
         (params_ty
          ((Tconstr (type_constructor (Predef list))
            (tys
             ((Tconstr (type_constructor (Predef int)) (tys ())
               (generic_ false))))
            (generic_ false))))
         (ret_ty
          (Tconstr (type_constructor (Predef unit)) (tys ()) (generic_ false)))
         (generic_ false)))
       (pub true) (loc_ 1:10-1:25)))))
   (export_types
    ((stock
      ((ty_constr (Toplevel (pkg hongbo.com/test_proj/util) (id stock)))
       (ty_arity 0) (ty_desc Abstract_type) (ty_loc_ 39:8-39:13)))
     (decorator
      ((ty_constr (Toplevel (pkg hongbo.com/test_proj/util) (id decorator)))
       (ty_arity 1) (ty_desc Abstract_type) (ty_loc_ 45:8-45:17)))
     (state
      ((ty_constr (Toplevel (pkg hongbo.com/test_proj/util) (id state)))
       (ty_arity 1)
       (ty_desc
        (Variant_type
         (((constr_name Done)
           (constr_info
            ((cs_arg ())
             (cs_res
              (Tconstr
               (type_constructor
                (Toplevel (pkg hongbo.com/test_proj/util) (id state)))
               (tys ((Tvar (link Tnolink) (generic_ true)))) (generic_ true)))
             (cs_tag (Constr_tag_regular (total 3) (index 0))) (cs_pub true))))
          ((constr_name Working)
           (constr_info
            ((cs_arg ((Tvar (link Tnolink) (generic_ true))))
             (cs_res
              (Tconstr
               (type_constructor
                (Toplevel (pkg hongbo.com/test_proj/util) (id state)))
               (tys ((Tvar (link Tnolink) (generic_ true)))) (generic_ true)))
             (cs_tag (Constr_tag_regular (total 3) (index 1))) (cs_pub true))))
          ((constr_name Idle)
           (constr_info
            ((cs_arg ())
             (cs_res
              (Tconstr
               (type_constructor
                (Toplevel (pkg hongbo.com/test_proj/util) (id state)))
               (tys ((Tvar (link Tnolink) (generic_ true)))) (generic_ true)))
             (cs_tag (Constr_tag_regular (total 3) (index 2))) (cs_pub true)))))))
       (ty_vis Vis_pub) (ty_loc_ 20:10-20:15)))))
   (export_method_env ()) (name hongbo.com/test_proj/util))
