import Foundation

struct Posts: Decodable {
  let post: [Post]
}

struct Post: Decodable {
  let userId: Int8
  let id: Int8
  let title: String
  let body: String
}
