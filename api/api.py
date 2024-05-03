import base64
import random
from flask import Flask, jsonify
import json
app = Flask(__name__)
class User: 
    def __init__(self, id, name, email, imageLink = None):
      self.id = id
      self.name = name
      self.email = email
      self.imageLink = imageLink

    def serialize(self):
      return {
          'id': self.id,
          'name': self.name,
          'email': self.email,
          'imageLink': self.imageLink
      }



class Blog:
    def __init__(self, id, title, content, owner, keywords):
        self.id = id
        self.title = title
        self.content = content
        self.owner = owner
        self.keyWords = keywords
    def serialize(self):
        return {
            'id': self.id,
            'title': self.title,
            'content': self.content,
            'owner': self.owner.serialize(),
            'keyWords': self.keyWords
        }
    

genres = ['Action', 'Adventure', 'Comedy', 'Crime', 'Drama', 'Fantasy', 'Historical', 'Horror', 'Mystery', 'Philosophical', 'Political', 'Romance', 'Saga', 'Satire', 'Science fiction', 'Social', 'Speculative', 'Thriller', 'Urban', 'Western']

blogs = []
users = []
for i in range(5):
  user_id = i
  user_name = "user"+str(i)
  user_email = "user"
  user = User(user_id, user_name, user_email)
  if i == 1:
     user.imageLink = "https://media.istockphoto.com/id/1327592449/vector/default-avatar-photo-placeholder-icon-grey-profile-picture-business-man.jpg?s=612x612&w=0&k=20&c=yqoos7g9jmufJhfkbQsk-mdhKEsih6Di4WZ66t_ib7I="
  users.append(user)
  print(user.serialize())
  blog_id = i
  blog_title = "blog"+str(i)
  #generate random content with 100 words
  blog_content = str(i) + " ".join(["word"+str(j) for j in range(1000)])

  blog_owner = user
  random.shuffle(genres)
  blog_keywords = [genres[i] for i in range(5)]
  blog = Blog(blog_id, blog_title, blog_content, blog_owner, blog_keywords)
  blogs.append(blog)


@app.route('/blogs', methods=['GET'])
def get_blogs():
    #return jsonify([blogs[0].serialize()])
    return jsonify([blogs[i].serialize() for i in range(len(blogs))])

from flask import request

@app.route('/blog', methods=['GET'])
def get_blog():
    blog_id = request.args.get('id', type=int)
    if blog_id is None:
        return jsonify({'error': 'Blog ID not provided'})
    for blog in blogs:
        if blog.id == blog_id:
            return jsonify(blog.serialize())
    return jsonify({'error': 'Blog not found'})


@app.route('/users/<int:user_id>', methods=['GET'])
def get_user(user_id):
  for user in users:
    if user.id == user_id:
      return jsonify(user.serialize())
  return jsonify({'error': 'User not found'})

if __name__ == '__main__':
    app.run(host = '0.0.0.0')