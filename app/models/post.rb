class Post < ActiveRecord::Base
  include Renderer


  after_create :reindex!
  after_update :reindex!


  has_and_belongs_to_many :tags

  before_save :render_body

  DISQUS_SHORTNAME = Rails.env == 'development' ? 'demitriydn'.freeze : 'rails-junior'.freeze

  enum status: {
    verification: 0,
    approved: 1
  }

  # scope :by_date, -> { order('created_at DESC') }
  # scope :available_for, -> (user) { user ? by_date : where(status: 1).by_date }
  # scope :get_first, ->(id) { where('id= ?', id.to_i).first }
  scope :limit_rand, ->(num) { limit(num).order('RANDOM()') }
  scope :get_last_availible_id, -> { where(status: 1).last.id }

  searchable do
    text :title, :boost => 2
    text :body
    text :tags do
      tags.map(&:name)
    end
    time :created_at
  end

  # def self.with_search query
  #   if query
  #     includes(:tags).where("tags.name ILIKE :query OR title ILIKE :query", { query: "%#{query}%" }).references(:tags)
  #   else
  #     all
  #   end
  # end

  def self.reject_blank param
    param[:tag_ids] = param[:tag_ids].reject(&:empty?)
    param
  end

  def update_state state
    if state == 'true'
      self.approved!
    else
      self.verification!
    end
  end

  def to_param
    "#{id}-#{title}".parameterize
  end


  private
  def reindex!
    Sunspot.index!(self)
  end
end
