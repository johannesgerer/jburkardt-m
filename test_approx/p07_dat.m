function [ x, y ] = p07_dat ( data_num )

%*****************************************************************************80
%
%% P07_DAT returns the data vector for problem 7.
%
%  Discussion:
%
%    The X data is NOT equally spaced.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 August 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DATA_NUM, the number of data points.
%
%    Output, real X(DATA_NUM,1), the abscissa data.
%
%    Output, real Y(DATA_NUM,1), the ordinate data.
%
  x(1:9,1) = [ 0.0,  0.1,  0.2,  0.3, 0.4, ...
              0.5,  0.6,  0.8,  1.0 ]';

  y(1:9,1) = [ 0.0,  0.9,  0.95, 0.9, 0.1, ...
              0.05, 0.05, 0.2,  1.0 ]';

  return
end
