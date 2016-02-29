class Body < ActiveRecord::Base
  include FriendlyId
  nilify_blanks
  has_many :people, through: :positions, dependent: :destroy
  has_many :positions, dependent: :destroy
  belongs_to :body_type

  has_attached_file :avatar, styles: { large: "600x600#", medium: "300x300#", small: "175x175#", thumb: "100x100#" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  default_scope { order('name ASC') }

  # slug
  friendly_id :name, :use => [:slugged, :finders]

  def slug_candidates
    [
      :name,
      :name, :id
    ]
  end

  def should_generate_new_friendly_id?
    new_record? || slug.blank?
  end

  def groups
    groups = []
    current_members.each do |member|
      groups << member.person.current_party
    end
    groups
  end

  def current_members
    positions.where(end_date: nil).includes(:person).order('people.last_name')
  end

  def former_members
    positions.where.not(end_date: nil).includes(:person).order('people.last_name')
  end

end
