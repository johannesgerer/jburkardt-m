function [ x, y ] = p02_dat ( data_num )

%*****************************************************************************80
%
%% P02_DAT returns the data vector for problem 2.
%
%  Discussion:
%
%    The data lies roughly along a straight line.  Polynomial
%    interpolation is inappropriate.  Instead, a least squares
%    approximation should be sought, of the form:
%
%      F(X) = A + B * X
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
%    Output, real Y(DATA_NUM),1, the ordinate data.
%
  x(1:11,1) = [ ...
    1.0, 2.0, 3.0, 4.0,  5.0, ...
    6.0, 7.0, 8.0, 9.0, 10.0, ...
   11.0 ]';

  y(1:11,1) = [ ...
    0.00, 0.60, 1.77, 1.92, 3.31, ...
    3.52, 4.59, 5.31, 5.79, 7.06, ...
    7.17 ]';

  return
end
