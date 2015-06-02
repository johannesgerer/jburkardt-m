function pyramid_integrals_test02 ( )

%*****************************************************************************80
%
%% PYRAMID_INTEGRALS_TEST02 examines the sample points in the pyramid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2014
%
%  Author:
%
%    John Burkardt
%
  m = 3;
  n = 20;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PYRAMID_INTEGRALS_TEST02\n' );
  fprintf ( 1, '  Print sample points in the unit pyramid in 3D.\n' );
  seed = 123456789;
  [ x, seed ] = pyramid01_sample ( n, seed );
  r8mat_transpose_print ( 3, n, x, '  Unit pyramid points' );

  return
end

