function test07 ( dim_num, n, z, ns, sample_routine, seed_init )

%*****************************************************************************80
%
%% TEST07 tests MU_MEASURE.
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
  fprintf ( 1, 'TEST07\n' );
  fprintf ( 1, '  MU_MEASURE computes the MU measure of quality.\n' );
  fprintf ( 1, '  The point distribution ratio    Mu = %14f\n', ...
    mu_measure ( dim_num, n, z, ns, sample_routine, seed_init ) );

  return
end
