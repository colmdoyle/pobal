class Person < ActiveRecord::Base
  has_many :groups, through: :memberships
  has_many :memberships

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/:style/placeholder.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def name
    "#{first_name} #{last_name}"
  end

  def facebook_url
    "https://fb.me/#{facebook}"
  end

  def twitter_url
    "https://twitter.com/#{twitter}"
  end

  def current_party
    groups.where(group_type_id: 1).first
  end

end
