module AtomicTV
  class EpisodeMetadata < Hash
    include Hashie::Extensions::MethodAccess
    include Hashie::Extensions::MergeInitializer

    TVDBArtworkBaseURL = "http://thetvdb.com/banners/"

    def initialize(series, episode, itunes_episode)
      super({
        :series => series,
        :episode => episode,
        :itunes_episode => itunes_episode,
        :media_type => 'TV Show',
        :artist => series.name,
        :title => episode.name,
        :album => "#{series.name}, Season #{episode.season_number}",
        :genre => series.genres.first,
        :description => itunes_episode ? itunes_episode.short_description : episode.overview.to_s[0,255].gsub(/\.(.*)\Z/, '.'),
        :long_description => itunes_episode ? itunes_episode.long_description : episode.overview.to_s,
        :tv_network => series.network,
        :tv_show_name => series.name,
        :tv_episode => "#{episode.season_number}#{episode.number.to_s.rjust(2, '0')}",
        :tv_season_number => episode.season_number,
        :tv_episode_number => episode.number,
        :track_number => episode.number,
        :air_date => episode.air_date && episode.air_date.to_s + 'T00:00:00Z',
        :actors => (Array(series.actors).map {|a| a.name} + episode.guest_stars).uniq,
        :directors => parse_names(episode.director),
        :writers => parse_names(episode.writer),
        :artist_id => itunes_episode && itunes_episode.artist_id,
        :collection_id => itunes_episode && itunes_episode.collection_id,
        :track_id => itunes_episode && itunes_episode.track_id,
        :content_advisory_rating => itunes_episode && itunes_episode.content_advisory_rating,
        :track_is_clean => !itunes_episode || itunes_episode.track_explicitness == 'notExplicit'
      })
    end

    def with_loaded_posters
      temporary_directory = Dir.mktmpdir

      season_posters = []
      season_posters << itunes_episode.artwork_url100.gsub('.100x100-75','') if itunes_episode
      season_posters += series.season_posters(episode.season_number, 'en').map{|poster| TVDBArtworkBaseURL + poster.path }
      season_posters += series.posters('en').map{|poster| TVDBArtworkBaseURL + poster.path } if season_posters.empty?
      self.posters = season_posters.map do |url|
        file = File.new(File.join(temporary_directory, File.basename(url)), 'w')
        file.write(open(url).read)
        file.close
        file
      end

      yield

    ensure
      FileUtils.rm_rf(temporary_directory)
      @posters = nil
    end

    private

    def parse_names(str)
      return [] if str.nil?

      str.gsub!(/\A\|/, '')
      str.gsub!(/\|\Z/, '')
      str.split(/\|+/)
    end

  end
end
