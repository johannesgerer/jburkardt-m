function [ x, y ] = p04_dat ( data_num )

%*****************************************************************************80
%
%% P04_DAT returns the data vector for problem 4.
%
%  Discussion:
%
%    Theoretically, the data is a step, 0 to the left of 5, and 1
%    to the right.  To keep things simple, the data is defined
%    to be 0 up to 5 - RADIUS, 1/2 at 5, 1 at 5 + RADIUS and beyond,
%    with RADIUS set to a "small" value, currently 0.01.
%    Some interpolation methods will violently overreact to this
%    jump.
%
%    The X data is NOT equally spaced because of the handling of the pulse.
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
  radius = 0.01;

  x(1:13,1) = [ ...
    0.0, 1.0, 2.0, 3.0, 4.0, ...
    5.0 - radius, 5.0, 5.0 + radius, 6.0, 7.0, ...
    8.0, 9.0, 10.0 ]';

  y(1:13,1) = [ ...
    0.0, 0.0, 0.0, 0.0, 0.0, ...
    0.0, 0.5, 1.0, 1.0, 1.0, ...
    1.0, 1.0, 1.0 ]';

  return
end
