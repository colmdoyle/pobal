class Group < ActiveRecord::Base
  include FriendlyId
  nilify_blanks
  belongs_to :group_type
  has_many :people, through: :memberships, dependent: :destroy
  has_many :memberships, dependent: :destroy

  has_attached_file :avatar, styles: { large: "600x600#", medium: "300x300#", small: "175x175#", thumb: "100x100#" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  # slug
  friendly_id :name, :use => [:slugged, :finders]

  default_scope { order('name ASC') }

  def slug_candidates
    [
      :name,
      :name, :id
    ]
  end

  def should_generate_new_friendly_id?
    new_record? || slug.blank?
  end

  def has_contact_details? # rubocop:disable Metrics/CyclomaticComplexity
    return true if phone_number || facebook || twitter || email || website || postal_address
  end

  def current_members
    memberships.where(end_date: nil).includes(:person).order('people.last_name')
  end

  def former_members
    memberships.where.not(end_date: nil).includes(:person).order('people.last_name')
  end

  def facebook_url
    "https://fb.me/#{facebook}"
  end

  def twitter_url
    "https://twitter.com/#{twitter}"
  end

  def name_initials
    initials = []
    words = name.split(' ')
    words.each do |word|
      initials << word.first
    end
    return initials.join('')
  end

end
