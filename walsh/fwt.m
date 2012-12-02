function x = fwt ( n, x )

%*****************************************************************************80
%
%% FWT performs a fast Walsh transform.
%
%  Discussion:
%
%    This routine performs a fast Walsh transform on an input series X
%    leaving the transformed results in X.
%    X is dimensioned N, which must be a power of 2.
%    The results of this Walsh transform are in sequency order.
%
%    The output sequence could be normalized by dividing by N.
%
%    Note that the program text in the reference included the line
%      y(jd) = abs ( x(j) - x(j2) )
%    which has been corrected to:
%      y(jd) = x(j) - x(j2)
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
  n2 = floor ( n / 2 );
  m = i4_log_2 ( n );

  for l = 1 : m

    ny = 0;
    nz = 2^(l-1);
    nzi = 2 * nz;
    nzn = floor ( n / nzi );

    for i = 1 : nzn

      nx = ny + 1;
      ny = ny + nz;
      js = ( i - 1 ) * nzi;
      jd = js + nzi + 1;

      for j = nx : ny
        js = js + 1;
        j2 = j + n2;
        y(js) = x(j) + x(j2);
        jd = jd - 1;
        y(jd) = x(j) - x(j2);
      end

    end

    x(1:n) = y(1:n);

  end

  return
end
