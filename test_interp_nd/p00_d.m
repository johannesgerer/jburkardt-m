function d = p00_d ( prob, m, id, c, w, n, x )

%*****************************************************************************80
%
%% P00_D returns a derivative component of any function.
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
%    Input, integer ID, the spatial coordinate to be differentiated.
%
%    Input, real C(M), W(M), the problem parameters.
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(M,N), the evalution points.
%
%    Output, real D(N,1), the value of the ID-th derivative component at X.
%
  if ( id < 0 || m < id )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_D - Fatal error!\n' );
    fprintf ( 1, '  Illegal spatial coordinate ID = %d\n', id );
    error ( 'P00_D - Fatal error!' );
  end

  if ( prob == 1 )
    d = p01_d ( m, id, c, w, n, x );
  elseif ( prob == 2 )
    d = p02_d ( m, id, c, w, n, x );
  elseif ( prob == 3 )
    d = p03_d ( m, id, c, w, n, x );
  elseif ( prob == 4 )
    d = p04_d ( m, id, c, w, n, x );
  elseif ( prob == 5 )
    d = p05_d ( m, id, c, w, n, x );
  elseif ( prob == 6 )
    d = p06_d ( m, id, c, w, n, x );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_D - Fatal error!\n' );
    fprintf ( 1, '  Illegal function index PROB = %d\n', prob );
    error ( 'P00_D - Fatal error!' );
  end

  return
end
