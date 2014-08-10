class Comment < ActiveRecord::Base
  belongs_to :slide

  validates :content, presence: true
  validates :page_number, presence: true, numericality: true
end
