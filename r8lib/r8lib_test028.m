function subpak_test028 ( )

%*****************************************************************************80
%
%% TEST028 tests R8_UNIFORM_01
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 1000;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST028\n' );
  fprintf ( 1, '  R8_UNIFORM_01 samples a uniform random\n' );
  fprintf ( 1, '  distribution in [0,1].\n' );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Starting with seed = %d\n', seed );

  for i = 1 : n
    [ x(i), seed ] = r8_uniform_01 ( seed );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  First few values:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : 5
    fprintf ( 1, '  %6d  %14f\n', i, x(i) );
  end

  mean = r8vec_mean ( n, x );

  variance = r8vec_variance ( n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of values computed was N = %d\n', n );
  fprintf ( 1, '  Average value was %f\n', mean );
  fprintf ( 1, '  Minimum value was %f\n', min ( x(1:n) ) );
  fprintf ( 1, '  Maximum value was %f\n', max ( x(1:n) ) );
  fprintf ( 1, '  Variance was %f\n', variance );

  return
end
