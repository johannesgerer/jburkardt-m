function ffmsh_io_test02 ( )

%*****************************************************************************80
%
%% FFMSH_IO_TEST02 gets the example 2D data and writes it to a file.
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
  fprintf ( 1, 'FFMSH_IO_TEST02:\n' );
  fprintf ( 1, '  Get example 2D data and write it to a file.\n' );
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
%  Write the sizes and data.
%
  filename = 'output.msh';

  ffmsh_2d_write ( filename, v_num, e_num, t_num, v_xy, ...
    v_l, e_v, e_l, t_v, t_l );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data was written to "%s"\n', filename );

  return
end
