function [ p, q ] = jfrac_to_rfrac ( m, r, s )

%*****************************************************************************80
%
%% JFRAC_TO_RFRAC converts a J-fraction into a rational polynomial fraction.
%
%  Discussion:
%
%    The routine accepts a J-fraction:
%
%        R(1) / ( X + S(1)
%      + R(2) / ( X + S(2)
%      + R(3) / ...
%      + R(M) / ( X + S(M) )... ))
%
%    and returns the equivalent rational polynomial fraction:
%
%      P(1) + P(2) * X + ... + P(M) * X**(M-1)
%      -------------------------------------------------------
%      Q(1) + Q(2) * X + ... + Q(M) * X**(M-1) + Q(M+1) * X**M
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Hart, Cheney, Lawson, Maehly, Mesztenyi, Rice, Thacher, Witzgall,
%    Computer Approximations,
%    Wiley, 1968.
%
%  Parameters:
%
%    Input, integer M, defines the number of P, R, and S
%    coefficients, and is one less than the number of Q
%    coefficients.
%
%    Input, real R(M), S(M), the coefficients defining the J-fraction.
%
%    Output, real P(M), Q(M+1), the coefficients defining the rational
%    polynomial fraction.  The algorithm used normalizes the coefficients
%    so that Q(M+1) = 1.0.
%
  a(1,1) = r(1);
  b(1,1) = s(1);

  if ( 1 < m )

    for k = 2 : m
      a(k,k) = r(1);
      b(k,k) = b(k-1,k-1) + s(k);
    end

    a(1,2) = r(1) * s(2);
    b(1,2) = r(2) + s(1) * s(2);

    for k = 3 : m
      a(1,k) = s(k) * a(1,k-1) + r(k) * a(1,k-2);
      a(k-1,k) = a(k-2,k-1) + s(k) * r(1);
      b(1,k) = s(k) * b(1,k-1) + r(k) * b(1,k-2);
      b(k-1,k) = b(k-2,k-1) + s(k) * b(k-1,k-1) + r(k);
    end

    for k = 4 : m
      for i = 2 : k-2
        a(i,k) = a(i-1,k-1) + s(k)*a(i,k-1) + r(k) * a(i,k-2);
        b(i,k) = b(i-1,k-1) + s(k)*b(i,k-1) + r(k) * b(i,k-2);
      end
    end

  end

  p(1:m) = a(1:m,m);

  q(1:m) = b(1:m,m);
  q(m+1) = 1.0E+00;

  return
end
