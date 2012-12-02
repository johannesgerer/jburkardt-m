function x = cheby ( nf, npl, functn )

%*****************************************************************************80
%
%% CHEBY carries out the Chebyshev analysis of one or more functions.
%
%  Discussion:
%
%    This routine carries out the simultaneous Chebyshev analysis of 
%    NF functions.
%
%    The output is a matrix containing one Chebyshev series per column.
%
%    An example of a routine to compute the function values is:
%
%      function value = functn ( a )
%      value(1) = sin(a)
%      value(2) = cos(a)
%      return
%      end
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 September 2011
%
%  Author:
%
%    Original FORTRAN77 version by Roger Broucke.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Roger Broucke,
%    Algorithm 446:
%    Ten Subroutines for the Manipulation of Chebyshev Series,
%    Communications of the ACM,
%    October 1973, Volume 16, Number 4, pages 254-256.
%
%  Parameters:
%
%    Input, integer NF, the number of functions to be analyzed.
%
%    Input, integer NPL, the number of terms in the 
%    Chebyshev series.
%
%    Input, external FUNCTN, the name of a routine which computes
%    the function values at any given point.
%
%    Output, real X(NPL,NF), the Chebyshev series.
%
  x = zeros ( npl, nf );

  n = npl - 1;

  gc = zeros ( 2 * n, 1 );

  for k = 1 : 2 * n
    gc(k) = cos ( ( k - 1 ) * pi / n );
  end

  for j = 1 : npl

    xj = gc(j);
    fxj = functn ( xj );

    if ( j == 1 || j == npl )
      fxj(1:nf) = 0.5 * fxj(1:nf);
    end

    for l = 1 : npl
      lm = mod ( ( l - 1 ) * ( j - 1 ), 2 * n ) + 1;
      x(l,1:nf) = x(l,1:nf) + fxj(1:nf) * gc(lm);
    end

  end

  x(1:npl,1:nf) = 2.0 * x(1:npl,1:nf) / n;

  return
end
