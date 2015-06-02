function kpu_test ( )

%*****************************************************************************80
%
%% KPU_TEST uses the KPU function for 1D quadrature over [0,1].
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
  d = 1;
  exact = legendre_integral ( d );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'KPU_TEST:\n' );
  fprintf ( 1, '  Kronrod-Patterson quadrature over [0,1]:\n' );
  fprintf ( 1, '  Exact integral is %16.8g\n', exact );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   Level   Nodes    Estimate  Error\n' );
  fprintf ( 1, '\n' );

  for l = 1 : 5

    n = kpu_order ( l );

    nh = floor ( ( n + 1 ) / 2 );

    [ xh, wh ] = kpu ( l );
 
    if ( mod ( n, 2 ) == 1 )
      x = [ 1-xh(nh:-1:2); xh ];
      w = [ wh(nh:-1:2); wh ];
    else
      x = [ 1-xh(nh:-1:1); xh ];
      w = [ wh(nh:-1:1); wh ];
    end

    fx = legendre_integrand ( d, n, x );
 
    q = w' * fx;
    e = sqrt ( ( q - exact ).^2 ) / exact;

    fprintf( '  %2d     %6d  %10.5g  %10.5g\n', l, n, q, e )

  end

  return
end
