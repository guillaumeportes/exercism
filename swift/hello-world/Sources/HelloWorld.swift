//Solution goes in Sources
func hello(_ s: String? = nil) -> String
{
    if let name = s
    {
        return "Hello, \(name)!"
    }
    else
    {
        return "Hello, World!"
    }
}
