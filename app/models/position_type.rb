class PositionType < ActiveRecord::Base
  auditable
  include FriendlyId
  # slug
  friendly_id :title, :use => %i[slugged finders]

  default_scope { order('title ASC') }

  def slug_candidates
    %i[
      title
      title id
    ]
  end

  def should_generate_new_friendly_id?
    new_record? || slug.blank?
  end

end
