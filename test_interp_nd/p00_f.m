function f = p00_f ( prob, m, c, w, n, x )

%*****************************************************************************80
%
%% P00_F returns the value of any function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 August 2012
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
%    Input, real C(M,1), W(M,1), the problem parameters.
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(M,N), the evalution points.
%
%    Output, real F(N,1), the function values.
%
  if ( prob == 1 )
    f = p01_f ( m, c, w, n, x );
  elseif ( prob == 2 )
    f = p02_f ( m, c, w, n, x );
  elseif ( prob == 3 )
    f = p03_f ( m, c, w, n, x );
  elseif ( prob == 4 )
    f = p04_f ( m, c, w, n, x );
  elseif ( prob == 5 )
    f = p05_f ( m, c, w, n, x );
  elseif ( prob == 6 )
    f = p06_f ( m, c, w, n, x );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_F - Fatal error!\n' );
    fprintf ( 1, '  Illegal function index PROB = %d\n', prob );
    error ( 'P00_F - Fatal error!' );
  end
%
%  WHAT DO I HAVE TO DO TO FORCE MATLAB TO USE FERFLICKENER COLUMN VECTORS?
%  THIS WOULD DRIVE AN APOSTLE NUTS!
%
  f = reshape ( f, n, 1 );

  return
end
