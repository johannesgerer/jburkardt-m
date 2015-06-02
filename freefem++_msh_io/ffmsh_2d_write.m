function ffmsh_2d_write ( ffmsh_filename, v_num, e_num, t_num, v_xy, v_l, ...
  e_v, e_l, t_v, t_l )

%*****************************************************************************80
%
%% FFMSH_2D_WRITE writes FFMSH data to a file.
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
%    Input, string FFMSH_FILENAME, the name of the file.
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

%
%  Open the file.
%
  ffmsh_unit = fopen ( ffmsh_filename, 'wt' );
%
%  Write the data.
%
  fprintf ( ffmsh_unit, '%d  %d  %d\n', v_num, t_num, e_num );

  for j = 1 : v_num
    fprintf ( ffmsh_unit, '%g  %g  %d\n', v_xy(1:2,j), v_l(j) );
  end

  for j = 1 : t_num
    fprintf ( ffmsh_unit, '%d  %d  %d  %d\n', t_v(1:3,j), t_l(j) );
  end

  for j = 1 : e_num
    fprintf ( ffmsh_unit, '%d  %d  %d\n', e_v(1:2,j), e_l(j) );
  end

  fclose ( ffmsh_unit );

  return
end