class Post < ApplicationRecord
  has_many :authors, :through => :userposts, :source => :user
  has_many :userposts
  has_many :post_authorings, :through => :userposts, :source => :user
  has_many :comments, :dependent => :destroy, :inverse_of => :post
  has_many :tags, :through => :posttags
  has_many :post_taggings, :through => :posttags, :source => :tag, :dependent => :destroy
  has_many :posttags

  accepts_nested_attributes_for :comments,
                                :reject_if => :all_blank,
                                :allow_destroy => true
end
