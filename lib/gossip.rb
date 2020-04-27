require 'csv'
require 'pry'

class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end


  def save
    CSV.open("gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    
    CSV.read("gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips 

  end

  def self.find(id)
    id = id.to_i
    all_gossips = []
    CSV.read("gossip.csv").each do |csv_line|
        all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips[id]
  end

  # def self.update(delete_index)

  #   table = CSV.open("gossip.csv", 'w')

  #   table.delete_if do |row|
  #     row[delete_index] == true
  #   end
  # end



end

