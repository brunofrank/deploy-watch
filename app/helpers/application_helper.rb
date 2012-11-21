# encoding: utf-8
module ApplicationHelper
  
  def week_day(wday)
    case wday
      when 0
        "Domingo"
      when 1
        "Segunda"        
      when 2
        "Terça"
      when 3
        "Quarta"
      when 4
        "Quinta"
      when 5
        "Sexta"
      when 6
        "Sábado"
    end                                        
  end
end
