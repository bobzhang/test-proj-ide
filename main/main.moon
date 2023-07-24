func init {
  let xs = @L.map(Cons(1, Cons(2, Cons(3, Nil))), fn(x) { x + 1 })
  @util.output_int_list(xs)
  // @util.decorator
  '\n'.print()
}

func init {
  
  let id = @ident.freshX("xxx")
  id.id.print()
  ' '.print()
  let another_id = @ident.freshX("yyy")
  another_id.id.print()
  '\n'.print()
  // test syntax @pkg.t::A
  let lst = @L2.myList::Cons(42, @L2.myList::Nil)
  match lst {
    @L2.myList::Cons(x,xs) => ()
    @L2.myList::Nil => ()
  }
}

// cross package mutable variable
func init {
  @util.print_state()
  @util.state.val = Working(1)
  @util.print_state()
  @util.state.val = Done
  @util.print_state()
}

// cross package method invocation
func init {
  let q1 = @Q.from_list(Cons(1, Cons(2, Cons(3, Nil))))
  match q1.peek() {
    Some(x) => x.print()
    None => "error".print()
  }
  let Some(q2) = q1.dequeue()
  match q2.peek() {
    Some(x) => x.print()
    None => "error".print()
  }
}

