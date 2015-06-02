function himmelblau_test ( )

%*****************************************************************************80
%
%% HIMMELBLAU_TEST works with the Himmelblau function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    David Himmelblau,
%    Applied Nonlinear Programming,
%    McGraw Hill, 1972,
%    ISBN13: 978-0070289215,
%    LC: T57.8.H55.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HIMMELBLAU_TEST:\n' );
  fprintf ( 1, '  Test COORDINATE_SEARCH with the Himmelblau function.\n' );
  n = 2;

  x = [ 1.0, 1.0 ];
  r8vec_print ( n, x, '  Initial point X0:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X0) = %g\n', himmelblau ( x ) );

  flag = 0;
  x = coordinate_search ( x, @himmelblau, flag );
  r8vec_print ( n, x, '  Estimated minimizer X1:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X1) = %g\n', himmelblau ( x ) );

  x = [ -1.0, 1.0 ];
  r8vec_print ( n, x, '  Initial point X0:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X0) = %g\n', himmelblau ( x ) );

  flag = 0;
  x = coordinate_search ( x, @himmelblau, flag );
  r8vec_print ( n, x, '  Estimated minimizer X1:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X1) = %g\n', himmelblau ( x ) );

  x = [ -1.0, -1.0 ];
  r8vec_print ( n, x, '  Initial point X0:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X0) = %g\n', himmelblau ( x ) );

  flag = 0;
  x = coordinate_search ( x, @himmelblau, flag );
  r8vec_print ( n, x, '  Estimated minimizer X1:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X1) = %g\n', himmelblau ( x ) );

  x = [ 1.0, -1.0 ];
  r8vec_print ( n, x, '  Initial point X0:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X0) = %g\n', himmelblau ( x ) );

  flag = 0;
  x = coordinate_search ( x, @himmelblau, flag );
  r8vec_print ( n, x, '  Estimated minimizer X1:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X1) = %g\n', himmelblau ( x ) );
%
%  Demonstrate Himmelblau minimizers.
%
  x = [ 3.0, 2.0 ];
  r8vec_print ( n, x, '  Correct Himmelblau minimizer X1*:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X*) = %g\n', himmelblau ( x ) );

  x = [ 3.58439, -1.84813 ];
  r8vec_print ( n, x, '  Correct Himmelblau minimizer X2*:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X*) = %g\n', himmelblau ( x ) );

  x = [ -3.77934, -3.28317 ];
  r8vec_print ( n, x, '  Correct Himmelblau minimizer X3*:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X*) = %g\n', himmelblau ( x ) );

  x = [ -2.80512,  3.13134 ];
  r8vec_print ( n, x, '  Correct Himmelblau minimizer X4*:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X*) = %g\n', himmelblau ( x ) );

  return
end
