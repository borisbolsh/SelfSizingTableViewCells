import Foundation

struct PostsRequest: DataRequest {
  
  var url: String {
    let baseURL: String = "https://jsonplaceholder.typicode.com"
    let path: String = "/posts"
    return baseURL + path
  }
  
  var headers: [String : String] {
    [:]
  }
  
  var queryItems: [String : String] {
    [:]
  }
  
  var method: HTTPMethod {
    .get
  }
  
  func decode(_ data: Data) throws -> [Post] {
    let decoder = JSONDecoder()
    let response = try decoder.decode([Post].self, from: data)
    return response
  }
}
