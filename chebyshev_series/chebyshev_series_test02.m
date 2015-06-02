function chebyshev_series_test02 ( )

%*****************************************************************************80
%
%% CHEBYSHEV_SERIES_TEST02 considers an even Chebyshev series for COS(PI*X/2).
%
%  Discussion:
%
%    TABLE1 contains the even Chebyshev series coefficients for
%    cos(pi*x/2) over [-1,+1].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 April 2014
%
%  Author:
%
%    Manfred Zimmer
%
%  Reference:
%
%    Charles Clenshaw,
%    Mathematical Tables, Volume 5,
%    Chebyshev series for mathematical functions,
%    London, 1962.
%
  nc = 11;

  table1 = [ ...
    +0.94400243153646953490, ...
    -0.49940325827040708740, ...
    +0.02799207961754761751, ...
    -0.00059669519654884650, ...
    +0.00000670439486991684, ...
    -0.00000004653229589732, ...
    +0.00000000021934576590, ...
    -0.00000000000074816487, ...
    +0.00000000000000193230, ...
    -0.00000000000000000391, ...
    +0.00000000000000000001 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHEBYSHEV_SERIES_TEST02:\n' );
  fprintf ( 1, '  EVENCHEBSER2 computes an even Chebyshev series\n' );
  fprintf ( 1, '  and its first two derivatives.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Errors of an even Chebyshev series for cos(pi*x/2):\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    x        err(y)       err(y'')       err(y")\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 10
    x = i / 10.0;
    [ s, s1, s2 ] = evenchebser2 ( x, table1, nc );
    y = cos ( 0.5 * pi * x );
    y1 = - 0.5 * pi * sin ( 0.5 * pi * x );
    y2 = - 0.25 * pi * pi * cos ( 0.5 * pi * x );
    s = s - y;
    s1 = s1 - y1;
    s2 = s2 - y2;
    fprintf ( 1, '%7.4f  %14.6g  %14.6g  %14.6g\n', x, s, s1, s2 );
  end

  return
end
