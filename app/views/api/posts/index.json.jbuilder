json.posts @posts do |post|
  json.id post.id
  json.atuhor post.author
  json.title post.title
  json.content post.content
end 
