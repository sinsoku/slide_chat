class Comment < ActiveRecord::Base
  belongs_to :slide

  validates :content, presence: true
  validates :page_number, presence: true, numericality: true

  after_commit :publish_new_comment

  def publish_new_comment
    redis = Redis.new
    redis.publish("#{slide_id}.new_comment", to_json)
  end
end
