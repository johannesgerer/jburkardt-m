function test03 ( dim_num, n, z, ns, sample_routine, seed_init )

%*****************************************************************************80
%
%% TEST03 tests D_MEASURE.
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
  fprintf ( 1, 'TEST03\n' );
  fprintf ( 1, '  E_MEASURE computes the D measure of quality.\n' );
  fprintf ( 1, '  The Voronoi energy measure       E = %14f\n', ...
    e_measure ( dim_num, n, z, ns, sample_routine, seed_init ) );

  return
end
