function n = p00_n ( prob )

%*****************************************************************************80
%
%% P00_N returns the number of variables N for any least squares problem.
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
%    Output, integer N, the number of variables.
%
  if ( prob == 1 )
    n = p01_n ( );
  elseif ( prob == 2 )
    n = p02_n ( );
  elseif ( prob == 3 )
    n = p03_n ( );
  elseif ( prob == 4 )
    n = p04_n ( );
  elseif ( prob == 5 )
    n = p05_n ( );
  elseif ( prob == 6 )
    n = p06_n ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_N - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of PROB = %d\n', prob );
    error ( 'P00_N - Fatal error!' );
  end

  return
end
