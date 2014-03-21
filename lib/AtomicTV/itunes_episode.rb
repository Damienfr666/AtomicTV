require 'itunes'

module AtomicTV
  class ItunesEpisode

    class UnknownSeries < ::AtomicTV::AtomicTVError
      def initialize(series_name)
        @series_name = series_name
      end

      attr_reader :series_name

      def human_message
        "ITunes: Unknown TV series: '#{series_name}'"
      end
    end

    class UnknownEpisode < ::AtomicTV::AtomicTVError
      def initialize(series_name, season_number, episode_number)
        @episode_id = "#{series_name} - S#{season_number.to_s.rjust(2, '0')}E#{episode_number.to_s.rjust(2, '0')}"
      end

      attr_reader :episode_id

      def human_message
        "ITunes: Unknown episode: #{episode_id}"
      end
    end

    def self.episode_for(filename)
      parser = FilenameParser.parse(filename)
      season_name = "#{parser.series_name}, Season #{parser.season_number}"
      search_results = client.tv_show(season_name).results.
        select{|s|s.artist_name == parser.series_name && s.collection_name == season_name}

      raise UnknownSeries.new(parser.series_name) if search_results.empty?

      possible_episodes = search_results.select{|s|s.track_number == parser.episode_number}
      raise UnknownEpisode.new(parser.series_name, parser.season_number, parser.episode_number) if possible_episodes.size != 1
      possible_episodes.first
    end

    private

    def self.client
      @client ||= ITunes::Client.new
    end

  end
end

