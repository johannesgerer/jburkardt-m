function p_data = p07_data ( dim_num, data_num )

%*****************************************************************************80
%
%% P07_DATA returns the data for problem p07.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension of the dependent
%    variables.
%
%    Input, integer DATA_NUM, the number of data points.
%
%    Output, real P_DATA(DIM_NUM,DATA_NUM), the data.
%
  p_data = [ ...
   0.0, 1.0; ...
   1.0, 2.0; ...
   4.0, 2.0; ...
   5.0, 1.0 ]';

  return
end
