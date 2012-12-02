function [ x, y ] = p03_dat ( data_num )

%*****************************************************************************80
%
%% P03_DAT returns the data vector for problem 3.
%
%  Discussion:
%
%    The data is all zero except for a single value of 1 in the center.
%    This data set is interesting because an interpolation method that
%    is "local" will produce an interpolating curve that is exactly
%    zero over most of the outlying intervals, whereas a nonlocal
%    interpolation method may produce a curve that "wiggles" over the
%    entire interpolation interval.
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
%  Parameters:
%
%    Input, integer DATA_NUM, the number of data points.
%
%    Output, real X(DATA_NUM,1), the abscissa data.
%
%    Output, real Y(DATA_NUM,1), the ordinate data.
%
  x(1:11,1) = [ ...
     0.0, 1.0, 2.0, 3.0, 4.0, ...
     5.0, 6.0, 7.0, 8.0, 9.0, ...
    10.0 ]';

  y(1:11,1) = [ ...
    0.0, 0.0, 0.0, 0.0, 0.0, ...
    1.0, 0.0, 0.0, 0.0, 0.0, ...
    0.0 ]';

  return
end
