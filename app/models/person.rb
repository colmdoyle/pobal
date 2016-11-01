class Person < ActiveRecord::Base
  auditable
  
  include FriendlyId
  nilify_blanks
  has_many :groups, through: :memberships, dependent: :destroy
  has_many :bodies, through: :positions, dependent: :destroy
  has_many :memberships
  has_many :positions
  has_one :current_position, -> { self.joins(:constituency).where(end_date: nil).where.not(constituency: nil).order('start_date ASC') }, class_name: "Position"

  default_scope { order('last_name ASC') }

  has_attached_file :avatar, styles: { large: "600x600#", medium: "300x300#", small: "175x175#", thumb: "100x100#" }, default_url: :set_picture_per_gender
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
    if current_party
      "#{first_name} #{last_name} (#{current_party.name})"
    else
      "#{first_name} #{last_name}"
    end
  end

  def fullname
    "#{first_name} #{last_name}"
  end

  def facebook_url
    "https://facebook.com/#{facebook}"
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

  def current_constituency
    if current_position
      current_position.constituency
    end
  end

  def should_generate_new_friendly_id?
    new_record? || slug.blank?
  end

  def set_picture_per_gender
    if self.gender == 'male'
      "https://#{ENV['AWS_S3_HOSTNAME']}/#{ENV['S3_BUCKET_NAME']}/default/male.png"
    else
      "https://#{ENV['AWS_S3_HOSTNAME']}/#{ENV['S3_BUCKET_NAME']}/default/female.png"
    end
  end

end
