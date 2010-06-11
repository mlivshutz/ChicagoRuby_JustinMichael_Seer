require 'ostruct'

class HomeController < ApplicationController

  def index
  end

  def area_chart
    @data = Widget.all
    @series = @data.map{|w| w.widget_stats}
  end
  
  def bar_chart
    @widgets = Widget.all
  end
  
  def column_chart
    @widgets = Widget.all
  end
  
  def gauge
    @data = Widget.all
  end
  
  def line_chart
    @data = Widget.all
    @series = @data.map{|w| w.widget_stats}
  end
  
  def pie_chart
    @data = Widget.all
  end

  def crime_chart

    
    @data = Crimes.all
    crimes = Crime.all
    kinds = Hash.new(0)
    crimes.each do |c|
      kinds[c.crime_type_id] += 1
    end
    oskinds = []
    kinds.map do |k,v|
      oskinds << OpenStruct.new(:id => k, :count => v)
    end

    p oskinds  



#    @data = []
#    (1..5).each {  |idx|
#      @data << OpenStruct.new(:name => idx.to_s, :quantity => idx*5)
#    }
  end


end
