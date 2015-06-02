function r8_to_r8_discrete_test ( )

%*****************************************************************************80
%
%% R8_TO_R8_DISCRETE_TEST tests R8_TO_R8_DISCRETE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  ndx = 19;
  rhi = 10.0;
  rlo = 1.0;
  test_num = 15;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_TO_R8_DISCRETE_TEST\n' );
  fprintf ( 1, '  R8_TO_R8_DISCRETE maps numbers to a discrete set\n' );
  fprintf ( 1, '  of equally spaced numbers in an interval.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of discrete values = %d\n', ndx );
  fprintf ( 1, '  Real interval: [%f, %f]\n', rlo, rhi );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  R   RD\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  rlo2 = rlo - 2.0;
  rhi2 = rhi + 2.0;

  for test = 1 : test_num
    [ r, seed ] = r8_uniform_ab ( rlo2, rhi2, seed );
    rd = r8_to_r8_discrete ( r, rlo, rhi, ndx );
    fprintf ( 1, '  %14f  %14f\n', r, rd );
  end

  return
end
