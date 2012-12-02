function b = power_series2 ( n, a )

%*****************************************************************************80
%
%% POWER_SERIES2 computes the power series for G(Z) = exp(F(Z)) - 1.
%
%  Discussion:
%
%    The power series for F(Z) is given.
%
%    The power series have the form:
%
%      F(Z) = A1*Z + A2*Z**2 + A3*Z**3 + ... + AN*Z**N
%
%      G(Z) = B1*Z + B2*Z**2 + B3*Z**3 + ... + BN*Z**N
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 June 2004
%
%  Author:
%
%    Original FORTRAN77 version by Albert Nijenhuis, Herbert Wilf.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    A Nijenhuis and H Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, the number of terms in the power series.
%
%    Input, real A(N), the power series coefficients for F(Z).
%
%    Output, real B(N), the power series coefficients for G(Z).
%
  for j = 1 : n

    v = 0.0E+00;

    for i = 1 : j-1
      v = v + b(i) * a(j-i) * ( j - i );
    end

    b(j) = a(j) + v / j;

  end

  return
end
