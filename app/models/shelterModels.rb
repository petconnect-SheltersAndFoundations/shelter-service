require_relative '../db/connect'

class Shelter
  def self.all
    DB.exec('SELECT * FROM shelters').map { |row| symbolize_keys(row) }
  end

  def self.create(data)
    DB.exec_params(
      'INSERT INTO shelters (name, location, email, phone, description) VALUES ($1, $2, $3, $4, $5) RETURNING *',
      [data['name'], data['location'], data['email'], data['phone'], data['description']]
    ).first
  end

  def self.update(id, data)
    DB.exec_params(
      'UPDATE shelters SET name=$1, location=$2, email=$3, phone=$4, description=$5 WHERE id=$6 RETURNING *',
      [data['name'], data['location'], data['email'], data['phone'], data['description'], id]
    ).first
  end

  def self.delete(id)
    DB.exec_params('DELETE FROM shelters WHERE id = $1', [id])
  end

  def self.symbolize_keys(hash)
    hash.transform_keys(&:to_sym)
  end
end
