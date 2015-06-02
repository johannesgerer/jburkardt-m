function ffmsh_io_test01 ( )

%*****************************************************************************80
%
%% FFMSH_IO_TEST01 gets the example 2D data and prints it.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    23 December 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FFMSH_IO_TEST01:\n' );
  fprintf ( 1, '  Get example 2D data and print it.\n' );
%
%  Get the sizes.
%
  [ v_num, e_num, t_num ] = ffmsh_2d_size_example ( );
%
%  Print the sizes.
%
  ffmsh_2d_size_print ( '  Example Sizes:', v_num, e_num, t_num );
%
%  Get the data.
%
  [ v_xy, v_l, e_v, e_l, t_v, t_l ] ...
    = ffmsh_2d_data_example ( v_num, e_num, t_num );
%
%  Print the data.
%
  ffmsh_2d_data_print ( '  Example data:', v_num, e_num, t_num, v_xy, ...
    v_l, e_v, e_l, t_v, t_l );

  return
end
