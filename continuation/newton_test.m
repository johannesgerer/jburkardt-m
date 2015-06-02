function newton_test ( )

%*****************************************************************************80
%
%% NEWTON_TEST does a simple test of the NEWTON function.
%
%  Discussion:
%
%    We seek a solution of the implicit function that defines a circle,
%      X^2 + Y^2 = 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NEWTON_TEST\n' );
  fprintf ( 1, '  Demonstrate the NEWTON function for continuation.\n' );

  n = 2;
  x0 = [ 0.5; -2.0 ];
  p = 1;
  tol = 1.0E-05;

  r8vec_print ( n, x0, '  Starting X0:' );
  fx_norm = max ( abs ( f_circle ( n, x0 ) ) );
  fprintf ( 1, '  ||F(X0)|| = %g\n', fx_norm );

  [ status, x ] = newton ( n, x0, p, @f_circle, @fp_circle, tol );

  r8vec_print ( n, x, '  Solution X:' );
  fx_norm = max ( abs ( f_circle ( n, x ) ) );
  fprintf ( 1, '  ||F(X)|| = %g\n', fx_norm );

  return
end



