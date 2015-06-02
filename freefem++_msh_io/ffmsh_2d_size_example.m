function [ v_num, e_num, t_num ] = ffmsh_2d_size_example ( )

%*****************************************************************************80
%
%% FFMSH_2D_SIZE_EXAMPLE returns sizes for the 2D example.
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
%    Output, integer V_NUM, the number of vertices.
%
%    Output, integer E_NUM, the number of boundary edges.
%
%    Output, integer T_NUM, the number of triangles.
%
  e_num = 10;
  t_num = 18;
  v_num = 15;

  return
end
