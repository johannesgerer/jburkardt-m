function mxy = mountain ( n, x, y )

%*****************************************************************************80
%
%% MOUNTAIN enumerates the mountains.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 January 1999
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Donald Kreher, Douglas Simpson,
%    Combinatorial Algorithms,
%    CRC Press, 1998,
%    ISBN: 0-8493-3988-X,
%    LC: QA164.K73.
%
%  Parameters:
%
%    Input, integer N, ...
%    N must be positive.
%
%    Input, integer X, Y, ...
%    0 <= X <= 2 * N,
%
%    Output, integer MXY, the value of the "mountain function"
%    M ( N, X, Y ), which is the number of all mountain ranges from
%    (X,Y) to (2*N,0) which do not drop below sea level.
%

%
%  Check.
%
  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MOUNTAIN - Fatal error!\n' );
    fprintf ( 1, '  N <= 0.\n' );
    fprintf ( 1, '  N = %d\n', n );
    error ( 'MOUNTAIN - Fatal error!' );
  elseif ( x < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MOUNTAIN - Fatal error!\n' );
    fprintf ( 1, '  X < 0.\n' );
    fprintf ( 1, '  X = %d\n', x );
    error ( 'MOUNTAIN - Fatal error!' );
  elseif ( 2 * n < x )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MOUNTAIN - Fatal error!\n' );
    fprintf ( 1, '  2 * N < X.\n' );
    fprintf ( 1, '  X = %d\n', x );
    fprintf ( 1, '  N = %d\n', n );
    error ( 'MOUNTAIN - Fatal error!' );
  end
%
%  Special cases.
%
  if ( y < 0 )
    mxy = 0;
    return
  end

  if ( 2 * n < x + y )
    mxy = 0;
    return
  end

  if ( mod ( x + y, 2 ) == 1 )
    mxy = 0;
    return
  end

  a = 2 * n - x;
  b = n - floor ( ( x + y ) / 2 );
  c = n - 1 - floor ( ( x + y ) / 2 );

  mxy = i4_choose ( a, b ) - i4_choose ( a, c );

  return
end
