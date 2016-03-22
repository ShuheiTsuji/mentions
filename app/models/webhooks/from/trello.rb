class Webhooks::From::Trello < Webhooks::From::Base
  PATTERNS = %w()

  def comment
    @payload.dig('action', 'data', 'text')
  end

  def url
    "https://trello.com/c/#{@payload.dig('action', 'data', 'card', 'shortLink')}"
  end

  def mentions
    return [] unless @payload.dig('action', 'type') =~ /\AcommentCard\z/
    super
  end
end
