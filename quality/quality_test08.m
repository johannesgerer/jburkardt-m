function test08 ( dim_num, n, z, ns, sample_routine, seed_init )

%*****************************************************************************80
%
%% TEST08 tests NU_MEASURE.
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
  fprintf ( 1, 'TEST08\n' );
  fprintf ( 1, '  NU_MEASURE computes the NU measure of quality.\n' );
  fprintf ( 1, '  The cell volume deviation       Nu = %14f\n', ...
    nu_measure ( dim_num, n, z, ns, sample_routine, seed_init ) );

  return
end
