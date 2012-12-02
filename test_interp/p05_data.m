function p_data = p05_data ( dim_num, data_num )

%*****************************************************************************80
%
%% P05_DATA returns the data for problem p05.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2011
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
    0.00, 0.00; ...
    0.10, 0.90; ...
    0.20, 0.95; ...
    0.30, 0.90; ...
    0.40, 0.10; ...
    0.50, 0.05; ...
    0.60, 0.05; ...
    0.80, 0.20; ...
    1.00, 1.00 ]';

  return
end
