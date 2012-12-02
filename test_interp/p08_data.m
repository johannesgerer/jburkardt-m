function p_data = p08_data ( dim_num, data_num )

%*****************************************************************************80
%
%% P08_DATA returns the data for problem p08.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 July 2012
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
   -1.0, 1.00; ...
   -0.8, 0.64; ...
   -0.6, 0.36; ...
   -0.4, 0.16; ...
   -0.2, 0.04; ...
    0.0, 0.00; ...
    0.2, 0.04; ...
    0.20001, 0.05; ...
    0.4, 0.16; ...
    0.6, 0.36; ...
    0.8, 0.64; ...
    1.0, 1.00 ]';

  return
end
