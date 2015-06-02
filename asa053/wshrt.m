function [ sa, seed ] = wshrt ( d, n, np, seed )

%*****************************************************************************80
%
%% WSHRT returns a random Wishart variate.
%
%  Discussion:
%
%    This routine is a Wishart variate generator.  
%
%    On output, SA is an upper-triangular matrix of size NP * NP,
%    written in linear form, column ordered, whose elements have a 
%    Wishart(N, SIGMA) distribution.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 April 2014
%
%  Author:
%
%    Original FORTRAN77 version by William Smith, Ronald Hocking.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    William Smith, Ronald Hocking,
%    Algorithm AS 53, Wishart Variate Generator,
%    Applied Statistics,
%    Volume 21, Number 3, pages 341-345, 1972.
%
%  Parameters:
%
%    Input, real D(NP*(NP+1)/2), the upper triangular array that
%    represents the Cholesky factor of the correlation matrix SIGMA.
%    D is stored in column-major form.
%
%    Input, integer N, the number of degrees of freedom.
%    1 <= N <= NP.
%
%    Input, integer NP, the size of variables.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real SA(NP*(NP+1)/2), a sample from the Wishart distribution.
%
  k = 1;
%
%  Load SB with independent normal (0, 1) variates.
%
  nnp = floor ( ( np * ( np + 1 ) ) / 2 );
  sb = zeros ( nnp );

  while ( k <= nnp )

    [ u1, u2, seed ] = rnorm ( seed );

    sb(k) = u1;
    k = k + 1;

    if ( k <= nnp )
      sb(k) = u2;
      k = k + 1;
    end

  end
%
%  Load diagonal elements with square root of chi-square variates.
%
  sa = zeros ( nnp );

  ns = 0;

  for i = 1 : np
%
%  The original text read "DF = N - I + 1".
%  This should read "DF = NP - I + 1".
%
    df = np - i + 1;
    ns = ns + i;
    u1 = 2.0 / ( 9.0 * df );
    u2 = 1.0 - u1;
    u1 = sqrt ( u1 );
%
%  Wilson-Hilferty formula for approximating chi-square variates:
%  The original code did not take the absolute value!
%
    sb(ns) = sqrt ( df * abs ( ( u2 + sb(ns) * u1 ) ^ 3 ) );

  end

  rn = n;
  nr = 1;

  for i = 1 : np
    nr = nr + i - 1;
    for j = i : np
      ip = nr;
      nq = floor ( ( j * ( j - 1 ) ) / 2 ) + i - 1;
      c = 0.0;
      for k = i : j
        ip = ip + k - 1;
        nq = nq + 1;
        c = c + sb(ip) * d(nq);
      end
      sa(ip) = c;
    end
  end

  for i = 1 : np
    ii = np - i + 1;
    nq = nnp - np;
    for j = 1 : i
      ip = floor ( ( ii * ( ii - 1 ) ) / 2 );
      c = 0.0;
      for k = i : np
        ip = ip + 1;
        nq = nq + 1;
        c = c + sa(ip) * sa(nq);
      end
      sa(nq) = c / rn;
      nq = nq - 2 * np + i + j - 1;
    end
  end

  return
end

