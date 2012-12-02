function t_data = parameterize_arc_length ( m, data_num, p_data )

%*****************************************************************************80
%
%% PARAMETERIZE_ARC_LENGTH parameterizes data by pseudo-arclength.
%
%  Discussion:
%
%    A parameterization is required for the interpolation.
%
%    This routine provides a parameterization by computing the
%    pseudo-arclength of the data, that is, the Euclidean distance
%    between successive points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer DATA_NUM, the number of data points.
%
%    Input, real P_DATA(M,DATA_NUM), the data values.
%
%    Output, real T_DATA(DATA_NUM), parameter values
%    assigned to the data.
%
  t_data(1) = 0.0;
  for j = 2 : data_num
    t_data(j) = t_data(j-1) ...
      + sqrt ( sum ( ( p_data(1:m,j) - p_data(1:m,j-1) ).^2 ) );
  end

  return
end
