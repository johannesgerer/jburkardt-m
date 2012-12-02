function [ p, q ]= cfrac_to_rfrac ( m, g, h )

%*****************************************************************************80
%
%% CFRAC_TO_RFRAC converts a polynomial fraction from continued to rational form.
%
%  Discussion:
%
%    The routine accepts a continued polynomial fraction:
%
%      G(1)     / ( H(1) +
%      G(2) * X / ( H(2) +
%      G(3) * X / ( H(3) + ...
%      G(M) * X / ( H(M) )...) ) )
%
%    and returns the equivalent rational polynomial fraction:
%
%      P(1) + P(2) * X + ... + P(L1) * X**(L1)
%      -------------------------------------------------------
%      Q(1) + Q(2) * X + ... + Q(L2) * X**(L2-1)
%
%    where
%
%      L1 = (M+1)/2
%      L2 = (M+2)/2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 June 2004
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
%    Input, integer M, the number of continued fraction polynomial coefficients.
%
%    Input, real G(M), H(M), the continued polynomial fraction coefficients.
%
%    Output, real P((M+1)/2), Q((M+2)/2), the rational polynomial fraction
%    coefficients.
%
  if ( m == 1 )
    p(1) = g(1);
    q(1) = h(1);
    return
  end

  for i = 1 : m
    for j = 1 : floor ( (m+2)/2 )
      a(i,j) = 0.0E+00;
    end
  end
%
%  Solve for P's.
%
  a(1,1) = g(1);
  a(2,1) = g(1) * h(2);

  for i = 3 : m
    a(i,1) = h(i) * a(i-1,1);
    for j = 2 : floor ( (i+1)/2 )
      a(i,j) = h(i) * a(i-1,j) + g(i) * a(i-2,j-1);
    end
  end

  for j = 1 : floor ( (m+1)/2 )
    p(j) = a(m,j);
  end
%
%  Solve for Q's.
%
  a(1,1) = h(1);
  a(2,1) = h(1) * h(2);
  a(2,2) = g(2);

  for i = 3 : m
    a(i,1) = h(i) * a(i-1,1);
    for j = 2 : floor ( (i+2) / 2 )
      a(i,j) = h(i) * a(i-1,j) + g(i) * a(i-2,j-1);
    end
  end

  for j = 1 :  floor ( (m+2)/2 )
    q(j) = a(m,j);
  end

  return
end
