class Solution {
  func simplifyPath(_ path: String) -> String { 
    var stack: [String] = []

    let components = path.split(separator: "/").map(String.init)
    for component in components {
      if component == ".." { 
        if !stack.isEmpty { 
          stack.removeLast()
        }
        } else if component != "." && component != "" { 
          stack.append(component)
        }
      }
    
    return "/" + stack.joined(separator:"/")
  }
}
