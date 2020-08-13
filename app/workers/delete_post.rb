class DeletePost
  include Sidekiq::Worker
  def perform(post_id)
    post = Post.find_by(id: post_id)
    return unless post
    post.delete
  end
end
