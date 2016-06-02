json.post do
  json.id @post.id
  json.author @post.author
  json.title @post.title
  json.content @post.content
end 
