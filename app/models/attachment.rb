class Attachment < ApplicationRecord
	def self.archive(path, file)
		File.open("#{path}/#{file.original_filename}", "wb") {|f| f.write(file.read)}
	end
end
