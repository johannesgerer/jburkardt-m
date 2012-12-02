function test01 ( dim_num, n, z, ns, sample_routine, seed_init )

%*****************************************************************************80
%
%% TEST01 tests CHI_MEASURE.
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
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  CHI_MEASURE computes the CHI measure of quality.\n' );
  fprintf ( 1, '  The regularity measure         Chi = %14f\n', ...
    chi_measure ( dim_num, n, z, ns, sample_routine, seed_init ) );

  return
end
