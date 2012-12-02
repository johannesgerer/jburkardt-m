function ccu_test ( )

%*****************************************************************************80
%
%% CCU_TEST uses the CCU function for 1D quadrature over [0,1].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 September 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CCU_TEST:\n' );
  fprintf ( 1, '  Clenshaw Curtis quadrature over [0,1]:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   Level   Nodes    Estimate  Error\n' );
  fprintf ( 1, '\n' );

  d = 1;
  exact = fu_integral ( d );

  for l = 1 : 10

    [ x, w ] = ccu ( l );
    n = length ( w );
    fx = fu_value ( d, n, x );
    q = w' * fx;
    e = sqrt ( ( q - exact ).^2 ) / exact;

    fprintf( '  %2d     %6d  %10.5g  %10.5g\n', l, n, q, e )

  end

  return
end
