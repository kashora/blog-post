import base64
from flask import Flask, jsonify
import json
app = Flask(__name__)
class User: 
    def __init__(self, id, name, email, image):
      self.id = id
      self.name = name
      self.email = email
      self.image = image

    def serialize(self):
      return {
          'id': self.id,
          'name': self.name,
          'email': self.email,
          'image': self.image
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
    



blogs = []
users = []
for i in range(5):
  user_id = i
  user_name = "user"+str(i)
  user_email = "user"
  with open('fixation_cross.jpeg', 'rb') as image_file:
    encoded_image = base64.b64encode(image_file.read()).decode('utf-8')
  user_image = encoded_image
  user = User(user_id, user_name, user_email, user_image)
  users.append(user)
  blog_id = i
  blog_title = "blog"+str(i)
  #generate random content with 100 words
  blog_content = str(i) + " ".join(["word"+str(j) for j in range(100)])

  blog_owner = user
  blog_keywords = ["keywords"]
  blog = Blog(blog_id, blog_title, blog_content, blog_owner, blog_keywords)
  blogs.append(blog)


@app.route('/blogs', methods=['GET'])
def get_blogs():
    return jsonify(blogs[0].serialize())
    #return jsonify({i: blogs[i].serialize() for i in range(len(blogs))})
@app.route('/users/<int:user_id>', methods=['GET'])
def get_user(user_id):
  for user in users:
    if user.id == user_id:
      return jsonify(user.serialize())
  return jsonify({'error': 'User not found'})

if __name__ == '__main__':
    app.run(host = '0.0.0.0')