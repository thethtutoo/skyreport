class Report < ActiveRecord::Base

  validates(:name, :presence => true)
  validates(:description, :presence => true)
  validates(:reporter_name, :presence => true)
  def self.search(search)
    where("name iLIKE ?", "%#{search}%")
  end
end
