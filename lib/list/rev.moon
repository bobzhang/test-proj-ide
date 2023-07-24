pub func list_rev[T] (self: list[T]) -> list[T] {
  fn go(acc, xs: list[T]) {
    match xs {
      Nil => acc
      Cons(x, rest) => go(list::Cons(x, acc), rest)
    }
  }

  go(Nil, self)
}

