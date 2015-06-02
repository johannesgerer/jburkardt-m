function local_test ( )

%*****************************************************************************80
%
%% LOCAL_TEST works with the Local function.
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
  fprintf ( 1, 'LOCAL_TEST:\n' );
  fprintf ( 1, '  Test COORDINATE_SEARCH with the Local function.\n' );
  n = 2;

  x = [ 1.0, 1.0 ];
  r8vec_print ( n, x, '  Initial point X0:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X0) = %g\n', local ( x ) );

  flag = 0;
  x = coordinate_search ( x, @local, flag );
  r8vec_print ( n, x, '  Estimated minimizer X1:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X1) = %g\n', local ( x ) );
%
%  Demonstrate local minimizer.
%
  x = [ 0.2858054412, 0.2793263206 ];
  r8vec_print ( n, x, '  Correct local minimizer X*:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X*) = %g\n', local ( x ) );
%
%  Try for global minimizer.
%
  x = [ -15.0, -35.0 ];
  r8vec_print ( n, x, '  Initial point X0:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X0) = %g\n', local ( x ) );

  flag = 0;
  x = coordinate_search ( x, @local, flag );
  r8vec_print ( n, x, '  Estimated minimizer X1:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X1) = %g\n', local ( x ) );
%
%  Demonstrate global minimizer.
%
  x = [ -21.02667179, -36.75997872 ];
  r8vec_print ( n, x, '  Correct global minimizer X*:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X*) = %g\n', local ( x ) );

  return
end
