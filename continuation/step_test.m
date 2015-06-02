function step_test ( )

%*****************************************************************************80
%
%% STEP_TEST does a simple test of the STEP function.
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
%    07 April 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'STEP_TEST\n' );
  fprintf ( 1, '  Demonstrate the STEP function for continuation.\n' );

  n = 2;
  temp = - sqrt ( 3.0 ) / 2.0;
  x0 = [ 0.5; temp ];
  t0 = zeros ( n, 1 );
  p = 1;
  tol = 1.0E-05;

  r8vec_print ( n, x0, '  Starting X0:' );
  fx_norm = max ( abs ( f_circle ( n, x0 ) ) );
  fprintf ( 1, '  ||F(X0)|| = %g\n', fx_norm );

  h = 0.1;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Suggested stepsize H = %g\n', h );

  [ status, x2, t2, p2 ] = step ( n, x0, t0, p, @f_circle, @fp_circle, h, tol );

  if ( status ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  STEP failed.\n' );
  else
    r8vec_print ( n, x2, '  Solution X2:' );
    fx_norm = max ( abs ( f_circle ( n, x2 ) ) );
    fprintf ( 1, '  ||F(X)|| = %g\n', fx_norm );
  end

  return
end
