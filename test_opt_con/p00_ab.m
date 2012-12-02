function [ a, b ] = p00_ab ( problem, m )

%*****************************************************************************80
%
%% P00_AB returns bounds for a problem specified by index.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem index.
%
%    Input, integer M, the spatial dimension.
%
%    Output, real A(M,1), B(M,1), lower and upper bounds.
%
  if ( problem == 1 )
    [ a, b ] = p01_ab ( m );
  elseif ( problem == 2 )
    [ a, b ] = p02_ab ( m );
  elseif ( problem == 3 )
    [ a, b ] = p03_ab ( m );
  elseif ( problem == 4 )
    [ a, b ] = p04_ab ( m );
  elseif ( problem == 5 )
    [ a, b ] = p05_ab ( m );
  elseif ( problem == 6 )
    [ a, b ] = p06_ab ( m );
  elseif ( problem == 7 )
    [ a, b ] = p07_ab ( m );
  elseif ( problem == 8 )
    [ a, b ] = p08_ab ( m );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_AB - Fatal error!\n' );
    fprintf ( 1, '  Problem index out of bounds.\n' );
    error ( 'P00_AB - Fatal error!' );
  end

  return
end
