class Professor < ActiveRecord::Base

 has_many :ratings, dependent: :destroy

  def name
    first + ' ' + last
  end


end
