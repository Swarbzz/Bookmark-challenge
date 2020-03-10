require 'bookmarks'
require 'database_helpers'

describe Bookmarks do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      jim = Bookmarks.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmarks.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmarks.create(url: "http://www.google.com", title: "Google")

      bookmarks = Bookmarks.all

      p bookmarks

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmarks
      expect(bookmarks.first.id).to eq jim.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
     bookmarks = Bookmarks.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
     persisted_data = persisted_data(id: bookmarks.id)

     expect(bookmarks).to be_a Bookmarks
     expect(bookmarks.id).to eq persisted_data.first['id']
     expect(bookmarks.title).to eq 'Test Bookmark'
     expect(bookmarks.url).to eq 'http://www.testbookmark.com'
    end
  end

  describe '.delete' do
    it 'deletes the given bookmark' do
      bookmark = Bookmarks.create(title: 'Markers Academy', url: 'http://www.makersacademy.com')

      Bookmarks.delete(id: bookmark.id)

      expect(Bookmarks.all.length).to eq 0
    end
  end
end