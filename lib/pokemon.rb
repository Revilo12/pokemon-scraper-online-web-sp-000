class Pokemon
  attr_accessor :name, :type
  attr_reader :id, :db

  def initialize(id = nil, name, type, db = DB[:conn])
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name:, type:, db:)
    sql = <<-SQL
        INSERT INTO pokemon (name, type) VALUES (?, ?)
    SQL

    db.execute(sql, name, type)
  end
  #
  # def self.find(id:, db: DB[:conn])
  #   sql = <<-SQL
  #       SELECT * FROM pokemon
  #       WHERE pokemon.id = ?
  #       LIMIT 1
  #   SQL
  #
  #   row  = db.execute(sql, id)
  #
  #   self.new(row[0], row[1], row[2], db)
  # end

end
