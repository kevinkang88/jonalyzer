class LyricsController < ApplicationController
  def new_search
  end

  def find_by_title
    title = params['q']
    @songs = RapGenius.search_by_title(title)
    respond_to do |format|
      format.json { render :json => @songs }
    end    
  end

  def analyze
    song_id = params['id']
    song = RapGenius::Song.find(song_id)
    @counter = {'yeah'=>0,'ok'=>0,'what'=>0}

    song.lines.each do |line|
      words = line.lyric.downcase.split(/[^a-zA-Z]/)
      words.each do |word|
        case word
        when 'yeah'
          @counter['yeah'] += 1
        when 'ok'
          @counter['ok'] += 1
        when 'what'
          @counter['what'] += 1
        end
      end
    end

    respond_to do |format|
      format.json { render :json => @counter }
    end 
  end

end