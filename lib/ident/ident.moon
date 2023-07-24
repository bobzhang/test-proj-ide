pub struct t {
  name:string
  id:int
}

struct int_ref {
  mut value:int
}

let cnt:int_ref = { value:0, }

pub func freshX(s: string) -> t {
  cnt.value = cnt.value + 1
  { name:s, id:cnt.value }
}

