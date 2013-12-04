class Link < ActiveRecord::Base
  belongs_to :linkable, :polymorphic => true

  validates_presence_of :linkable, :url

  def text
    self[:text].blank? ?  url : self[:text]
  end
end