function test02 ( dim_num, n, z, ns, sample_routine, seed_init )

%*****************************************************************************80
%
%% TEST02 tests D_MEASURE.
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
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  D_MEASURE computes the D measure of quality.\n' );
  fprintf ( 1, '  2nd moment determinant measure   D = %14f\n', ...
    d_measure ( dim_num, n, z, ns, sample_routine, seed_init ) );

  return
end
