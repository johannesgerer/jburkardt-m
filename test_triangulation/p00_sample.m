function [ point, seed ] = p00_sample ( test, m, n, seed )

%*****************************************************************************80
%
%% P00_SAMPLE samples points from the region in a problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TEST, the index of the test problem
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real POINT(M,N), the coordinates of the points.
%
%    Output, integer SEED, a seed for the random number generator.
%
  if ( test == 1 )
    [ point, seed ] = p01_sample ( m, n, seed );
  elseif ( test == 2 )
    [ point, seed ] = p02_sample ( m, n, seed );
  elseif ( test == 3 )
    [ point, seed ] = p03_sample ( m, n, seed );
  elseif ( test == 4 )
    [ point, seed ] = p04_sample ( m, n, seed );
  elseif ( test == 5 )
    [ point, seed ] = p05_sample ( m, n, seed );
  elseif ( test == 6 )
    [ point, seed ] = p06_sample ( m, n, seed );
  elseif ( test == 7 )
    [ point, seed ] = p07_sample ( m, n, seed );
  elseif ( test == 8 )
    [ point, seed ] = p08_sample ( m, n, seed );
  elseif ( test == 9 )
    [ point, seed ] = p09_sample ( m, n, seed );
  elseif ( test == 10 )
    [ point, seed ] = p10_sample ( m, n, seed );
  elseif ( test == 11 )
    [ point, seed ] = p11_sample ( m, n, seed );
  elseif ( test == 12 )
    [ point, seed ] = p12_sample ( m, n, seed );
  elseif ( test == 13 )
    [ point, seed ] = p13_sample ( m, n, seed );
  elseif ( test == 14 )
    [ point, seed ] = p14_sample ( m, n, seed );
  elseif ( test == 15 )
    [ point, seed ] = p15_sample ( m, n, seed );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_SAMPLE - Fatal error!\n' );
    fprintf ( 1, '  Input value of TEST is out of range.\n' );
    error ( 'P00_SAMPLE - Fatal error!' );
  end

  return
end
