func init {
    let x : @duplicate_method.a = A    
    
    x.len().print()
    // @duplicate_method.a::A 
    // FIXME: parse error
}