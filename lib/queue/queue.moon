pub struct queue[T] {
  front:list[T]
  back:list[T]
}

pub func from_list[T] (front: list[T]) -> queue[T] {
  { front:front, back:Nil }
}

pub func is_empty[T] (self: queue[T]) -> bool {
  match self {
    {front:Nil, back:Nil} => true
    _ => false
  }
}

pub func norm[T] (self: queue[T]) -> queue[T] {
  match self {
    {front:Nil, back:b} => { front:@list.list_rev(b), back:Nil }
    q => q
  }
}

pub func enqueue[T] (self: queue[T], x: T) -> queue[T] {
  match self {
    {front:f, back:b} => norm({ front:f, back:Cons(x, b) })
  }
}

pub func peek[T] (self: queue[T]) -> option[T] {
  match self {
    {front:Nil, back:_} => None
    {front:Cons(x, _), back:_} => Some(x)
  }
}

pub func dequeue[T] (self: queue[T]) -> option[queue[T]] {
  match self {
    {front:Nil, back:_} => None
    {front:Cons(_, f), back:b} => Some({ front:f, back:b })
  }
}

