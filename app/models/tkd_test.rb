class TkdTest < ActiveRecord::Base
    belongs_to :student
  
  def after_initialize
    if @date == nil then
      @date = Date.today
    end
  end
end
