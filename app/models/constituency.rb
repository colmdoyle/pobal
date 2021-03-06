class Constituency < ActiveRecord::Base
  auditable
  include FriendlyId
  nilify_blanks
  default_scope { order('name ASC') }

  belongs_to :constituency_type
  # slug
  friendly_id :name, :use => %i[slugged finders]

  def slug_candidates
    %i[
      name
      name constituency_type
      name id
    ]
  end

  def should_generate_new_friendly_id?
    new_record? || slug.blank?
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
