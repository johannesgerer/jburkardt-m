function x = ffwt ( n, x )

%*****************************************************************************80
%
%% FFWT performs an in-place fast Walsh transform.
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
  m = i4_log_2 ( n );

  for i = 1 : m
    two_power(i) = 2^( m - i );
  end

  for l = 1 : m

    nz = 2^( l - 1 );
    nzi = 2 * nz;
    nzn = floor ( n / nzi );
    nz2 = floor ( nz / 2 );
    if ( nz2 == 0 )
      nz2 = 1;
    end

    for i = 1 : nzn

      js = ( i - 1 ) * nzi;
      z = 1.0;

      for ii = 1 : 2

        for j = 1 : nz2
          js = js + 1;
          j2 = js + nz;
          hold = x(js) + z * x(j2);
          z = - z;
          x(j2) = x(js) + z * x(j2);
          x(js) = hold;
          z = - z;
        end

        if ( l == 1 )
          break
        end

        z = - 1.0;

      end

    end
  end
%
%  Bit reversal section.
%
  nw = 0;
  for k = 1 : n
%
%  Choose correct index and switch elements if not already switched.
%
    if ( k < nw + 1 )
      hold = x(nw+1);
      x(nw+1) = x(k);
      x(k) = hold;
    end
%
%  Bump up series by 1.
%
    for i = 1 : m

      ii = i;
      if ( nw < two_power(i) )
        break
      end
      mw = floor ( nw / two_power(i) );
      mw1 = floor ( mw / 2 );
      if ( mw <= 2 * mw1 )
        break
      end

      nw = nw - two_power(i);

    end

    nw = nw + two_power(ii);

  end

  return
end
