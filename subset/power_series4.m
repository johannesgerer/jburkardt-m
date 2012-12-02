function c = power_series4 ( n, a, b )

%*****************************************************************************80
%
%% POWER_SERIES4 computes the power series for H(Z) = G ( 1/F(Z) ).
%
%  Discussion:
%
%    The routine is given the power series for the functions F and G.
%
%    We assume that
%
%      F(Z) = A1*Z + A2*Z**2 + A3*Z**3 + ... + AN*Z**N
%      G(Z) = B1*Z + B2*Z**2 + B3*Z**3 + ... + BN*Z**N
%      H(Z) = C1*Z + C2*Z**2 + C3*Z**3 + ... + CN*Z**N
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
%    Input, real A(N), the power series for F.  A(1) may not be 0.0.
%
%    Input, real B(N), the power series for G.
%
%    Output, real C(N), the power series for H.
%
  if ( a(1) == 0.0E+00 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'POWER_SERIES4 - Fatal error!\n' );
    fprintf ( 1, '  A(1) is zero.\n' );
    error ( 'POWER_SERIES4 - Fatal error!' );
  end

  t = 1.0E+00;

  for i = 1 : n
    t = t / a(1);
    c(i) = b(i) * t;
    work(i) = a(i) * t;
  end

  for k = 2 : n
    s = -work(k);
    for i = k : n
      for j = i : n
        c(j) = c(j) + s * c(j+1-k);
        work(j) = work(j) + s * work(j+1-k);
      end
    end
  end

  return
end
