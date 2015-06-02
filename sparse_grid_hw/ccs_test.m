function ccs_test ( )

%*****************************************************************************80
%
%% CCS_TEST uses CCS_ORDER + CC for 1D quadrature over [0,1].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 February 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CCS_TEST:\n' );
  fprintf ( 1, '  CCS_ORDER + CC:\n' );
  fprintf ( 1, '  Clenshaw Curtis Slow quadrature over [0,1]:\n' );
  fprintf ( 1, '  Exact integral is %16.8g\n', exact );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   Level   Nodes    Estimate  Error\n' );
  fprintf ( 1, '\n' );

  d = 1;
  exact = legendre_integral ( d );

  for l = 1 : 10

    n = ccs_order ( l );

    [ x, w ] = cc ( n );

    fx = legendre_integrand ( d, n, x );
    q = w' * fx;
    e = sqrt ( ( q - exact ).^2 ) / exact;

    fprintf ( 1, '  %2d     %6d  %10.5g  %10.5g\n', l, n, q, e )

  end

  return
end
