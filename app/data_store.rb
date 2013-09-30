class DataStore
  def self.read_as_json(filename)
    BW::JSON.parse read(filename)
  end

  def self.read(filename)
    copy_to_documents(filename) if missing_from_documents?(filename)
    File.read documents_path(filename)
  end

  def self.documents_path(filename)
    "#{App.documents_path}/#{filename}"
  end

  def self.write(filename, contents)
    File.open(documents_path(filename), 'w') do |f|
      f.write contents
    end
  end

  def self.copy_to_documents(filename)
    contents = File.read("#{App.resources_path}/#{filename}")
    write(filename, contents)
  end

  def self.missing_from_documents?(filename)
    ! File.exists? documents_path(filename)
  end
end
