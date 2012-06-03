class Query < ActiveRecord::Base
  
  attr_accessible :from_user, :language, :q

  validates_presence_of :q, if: Proc.new { |query| query.from_user.blank? && query.language.blank? }
  validates_presence_of :from_user, if: Proc.new { |query| query.q.blank? && query.language.blank? }
  validates_presence_of :language, if: Proc.new { |query| query.q.blank? && query.from_user.blank? }

  # Search Twitter API
  def results
    Twitter.search q + (from_user.present? ? " from:#{from_user}" : ''), lang: language
  end
  
  def self.existing_or_new(params = {})
    results = where('')
    params.each_pair do |key, value|
      if value.blank?
        results = results.where("QUERIES.? is null", key)
      else
        results = results.where("QUERIES.?=?", key, value)
      end
    end
    return new(params) if results.first.blank?
    results.first
  end
end


# == Schema Information
#
# Table name: queries
#
#  id         :integer         not null, primary key
#  from_user  :string(255)
#  language   :string(255)
#  q          :string(255)
#  created_at :datetime
#  updated_at :datetime
#

