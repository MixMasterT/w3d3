class ShortenedUrl < ActiveRecord::Base
  validates :short_url, :user_id, :long_url, presence: true
  validates :short_url, uniqueness: true

  def self.create_for_user_and_long_url(user, long_url)
    ShortenedUrl.create( user_id: user.id,
                      long_url: long_url,
                      short_url: self.random_code
                      )
  end

  def self.random_code
    while true
      code = SecureRandom.urlsafe_base64
      break unless exists?(short_url: code)
    end
    code
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    # visits.select(:user_id).distinct.count
    distinct_visitors.count #newer better version
  end

  def num_recent_uniques
    visits.select(:user_id).distinct.where("created_at > '#{1.hour.ago}'").count
  end

  belongs_to :submitter,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  has_many :visits,
    class_name: :Visit,
    primary_key: :id,
    foreign_key: :shortened_url_id

  has_many :visitors,
    through: :visits,
    source: :visitor

  has_many :distinct_visitors,
    -> { distinct },
    through: :visits,
    source: :visitor

end
