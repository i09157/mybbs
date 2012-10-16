#encoding: utf-8
module ApplicationHelper
	def simple_time(time)
    time.strftime("%Y年%m月%d日 %H:%M:%S")
  end
end
