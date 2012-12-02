function q = p00_q ( prob, m, c, w )

%*****************************************************************************80
%
%% P00_Q returns the integral of any function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    29 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROB, the index of the function.
%
%    Input, integer M, the spatial dimension.
%
%    Input, real C(M), W(M), the problem parameters.
%
%    Output, real Q, the integral.
%
  if ( prob == 1 )
    q = p01_q ( m, c, w );
  elseif ( prob == 2 )
    q = p02_q ( m, c, w );
  elseif ( prob == 3 )
    q = p03_q ( m, c, w );
  elseif ( prob == 4 )
    q = p04_q ( m, c, w );
  elseif ( prob == 5 )
    q = p05_q ( m, c, w );
  elseif ( prob == 6 )
    q = p06_q ( m, c, w );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_Q - Fatal error!\n' );
    fprintf ( 1, '  Illegal function index PROB = %d\n', prob );
    error ( 'P00_Q - Fatal error!' )
  end

  return
end
