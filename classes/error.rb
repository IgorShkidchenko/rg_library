class LibraryError < StandardError
  def initialize(msg = "Invalid class or empty argument")
    super(msg)
  end
end
