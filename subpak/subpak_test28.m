function subpak_test28 ( )

%*****************************************************************************80
%
% TEST28 tests RAND.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 1000;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST28\n' );
  fprintf ( 1, '  RAND(''STATE'',J) sets the random seed to its Jth value.\n' );
  fprintf ( 1, '  RAND(M,N) is a MATLAB routine which returns an M by N\n' );
  fprintf ( 1, '  array of pseudorandom values between 0 and 1.\n' );

  seed = 123456789;
  rand ( 'state', seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Set RAND to its seed state number %d\n', seed );

  x = rand ( n, 1 );

  mean = r8vec_mean ( n, x );

  variance = r8vec_variance ( n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of values computed was N = %d\n', n );
  fprintf ( 1, '  Average value was %f\n', mean );
  fprintf ( 1, '  Variance was %f\n', variance );

  return
end
