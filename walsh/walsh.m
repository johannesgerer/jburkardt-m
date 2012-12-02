function x = walsh ( n, x )

%*****************************************************************************80
%
%% WALSH performs a fast Walsh transform.
%
%  Discussion:
%
%    This routine performs a fast Wash transform on an input series X
%    leaving the transformed results in X.  The array Y is working space.
%    X and Y are dimensioned N, which must be a power of 2.
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
  n2 = floor ( n / 2 );
  m = i4_log_2 ( n );
  z = - 1.0;

  for j = 1 : m

    n1 = 2^( m - j + 1 );
    j1 = 2^( j - 1 );

    for l = 1 : j1

      is = ( l - 1 ) * n1 + 1;
      i1 = 0;
      w = z;

      for i = is : 2 : is + n1 - 1
        a = x(i);
        x(is+i1) = a + x(i+1);
        i1 = i1 + 1;
        y(i1) = ( x(i+1) - a ) * w;
        w = w * z;
      end

      n2 = floor ( n1 / 2 );;
      x(n2+is:n1+is-1) = y(1:n2);

    end

  end

  return
end
