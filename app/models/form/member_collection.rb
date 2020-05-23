class Form::MemberCollection < Form::Base
  DEFAULT_ITEM_COUNT = 5
  attr_accessor :members

  def initialize(attributes = {})
    super attributes
    self.members = DEFAULT_ITEM_COUNT.times.map { Form::Member.new } unless members.present?
  end

  def members_attributes=(attributes)
    self.members = attributes.map do |_, member_attributes|
      Form::Member.new(member_attributes)
    end
  end

  def valid?
    valid_members = target_members.map(&:valid?).all?
    super && valid_members
  end

  def save
    return false unless valid?
    Member.transaction { target_members.each(&:save!) }
    true
  end

  def target_members
    self.members.select
  end
end