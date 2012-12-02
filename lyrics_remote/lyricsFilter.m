function output = lyricsFilter ( y )

%% LYRICSFILTER filters out lyrics from a music clip
%
%    OUTPUT = LYRICSFILTER(Y) Given a signal Y, this function will filter
%    out the lyrics by subtracting the two channels and adding back in the
%    bass.
%
%    Example:
%    [tune, fs] = wavread('mjam.wav');
%    sound(tune, fs)
%    tune_filt = lyricsFilter(tune);
%    sound(tune_filt, fs)

%
%  Begin by subtracting the two channels
%
  removed_lyrics = diff ( y, 1, 2 );
%
%  Filter out the bass from the original
%
  sigsum = mean ( y, 2 );

  load bass_filter.mat

  bass = filterSimple ( sigsum, sosMatrix, scaleValues );
%
%  Return the output with lyrics removed
%
  output = removed_lyrics + bass;

  return
end
