function [ x, y ] = p06_dat ( data_num )

%*****************************************************************************80
%
%% P06_DAT returns the data vector for problem 6.
%
%  Discussion:
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
  x = zeros ( data_num, 1 );
  y = zeros ( data_num, 1 );

  num_int = 5;

  n = 1;
  x(n,1) = 0.0;
  y(n,1) = 0.0;

  for i = 1 : num_int

    for j = 1 : i
      n = n + 1;
      x(n,1) = ( i - 1 ) + 0.5 * j /i;
      y(n,1) = j / i;
    end

    for j = 1 : i
      n = n + 1;
      x(n,1) = i - 1 + 0.5 + 0.5 * j / i;
      y(n,1) = 1.0 - j / i;
    end

  end

  return
end
