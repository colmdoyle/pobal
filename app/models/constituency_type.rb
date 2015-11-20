class ConstituencyType < ActiveRecord::Base
  include FriendlyId
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

end
