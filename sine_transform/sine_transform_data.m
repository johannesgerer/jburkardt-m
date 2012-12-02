function s = sine_transform_data ( n, d )

%*****************************************************************************80
%
%% SINE_TRANSFORM_DATA does a sine transform on a vector of data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of data points.
%
%    Input, real D(N), the vector of data.
%
%    Output, real S(N), the sine transform coefficients.
%
  s = zeros ( n, 1 );

  for i = 1 : n
    for j = 1 : n
      s(i) = s(i) + sin ( pi * i * j / ( n + 1 ) ) * d(j);
    end
  end

  s(1:n) = s(1:n) * sqrt ( 2 / ( n + 1 ) );

  return
end
