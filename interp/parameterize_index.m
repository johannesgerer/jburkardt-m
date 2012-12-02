function t_data = parameterize_index ( m, data_num, p_data )

%*****************************************************************************80
%
%% PARAMETERIZE_INDEX parameterizes data by its index.
%
%  Discussion:
%
%    A parameterization is required for the interpolation.
%
%    This routine provides a naive parameterization by vector index.
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
    t_data(j) = j - 1;
  end

  return
end
