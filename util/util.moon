pub func output_int_list(xs: list[int]) -> unit {
  match xs {
    Nil => ()
    Cons(x, Nil) => x.print()
    Cons(x, rest) => { x.print(); ' '.print(); output_int_list(rest) }
  }
}

pub func fold_right[X, Y] (xs: list[X], f: (X, Y) -> Y, init: Y) -> Y {
  match xs {
    Nil => init
    Cons(x, rest) => f(x, fold_right(rest, f, init))
  }
}

let magic_list:list[int] = Cons(1, Cons(2, Cons(3, Nil)))

// cross package mutable variable

pub enum state[X] {
  Done
  Working (X)
  Idle
}

pub func print_state() -> unit {
  match state.val {
    Done => "Done\n".print()
    Working(x) => {
      "Working on: ".print()
      x.print()
      '\n'.print()
    }
    Idle => "Idle\n".print()
  }
}

pub let state : ref[state[int]] = { val: Idle }
struct stock {
  price:float
  name:string
  dec:decorator[stock]
}

struct decorator[T] {
  f:T
  name:string
}

