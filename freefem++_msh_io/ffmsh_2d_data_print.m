function ffmsh_2d_data_print ( title, v_num, e_num, t_num, v_xy, v_l, e_v, ...
  e_l, t_v, t_l )

%*****************************************************************************80
%
%% FFMSH_2D_DATA_PRINT prints FFMSH data.
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
%    Input, real V_XY(2,V_NUM), vertex coordinates.
%
%    Input, integer V_L(V_NUM), vertex labels.
%
%    Input, integer E_V(2,E_NUM), edge vertices.
%
%    Input, integer E_L(E_NUM), vertex labels.
%
%    Input, integer T_V(3,T_NUM), triangle vertices.
%
%    Input, integer T_L(T_NUM), triangle labels.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  
  i4vec_print (              v_num, v_l,  '  Vertex labels:' );
  r8mat_transpose_print ( 2, v_num, v_xy, '  Vertex coordinates:' );
  i4vec_print (              e_num, e_l,  '  Edge labels:' );
  i4mat_transpose_print ( 2, e_num, e_v,  '  Edge vertices:' );
  i4vec_print (              t_num, t_l,  '  Triangle labels:' );
  i4mat_transpose_print ( 3, t_num, t_v,  '  Triangle vertices:' );

  return
end