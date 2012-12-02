function test05 ( dim_num, n, z, ns, sample_routine, seed_init )

%*****************************************************************************80
%
%% TEST05 tests H_MEASURE.
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
  fprintf ( 1, 'TEST05\n' );
  fprintf ( 1, '  H_MEASURE computes the H measure of quality.\n' );
  fprintf ( 1, '  The point distribution norm      H = %14f\n', ...
    h_measure ( dim_num, n, z, ns, sample_routine, seed_init ) );

  return
end
