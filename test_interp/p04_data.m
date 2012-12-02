function p_data = p04_data ( dim_num, data_num )

%*****************************************************************************80
%
%% P04_DATA returns the data for problem p04.
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
    0.00,  0.00; ...
    0.05,  0.70; ...
    0.10,  1.00; ...
    0.20,  1.00; ...
    0.80,  0.30; ...
    0.85,  0.05; ...
    0.90,  0.10; ...
    1.00,  1.00 ]';

  return
end
