function seed = latin_edge_test01 ( seed )

%*****************************************************************************80
%
%% LATIN_EDGE_TEST01 tests LATIN_EDGE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    03 April 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer SEED, an initial seed for the random number generator.
%
%    Output, integer SEED, the updated random number seed.
%
  dim_num = 2;
  point_num = 11;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATIN_EDGE_TEST01\n' );
  fprintf ( 1, '  LATIN_EDGE chooses a Latin cell arrangement,\n' );
  fprintf ( 1, '  which includes the edge points.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension = %d\n', dim_num );
  fprintf ( 1, '  Number of points =  %d\n', point_num );
  fprintf ( 1, '  Using seed = %d\n', seed );

  [ x, seed ] = latin_edge ( dim_num, point_num, seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The Latin Edge Square points:\n' );
  fprintf ( 1, '\n' );

  for j = 1: point_num
    for i = 1: dim_num
      fprintf ( 1, '%10f  ', x(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
