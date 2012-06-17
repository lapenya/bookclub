class Video < ActiveRecord::Base
  before_create :extract_guid

  def extract_guid
    uri = URI.parse(self.url)
    query = Rack::Utils.parse_query(uri.query)
    self.guid = query['v'] || uri.path.match(/\/v\/([-_A-Z0-9]+)/i)[1]
  end
end
