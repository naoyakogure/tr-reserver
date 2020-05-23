class Member < ApplicationRecord
  belongs_to :reservation
  def self.multi_update(members_params)
    members_params.to_h.map do |id, member_param|
    member = self.find(id)
    member.update_attributes!(member_param)
    end
  end
end