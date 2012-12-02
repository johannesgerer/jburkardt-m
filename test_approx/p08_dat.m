function [ x, y ] = p08_dat ( data_num )

%*****************************************************************************80
%
%% P08_DAT returns the data vector for problem 8.
%
%  Discussion:
%
%    This example is due to Pierre Blais.
%
%    Data is only available over the interval [0, 238], but extrapolation
%    is to be used to extend the approximate function to a maximum argument
%    of 1023.  The behavior of the extrapolated curve is of great interest.
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
  x(1:12,1) = [ ...
      0.0,  71.0,  104.0,  135.0, 145.0, ...
    160.0, 181.0,  193.0,  205.0, 215.0, ...
    225.0, 238.0 ]';

  y(1:12,1) = [ ...
      0.0000,   7.7554,  19.7062,  35.53786,  42.91537, ...
     54.7752,  66.75865, 78.49286, 89.76833, 101.746, ...
    113.4824, 135.4566 ]';

  return
end
