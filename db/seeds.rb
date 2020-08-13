User.destroy_all
Post.destroy_all

user = User.create!(
  name: 'ahmed',
  email: 'ahmed@gmail.com',
  password: '123456',
  password_confirmation: '123456'
)

post = user.posts.create!(
  title: 'test title',
  body: 'test body',
  tag_list: ["tag1", "tag2", "tag3"]
)

post.comments.create!(
  body: 'test body',
  user_id: user.id
)