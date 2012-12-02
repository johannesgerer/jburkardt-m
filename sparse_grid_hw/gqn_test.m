function gqn_test ( )

%*****************************************************************************80
%
%% GQN_TEST uses the GQN function for 1D quadrature over (-oo,+oo).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 May 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GQN_TEST:\n' );
  fprintf ( 1, '  Gauss-Hermite quadrature over (-oo,+oo):\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   Level   Nodes    Estimate  Error\n' );
  fprintf ( 1, '\n' );

  d = 1;
  exact = fn_integral ( d );

  for l = 1 : 5

    nh = floor ( ( l + 1 ) / 2 );
    [ xh, wh ] = gqn ( l );

    if ( mod ( l, 2 ) == 1 )
      n = 2 * nh - 1;
    else
      n = 2 * nh;
    end

    if ( mod ( l, 2 ) == 1 )
      x = [ -xh(nh:-1:2); xh ];
      w = [ wh(nh:-1:2); wh ];
    else
      x = [ -xh(nh:-1:1); xh ];
      w = [ wh(nh:-1:1); wh ];
    end

    fx = fn_value ( d, n, x );
    q = w' * fx;
    e = sqrt ( ( q - exact ).^2 ) / exact;

    fprintf( '  %2d     %6d  %10.5g  %10.5g\n', l, n, q, e )

  end

  return
end
