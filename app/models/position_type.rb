class PositionType < ActiveRecord::Base
  include FriendlyId
  # slug
  friendly_id :title, :use => [:slugged, :finders]

  def slug_candidates
    [
      :title,
      :title, :id
    ]
  end

  def should_generate_new_friendly_id?
    new_record? || slug.blank?
  end

end
