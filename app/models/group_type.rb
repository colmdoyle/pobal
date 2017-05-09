class GroupType < ActiveRecord::Base
  auditable
  include FriendlyId
  # slug
  friendly_id :name, :use => %i[slugged finders]

  has_many :groups, dependent: :destroy

  default_scope { order('name ASC') }

  def slug_candidates
    %i[
      name
      name id
    ]
  end

  def should_generate_new_friendly_id?
    new_record? || slug.blank?
  end

end
