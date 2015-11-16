class Group < ActiveRecord::Base
  include FriendlyId
  belongs_to :group_type
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
