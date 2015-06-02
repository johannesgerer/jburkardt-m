function ffmsh_2d_size_print ( title, v_num, e_num, t_num )

%*****************************************************************************80
%
%% FFMSH_2D_SIZE_PRINT prints the sizes of an FFMSH.
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
%  Parameters:
%
%    Input, string TITLE, a title.
%
%    Input, integer V_NUM, the number of vertices.
%
%    Input, integer E_NUM, the number of boundary edges.
%
%    Input, integer T_NUM, the number of triangles.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of vertices = %d\n', v_num );
  fprintf ( 1, '  Number of boundary edges = %d\n', e_num );
  fprintf ( 1, '  Number of triangles = %d\n', t_num );

  return
end
