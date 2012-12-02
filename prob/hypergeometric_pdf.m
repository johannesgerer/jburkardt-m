function pdf = hypergeometric_pdf ( x, n, m, l )

%*****************************************************************************80
%
%% HYPERGEOMETRIC_PDF evaluates the Hypergeometric PDF.
%
%  Discussion:
%
%    PDF(X)(N,M,L) = C(M,X) * C(L-M,N-X) / C(L,N).
%
%    PDF(X)(N,M,L) is the probability of drawing X white balls in a
%    single random sample of size N from a population containing
%    M white balls and a total of L balls.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X, the desired number of white balls.
%    0 <= X <= N, usually, although any value of X can be given.
%
%    Input, integer N, the number of balls selected.
%    0 <= N <= L.
%
%    Input, integer M, the number of white balls in the population.
%    0 <= M <= L.
%
%    Input, integer L, the number of balls to select from.
%    0 <= L.
%
%    Output, real PDF, the probability of exactly K white balls.
%

%
%  Special cases.
%
  if ( x < 0 )

    pdf = 1.0;

  elseif ( n < x )

    pdf = 0.0;

  elseif ( m < x )

    pdf = 0.0;

  elseif ( l < x )

    pdf = 0.0;

  elseif ( n == 0 )

    if ( x == 0 )
      pdf = 1.0;
    else
      pdf = 0.0;
    end

  else

    c1 = binomial_coef_log (   m,   x );
    c2 = binomial_coef_log ( l-m, n-x );
    c3 = binomial_coef_log ( l,   n   );

    pdf_log = c1 + c2 - c3;

    pdf = exp ( pdf_log );

  end

  return
end
