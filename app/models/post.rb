class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category

  has_many :tagmaps, dependent: :destroy
  has_many :tags, through: :tagmaps

  def save_posts(tags)
    # 既にタグネームあるか
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    # 共通要素取り出し
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    # Destroy
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(tag_name:old_name)
    end
    # Create
    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(tag_name:new_name)
      self.tags << post_tag
    end
  end

end
