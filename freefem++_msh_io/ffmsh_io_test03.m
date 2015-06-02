function ffmsh_io_test03 ( )

%*****************************************************************************80
%
%% FFMSH_IO_TEST03 gets the example 2D data and prints it.
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
  filename = 'input.msh';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FFMSH_IO_TEST03:\n' );
  fprintf ( 1, '  Read 2D data from a file and print it.\n' );
%
%  Read the sizes.
%
  [ v_num, e_num, t_num ] = ffmsh_2d_size_read ( filename );
%
%  Print the sizes.
%
  ffmsh_2d_size_print ( filename, v_num, e_num, t_num );
%
%  Read the data.
%
  [ v_xy, v_l, e_v, e_l, t_v, t_l ] ...
    = ffmsh_2d_data_read ( filename, v_num, e_num, t_num );
%
%  Print the data.
%
  ffmsh_2d_data_print ( filename, v_num, e_num, t_num, v_xy, ...
    v_l, e_v, e_l, t_v, t_l );

  return
end
