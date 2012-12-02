function test09 ( dim_num, n, z )

%*****************************************************************************80
%
%% TEST09 tests SPHERE_MEASURE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 November 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST09\n' );
  fprintf ( 1, '  SPHERE_MEASURE computes the SPHERE measure of quality.\n' );
  fprintf ( 1, '  Nonintersecting sphere volume    S = %14f\n', ...
    sphere_measure ( dim_num, n, z ) );

  return
end
