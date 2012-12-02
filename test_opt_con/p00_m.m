function m = p00_m ( problem )

%*****************************************************************************80
%
%% P00_M returns the spatial dimension for a problem specified by index.
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
%    Output, integer M, the spatial dimension.
%
  if ( problem == 1 )
    m = p01_m ( );
  elseif ( problem == 2 )
    m = p02_m ( );
  elseif ( problem == 3 )
    m = p03_m ( );
  elseif ( problem == 4 )
    m = p04_m ( );
  elseif ( problem == 5 )
    m = p05_m ( );
  elseif ( problem == 6 )
    m = p06_m ( );
  elseif ( problem == 7 )
    m = p07_m ( );
  elseif ( problem == 8 )
    m = p08_m ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_M - Fatal error!\n' );
    fprintf ( 1, '  Problem index out of bounds.\n' );
    error ( 'P00_M - Fatal error!' );
  end

  return
end
