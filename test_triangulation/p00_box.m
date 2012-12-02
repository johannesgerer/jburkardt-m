function [ lo, hi ] = p00_box ( test, m )

%*****************************************************************************80
%
%% P00_BOX returns a bounding box for a problem.
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
%    Output, real LO(M), HI(M), the lower and
%    upper corners of a bounding box.
%
  if ( test == 1 )
    [ lo, hi ] = p01_box ( m );
  elseif ( test == 2 )
    [ lo, hi ] = p02_box ( m );
  elseif ( test == 3 )
    [ lo, hi ] = p03_box ( m );
  elseif ( test == 4 )
    [ lo, hi ] = p04_box ( m );
  elseif ( test == 5 )
    [ lo, hi ] = p05_box ( m );
  elseif ( test == 6 )
    [ lo, hi ] = p06_box ( m );
  elseif ( test == 7 )
    [ lo, hi ] = p07_box ( m );
  elseif ( test == 8 )
    [ lo, hi ] = p08_box ( m );
  elseif ( test == 9 )
    [ lo, hi ] = p09_box ( m );
  elseif ( test == 10 )
    [ lo, hi ] = p10_box ( m );
  elseif ( test == 11 )
    [ lo, hi ] = p11_box ( m );
  elseif ( test == 12 )
    [ lo, hi ] = p12_box ( m );
  elseif ( test == 13 )
    [ lo, hi ] = p13_box ( m );
  elseif ( test == 14 )
    [ lo, hi ] = p14_box ( m );
  elseif ( test == 15 )
    [ lo, hi ] = p15_box ( m );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_BOX - Fatal error!\n' );
    fprintf ( 1, '  Input value of TEST is out of range.\n' );
    error ( 'P00_BOX - Fatal error!' );
  end

  return
end
