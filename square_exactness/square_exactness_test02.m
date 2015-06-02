function square_exactness_test02 ( )

%*****************************************************************************80
%
%% SQUARE_EXACTNESS_TEST02 tests Padua rules for the Legendre 2D integral.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 May 2014
%
%  Author:
%
%    John Burkardt
%
  a(1:2) = -1.0;
  b(1:2) = +1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SQUARE_EXACTNESS_TEST02\n' );
  fprintf ( 1, '  Padua rule for the 2D Legendre integral.\n' );
  fprintf ( 1, '  Density function rho(x) = 1.\n' );
  fprintf ( 1, '  Region: -1 <= x <= +1.\n' );
  fprintf ( 1, '  Region: -1 <= y <= +1.\n' );
  fprintf ( 1, '  Level: L\n' );
  fprintf ( 1, '  Exactness: L+1 when L is 0,\n' );
  fprintf ( 1, '             L   otherwise.\n' );
  fprintf ( 1, '  Order: N = (L+1)*(L+2)/2\n' );

  for l = 0 : 5

    n = ( ( l + 1 ) * ( l + 2 ) ) / 2;

    [ x, y ] = padua_point_set ( l );
    w = padua_weight_set ( l );
 
    if ( l == 0 )
      p_max = l + 2;
    else
      p_max = l + 1;
    end

    legendre_2d_exactness ( a, b, n, x, y, w, p_max );

  end

  return
end
