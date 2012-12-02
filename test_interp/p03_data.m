function p_data = p03_data ( dim_num, data_num )

%*****************************************************************************80
%
%% P03_DATA returns the data for problem p03.
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
     0.0,  0.0; ...
     2.0, 10.0; ...
     3.0, 10.0; ...
     5.0, 10.0; ...
     6.0, 10.0; ...
     8.0, 10.0; ...
     9.0, 10.5; ...
    11.0, 15.0; ...
    12.0, 50.0; ...
    14.0, 60.0; ...
    15.0, 85.0 ]';

  return
end
