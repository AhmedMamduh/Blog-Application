class DeletePost
  include Sidekiq::Worker
  def perform(post_id)
    post = Post.find(post_id)
    return unless post
    post.delete
  end
end
