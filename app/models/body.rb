class Body < ActiveRecord::Base
  include FriendlyId
  has_many :positions
  belongs_to :body_type

  has_attached_file :avatar, styles: { large: "600x600#", medium: "300x300#", small: "175x175#", thumb: "100x100#" }, default_url: "https://#{ENV['AWS_S3_HOSTNAME']}/#{ENV['S3_BUCKET_NAME']}/default/avatar_placeholder.jpg"
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

end
