class Body < ActiveRecord::Base
  include FriendlyId
  has_many :positions
  belongs_to :body_type

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

end
