function x = haarin ( n, x )

%*****************************************************************************80
%
%% HAARIN inverts a Haar transform.
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

    l = 2^( i - 1 );

    y(1:2*l) = x(1:2*l);

    for j = 1 : l
      lj = l + j;
      jj = 2 * j;
      jj1 = jj - 1;
      x(jj) = y(j) - y(lj);
      x(jj1) = y(j) + y(lj);
    end

  end

  return
end
