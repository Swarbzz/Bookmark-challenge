require 'pg'
require_relative 'database_connection'

class Bookmarks

  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookmarks;")
    result.map do |bookmark|
      Bookmarks.new(
        url: bookmark['url'], 
        title: bookmark['title'], 
        id: bookmark['id']
      )
    end
  end

    def self.create(url:, title:)
      result = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES('#{url}','#{title}') RETURNING id, title, url;")
      Bookmarks.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url']) 
    end

    def self.delete(id:)
      DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{id}")
    end

    def self.update(id:, title:, url:)
      result = DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = #{id} RETURNING id, url, title;")
      Bookmarks.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
    end

    def self.find(id:)
      result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id}")
      Bookmarks.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
    end

    attr_reader :id, :title, :url

    def initialize(id:, title:, url:)
      @id = id
      @title = title
      @url = url
    end
end
