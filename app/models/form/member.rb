class Form::Member < Member
  REGISTRABLE_ATTRIBUTES = %i(register name leader reservation_id)
  attr_accessor :register
end