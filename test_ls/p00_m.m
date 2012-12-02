function m = p00_m ( prob )

%*****************************************************************************80
%
%% P00_M returns the number of equations M for any least squares problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROB, the problem index.
%
%    Output, integer M, the number of equations.
%
  if ( prob == 1 )
    m = p01_m ( );
  elseif ( prob == 2 )
    m = p02_m ( );
  elseif ( prob == 3 )
    m = p03_m ( );
  elseif ( prob == 4 )
    m = p04_m ( );
  elseif ( prob == 5 )
    m = p05_m ( );
  elseif ( prob == 6 )
    m = p06_m ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_M - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of PROB = %d\n', prob );
    error ( 'P00_M - Fatal error!' );
  end

  return
end
