class Pokemon
  attr_accessor :name, :type
  attr_reader :id, :db

  def initialize(:id = nil, :name, :type, :db = DB[:conn])
    @id = :id 
    @name = :name 
    @type = :type 
    @db = :db 
  end

  def self.save(:name, :type, :db)
    if self.id
      self.update
    else
      sql = <<-SQL 
          INSERT INTO pokemon (name, type) VALUES (?, ?)
      SQL

      :db.execute(sql, :name, :type)
    end
    
end
