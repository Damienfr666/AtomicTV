module AtomicTV
  class ItunesEpisodeMetadata

    ArtworkBaseURL = "http://thetvdb.com/banners/"

    def initialize(episode)
      @episode = episode
    end

    attr_reader :episode

    def media_type
      'TV Show'
    end

    def artist
      episode.artist_name
    end

    def title
      episode.name
    end

    def album
      episode.collection_name
    end

    def genre
      episode.primary_genre_name
    end

    def description
      episode.short_description
    end

    def long_description
      episode.long_description
    end

    def tv_network
      ''
    end

    def tv_show_name
      artist
    end

    def tv_episode
      "#{tv_season_number}#{tv_episode_number.to_s.rjust(2, '0')}"
    end

    def tv_season_number
      /Season ([0-9]*)/.match(episode.collection_name)[1].to_i
    end

    def tv_episode_number
      track_number
    end

    def track_number
      episode.track_number
    end

    def air_date
      episode.release_date
    end

    def actors
      []
    end

    def directors
      []
    end

    def writers
      []
    end

    attr_reader :posters

    def with_loaded_posters
      temporary_directory = Dir.mktmpdir

      url = episode.artwork_url100.gsub('100x100','300x300')
      file = File.new(File.join(temporary_directory, File.basename(url)), 'w')
      file.write(open(url).read)
      file.close

      @posters = [file]

      yield

    ensure
      FileUtils.rm_rf(temporary_directory)
      @posters = nil
    end

  end
end

