function test_type ( )

%*****************************************************************************80
%
%% TEST_TYPE tests functions which test the type of a matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 July 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_TYPE\n' );
  fprintf ( 1, '  Demonstrate functions which test the type of a matrix.\n' );
%
%  TRANSITION.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Title                    M     N     ||A||            ||Transition Error||\n' );
  fprintf ( 1, '\n' );

  title = 'BODEWIG';
  m = 4;
  n = 4;
  a = bodewig ( );
  error_frobenius = r8mat_is_transition ( m, n, a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_frobenius, error_frobenius );

  title = 'SNAKES';
  m = 101;
  n = 101;
  a = snakes ( );
  error_frobenius = r8mat_is_transition ( m, n, a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_frobenius, error_frobenius );

  title = 'TRANSITION_RANDOM';
  m = 5;
  n = 5;
  key = 123456789;
  a = transition_random ( n, key );
  error_frobenius = r8mat_is_transition ( m, n, a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_frobenius, error_frobenius );

  return
end
