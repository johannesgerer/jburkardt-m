function geometry_test023 ( )

%*****************************************************************************80
%
%% TEST023 tests DIRECTION_UNIFORM_ND, GET_SEED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  dim_num = 4;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST023\n' );
  fprintf ( 1, '  DIRECTION_UNIFORM_ND picks a random direction vector.\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ vran, seed ] = direction_uniform_nd ( dim_num, seed );
    fprintf ( 1, '  %10f  %10f  %10f  %10f\n', vran(1:dim_num) );
  end

  return
end
