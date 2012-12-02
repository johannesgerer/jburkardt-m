function pdf = binomial_pdf ( x, a, b )

%*****************************************************************************80
%
%% BINOMIAL_PDF evaluates the Binomial PDF.
%
%  Discussion:
%
%    PDF(X)(A,B) is the probability of exactly X successes in A trials,
%    given that the probability of success on a single trial is B.
%
%    PDF(X)(A,B) = C(N,X) * B**X * ( 1.0D+00 - B )**( A - X )
%
%    Binomial_PDF(X)(1,B) = Bernoulli_PDF(X)(B).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X, the desired number of successes.
%    0 <= X <= A.
%
%    Input, integer A, the number of trials.
%    1 <= A.
%
%    Input, real B, the probability of success on one trial.
%    0.0 <= B <= 1.0.
%
%    Output, real PDF, the value of the PDF.
%
  if ( a < 1 ) then

    pdf = 0.0;

  elseif ( x < 0 | a < x )

    pdf = 0.0

  elseif ( b == 0.0 )

    if ( x == 0 )
      pdf = 1.0;
    else
      pdf = 0.0;
    end

  elseif ( b == 1.0 )

    if ( x == a )
      pdf = 1.0;
    else
      pdf = 0.0;
    end

  else

    cnk = binomial_coef ( a, x );

    pdf = cnk * b^x * ( 1.0 - b )^( a - x );

  end

  return
end
