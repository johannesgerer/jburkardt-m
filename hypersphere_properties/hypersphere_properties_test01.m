function hypersphere_properties_test01 ( )

%*****************************************************************************80
%
%% HYPERSPHERE_PROPERTIES_TEST01 tests the coordinate conversion routines.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 December 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HYPERSPHERE_PROPERTIES_TEST01\n' );
  fprintf ( 1, '  Test the coordinate conversion routines:\n' );
  fprintf ( 1, '  CARTESIAN_TO_HYPERSPHERE: X       -> R,Theta\n' );
  fprintf ( 1, '  HYPERSPHERE_TO_CARTESIAN: R,Theta -> X.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Pick a random X, and compute X2 by converting X\n' );
  fprintf ( 1, '  to hypersphere and back.  Consider norm of difference.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  M    || X - X2 ||\n' );
  seed = 123456789;
  n = 1;
  for m = 1 : 5 
    fprintf ( 1, '\n' );
    for test = 1 : 5
      [ x, seed ] = r8mat_uniform_01 ( m, n, seed );
      [ c, seed ] = r8vec_uniform_01 ( m, seed );
      [ r, theta ] = cartesian_to_hypersphere ( m, n, c, x );
      x2 = hypersphere_to_cartesian ( m, n, c, r, theta );
      err = norm ( x - x2 );
      fprintf ( 1, '  %d  %g\n', m, err );
    end
  end

  return
end
