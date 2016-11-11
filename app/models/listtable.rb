class Listtable < ActiveRecord::Base
  belongs_to :todolist
  enum situation: { uncheck: 0, check: 1 }
end
