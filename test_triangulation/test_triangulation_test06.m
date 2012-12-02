function test_triangulation_test06 ( )

%*****************************************************************************80
%
%% TEST06 tests P00_POLY_WRITE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
  file_name = 'p00.poly';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST06\n' );
  fprintf ( 1, '  P00_POLY_WRITE creates a POLY file out of the\n' );
  fprintf ( 1, '  boundary data for each problem.\n' );

  test_num = p00_test_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of tests available = %d\n', test_num );

  for test = 1 : test_num

    file_name = file_name_inc ( file_name );

    p00_poly_write ( test, file_name );

  end

  return
end
