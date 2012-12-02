function geometry_test022 ( )

%*****************************************************************************80
%
%% TEST022 tests DIRECTION_UNIFORM_3D, GET_SEED.
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
  dim_num = 3;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST022\n' );
  fprintf ( 1, '  DIRECTION_UNIFORM_3D picks a random direction vector.\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ vran, seed ] = direction_uniform_3d ( seed );
    fprintf ( 1, '  %10f  %10f  %10f\n', vran(1:dim_num) );
  end

  return
end
