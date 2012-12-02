function x = hnorm ( n, x )

%*****************************************************************************80
%
%% HNORM computes normalization factors for a forward or inverse Haar transform.
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
%    Input, real X(N), the data to be normalized.
%
%    Output, real X(N), the normalized data.
%
  k = i4_log_2 ( n );

  x(1) = x(1) / 2.0^k;

  if ( 1 <= k )
    x(2) = x(2) / 2.0^k;
  end

  for ii = 2 : k

    i = ii - 1;
    wlk = 1.0 / 2.0^( k - i );
    jmin = 2^i + 1;
    jmax = 2^ii;

    x(jmin:jmax) = x(jmin:jmax) * wlk;

  end

  return
end
