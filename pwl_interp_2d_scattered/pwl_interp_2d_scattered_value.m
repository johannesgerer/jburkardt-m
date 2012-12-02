function zi = pwl_interp_2d_scattered_value ( nd, xyd, zd, t_num, t, ...
  t_neighbor, ni, xyi )

%*****************************************************************************80
%
%% PWL_INTERP_2D_SCATTERED_VALUE evaluates a 2d interpolant of scattered data
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 October 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ND, the number of data points.
%
%    Input, real XYD(2,ND), the data point coordinates.
%
%    Input, real ZD(ND), the data values.
%
%    Input, integer T_NUM, the number of triangles.
%
%    Input, integer T(3,T_NUM), the triangle information.
%
%    Input, integer T_NEIGHBOR(3,T_NUM), the triangle neighbors.
%
%    Input, integer NI, the number of interpolation points.
%
%    Input, real XYI(2,NI), the interpolation point coordinates.
%
%    Output, real ZI(NI), the interpolated values.
%
  for i = 1 : ni

    [ j, alpha, beta, gamma, edge, step_num ] = triangulation_search_delaunay ( ...
      nd, xyd, 3, t_num, t, t_neighbor, xyi(1:2,i) );

    if ( j == -1 )
      zi(i) = -1.0;
    end

    zi(i) = alpha * zd(t(1,j)) ...
          + beta  * zd(t(2,j)) ...
          + gamma * zd(t(3,j));

  end

  return
end
  
