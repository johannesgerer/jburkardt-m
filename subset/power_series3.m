function c = power_series3 ( n, a, b )

%*****************************************************************************80
%
%% POWER_SERIES3 computes the power series for H(Z) = G(F(Z)).
%
%  Discussion:
%
%    The power series for G and H are given.
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
%    Input, real A(N), the power series for F.
%
%    Input, real B(N), the power series for G.
%
%    Output, real C(N), the power series for H.
%
  work(1:n) = b(1) * a(1:n);
%
%  Search for IQ, the index of the first nonzero entry in A.
%
  iq = 0;

  for i = 1 : n

    if ( a(i) ~= 0.0E+00 )
      iq = i;
      break
    end

  end

  if ( iq ~= 0 )

    m = 1;

    while ( 1 )

      m = m + 1;

      if ( n < m * iq )
        break;
      end

      if ( b(m) == 0.0E+00 )
        continue;
      end

      r = b(m) * a(iq)^m;
      work(m*iq) = work(m*iq) + r;

      for j = 1 : n-m*iq

        v = 0.0E+00;
        for i = 1 : j-1
          v = v + c(i) * a(j-i+iq) * ( m * ( j - i ) - i );
        end

        c(j) = ( m * a(j) + v / j ) / a(iq);

      end

      for i = 1 : n-m*iq
        work(i+m*iq) = work(i+m*iq) + c(i) * r;
      end

    end

  end

  c(1:n) = work(1:n);

  return
end
