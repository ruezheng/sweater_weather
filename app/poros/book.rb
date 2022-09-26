class Book
  attr_reader :title,
              :isbn,
              :publisher

  def initialize(data)
    @title = data[:title]
    @isbn = data[:isbn]
    @publisher = data[:publisher]
  end 
end