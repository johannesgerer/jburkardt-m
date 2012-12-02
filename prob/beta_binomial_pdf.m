function pdf = beta_binomial_pdf ( x, a, b, c )

%*****************************************************************************80
%
%% BETA_BINOMIAL_PDF evaluates the Beta Binomial PDF.
%
%  Discussion:
%
%    PDF(X)(A,B,C) = Beta(A+X,B+C-X)
%      / ( (C+1) * Beta(X+1,C-X+1) * Beta(A,B) )  for 0 <= X <= C.
%
%    This PDF can be reformulated as:
%
%      The beta binomial probability density function for X successes
%      out of N trials is
%
%      PDF2(X)( N, MU, THETA ) =
%        C(N,X) * Product ( 0 <= R <= X - 1 ) ( MU + R * THETA )
%               * Product ( 0 <= R <= N - X - 1 ) ( 1 - MU + R * THETA )
%               / Product ( 0 <= R <= N - 1 )  ( 1 + R * THETA )
%
%      where
%
%        C(N,X) is the combinatorial coefficient;
%        MU is the expectation of the underlying Beta distribution;
%        THETA is a shape parameter.
%
%      A THETA value of 0 ( or A+B --> Infinity ) results in the binomial
%      distribution:
%
%        PDF2(X) ( N, MU, 0 ) = C(N,X) * MU**X * ( 1 - MU )**(N-X)
%
%    Given A, B, C for PDF, then the equivalent PDF2 has:
%
%      N     = C
%      MU    = A / ( A + B )
%      THETA = 1 / ( A + B )
%
%    Given N, MU, THETA for PDF2, the equivalent PDF has:
%
%      A = MU / THETA
%      B = ( 1 - MU ) / THETA
%      C = N
%
%    BETA_BINOMIAL_PDF(X)(1,1,C) = UNIFORM_DISCRETE_PDF(X)(0,C-1)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X, the argument of the PDF.
%
%    Input, real A, B, parameters of the PDF.
%    0.0D+00 < A,
%    0.0D+00 < B.
%
%    Input, integer C, a parameter of the PDF.
%    0 <= C.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x < 0 )

    pdf = 0.0;

  elseif ( x <= c )

    pdf = beta ( a + x, b + c - x ) ...
      / ( ( c + 1 ) * beta ( x + 1, c - x + 1 ) * beta ( a, b ) );

  elseif ( c < x )

    pdf = 0.0;

  end

  return
end
