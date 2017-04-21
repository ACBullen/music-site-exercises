module TracksHelper

  def ugly_lyrics(lyrics)
    "♫ " + lyrics.split("\n").join("\n♫ ")
  end

end
