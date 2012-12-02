function prob_test148 ( )

%*****************************************************************************80
%
%% TEST148 tests UNIFORM_NSPHERE_SAMPLE;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  n = 3;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST148\n' );
  fprintf ( 1, '  For the Uniform PDF on the N-Sphere:\n' );
  fprintf ( 1, '  UNIFORM_NSPHERE_SAMPLE samples.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Dimension N of sphere =       %6d\n', n );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Points on the sphere:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ x, seed ] = uniform_nsphere_sample ( n, seed );
    fprintf ( 1, '  %6d  %14f  %14f  %14f\n', i, x(1:n) );
  end

  return
end
