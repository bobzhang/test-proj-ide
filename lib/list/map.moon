pub func map[X, Y] (self: list[X], f: (X) -> Y) -> list[Y] {
  let iter = fn(x, acc) { (Cons(f(x), acc) : list[_]) }
  let init = list::Nil
  @util.fold_right(self, iter, init)
}

