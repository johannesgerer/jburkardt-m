function [ x, y ] = p01_dat ( data_num )

%*****************************************************************************80
%
%% P01_DAT returns the data vector for problem 1.
%
%  Discussion:
%
%    The X data is measured in days, and the Y data represents the
%    observed position of Mars in a heliocentric coordinate system.
%
%    The X data is equally spaced.
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
%  Reference:
%
%    Samuel Conte, Carl deBoor,
%    Elementary Numerical Analysis,
%    McGraw Hill, 1972, page 217.
%
%  Parameters:
%
%    Input, integer DATA_NUM, the number of data points.
%
%    Output, real X(DATA_NUM,1), the abscissa data.
%
%    Output, real Y(DATA_NUM,1), the ordinate data.
%
  x(1:10,1) = [ ...
    1250.5, 1260.5, 1270.5, 1280.5, 1290.5, ...
    1300.5, 1310.5, 1320.5, 1330.5, 1340.5 ]';

  y(1:10,1) = [ ...
    1.39140, 1.37696, 1.34783, 1.30456, 1.24787, ...
    1.17862, 1.09776, 1.00636, 0.90553, 0.79642 ]';

  return
end
