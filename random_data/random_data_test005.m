function random_data_test005 ( )

%*****************************************************************************80
%
%% RANDOM_DATA_TEST005 tests BAD_IN_SIMPLEX01.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 August 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RANDOM_DATA_TEST005:\n' );
  fprintf ( 1, '  BAD_IN_SIMPLEX01 is a "bad" sampling technique\n' );
  fprintf ( 1, '  for the unit simplex.\n' );

  for dim_num = 2 : 3

    seed = 123456789;

    n = 10000;

    if ( dim_num == 2 )
      output_filename = 'bad_in_triangle.txt';
    elseif ( dim_num == 3 )
      output_filename = 'bad_in_tetrahedron.txt';
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Spatial dimension DIM_NUM =   %d\n', dim_num );
    fprintf ( 1, '  Number of points N =          %d\n', n );
    fprintf ( 1, '  Initial random number SEED =  %d\n', seed );

    [ x, seed ] = bad_in_simplex01 ( dim_num, n, seed );

    r8mat_write ( output_filename, dim_num, n, x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Data written to "%s"\n', output_filename );

  end

  return
end
