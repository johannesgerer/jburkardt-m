function test10 ( dim_num, n, z, ns, sample_routine, seed_init )

%*****************************************************************************80
%
%% TEST10 tests TAU_MEASURE.
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
  fprintf ( 1, 'TEST10\n' );
  fprintf ( 1, '  TAU_MEASURE computes the TAU measure of quality.\n' );
  fprintf ( 1, '  2nd moment trace measure       Tau = %14f\n', ...
    tau_measure ( dim_num, n, z, ns, sample_routine, seed_init ) );

  return
end
