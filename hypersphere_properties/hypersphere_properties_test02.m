function hypersphere_properties_test02 ( )

%*****************************************************************************80
%
%% HYPERSPHERE_PROPERTIES_TEST02 tests HYPERSPHERE_01_SURFACE_UNIFORM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 May 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HYPERSPHERE_PROPERTIES_TEST02\n' );
  fprintf ( 1, '  HYPERSPHERE_01_SURFACE_UNIFORM samples uniformly from the\n' );
  fprintf ( 1, '  surface of the unit hypersphere\n' );
  seed = 123456789;
  n = 1;
  for m = 1 : 5
    for test = 1 : 3
      [ x, seed ] = hypersphere_01_surface_uniform ( m, n, seed );
      r8vec_transpose_print ( m, x, '  Random hypersphere point:' );
    end
  end

  return
end
