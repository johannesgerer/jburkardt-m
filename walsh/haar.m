function x = haar ( n, x )

%*****************************************************************************80
%
%% HAAR performs a Haar transform.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 March 2011
%
%  Author:
%
%    Ken Beauchamp
%
%  Reference:
%
%    Ken Beauchamp,
%    Walsh functions and their applications,
%    Academic Press, 1975,
%    ISBN: 0-12-084050-2,
%    LC: QA404.5.B33.
%
%  Parameters:
%
%    Input, integer N, the number of items in X.
%    N must be a power of 2.
%
%    Input, real X(N), the data to be transformed.
%
%    Output, real X(N), the transformed data.
%
  k = i4_log_2 ( n );

  for i = 1 : k

    l = k + 1 - i;
    l2 = 2^( l - 1 );

    y(1:2*l2) = x(1:2*l2);

    for j = 1 : l2
       l3 = l2 + j;
       jj = 2 * j - 1;
       x(j) = y(jj) + y(jj+1);
       x(l3) = y(jj) - y(jj+1);
    end

  end

  return
end
