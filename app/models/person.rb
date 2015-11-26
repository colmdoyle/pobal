class Person < ActiveRecord::Base
  include FriendlyId
  has_many :groups, through: :memberships
  has_many :bodies, through: :positions
  has_many :memberships
  has_many :positions

  default_scope { order('last_name ASC') }

  has_attached_file :avatar, styles: { large: "600x600#", medium: "300x300#", small: "175x175#", thumb: "100x100#" }, default_url: "/assets/:style/placeholder.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  # slug
  friendly_id :name, :use => [:slugged, :finders]

  def slug_candidates
    [
      :name,
      :name, :id
    ]
  end

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
    groups.where(group_type_id: 1, 'memberships.end_date' => nil).first
  end

  def current_body
    current_position.body
  end

  def current_position
    positions.includes(:constituency).where(end_date: nil).where.not(constituency: nil).order('start_date ASC').first
  end

  def current_constituency
    if current_position
      current_position.constituency
    end
  end

  def should_generate_new_friendly_id?
    new_record? || slug.blank?
  end

end
