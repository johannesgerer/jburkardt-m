function pdf = geometric_pdf ( x, a )

%*****************************************************************************80
%
%% GEOMETRIC_PDF evaluates the Geometric PDF.
%
%  Discussion:
%
%    PDF(X)(A) = A * ( 1 - A )**(X-1)
%
%    PDF(X)(A) is the probability that exactly X Bernoulli trials, each
%    with probability of success A, will be required to achieve
%    a single success.
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
%    Input, integer X, the number of trials.
%    0 < X
%
%    Input, real A, the probability of success on one trial.
%    0.0 <= A <= 1.0.
%
%    Output, real PDF, the value of the PDF.
%

%
%  Special cases.
%
  if ( x < 1 )

    pdf = 0.0;

  elseif ( a == 0.0 )

    pdf = 0.0;

  elseif ( a == 1.0 )

    if ( x == 1 )
      pdf = 1.0;
    else
      pdf = 0.0;
    end

  else

    pdf = a * ( 1.0 - a )^( x - 1 );

  end

  return
end
