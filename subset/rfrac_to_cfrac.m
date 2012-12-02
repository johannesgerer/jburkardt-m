function t = rfrac_to_cfrac ( m, p, q )

%*****************************************************************************80
%
%% RFRAC_TO_CFRAC converts a rational polynomial fraction to a continued fraction.
%
%  Discussion:
%
%    That is, it accepts
%
%      P(1) + P(2) * X + ... + P(M) * X**(M-1)
%      -------------------------------------------------------
%      Q(1) + Q(2) * X + ... + Q(M) * X**(M-1) + Q(M+1) * X**M
%
%    and returns the equivalent continued fraction:
%
%      1 / ( T(1) + X / ( T(2) + X / (...T(2*M-1) + X / ( T(2*M) ... )))
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    18 July 2004
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
%    Input, integer M, defines the number of P coefficients,
%    and is one less than the number of Q coefficients, and one
%    half the number of T coefficients.
%
%    Input, real P(M), Q(M+1), the coefficients defining the rational
%    polynomial fraction.
%
%    Output, real T(2*M), the coefficients defining the continued fraction.
%
  a(1:m+1,1) = q(1:m+1)';
  a(1:m,  2) = p(1:m)';

  t(1) = a(1,1) / a(1,2);
  ta = a(m+1,1);

  for i = 1 : m
    a(m-i+1,2*i+1) = ta;
  end

  for k = 1 : 2*m-2

    for i = 1 : (2*m-k)/2
      a(i,k+2) = a(i+1,k) - t(k) * a(i+1,k+1);
    end

    if ( a(1,k+2) == 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'RFRAC_TO_CFRAC - Fatal error!\n' );
      fprintf ( 1, '  A(1,K+2) is zero for K = %d\n', k );
      error ( 'RFRAC_TO_CFRAF - Fatal error!' );
    end

    t(k+1) = a(1,k+1) / a(1,k+2);

  end

  t(2*m) = a(1,2*m) / a(1,2*m+1);

  return
end
