function pdf = beta_pdf ( x, a, b )

%*****************************************************************************80
%
%% BETA_PDF evaluates the Beta PDF.
%
%  Discussion:
%
%    PDF(X)(A,B) = X**(A-1) * (1-X)**(B-1) / BETA(A,B).
%
%    A = B = 1 yields the Uniform distribution on [0,1].
%    A = B = 1/2 yields the Arcsin distribution.
%        B = 1 yields the power function distribution.
%    A = B -> Infinity tends to the Normal distribution.
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
%    Input, real X, the argument of the PDF.
%    0.0 <= X <= 1.0.
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 < A,
%    0.0 < B.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x < 0.0 | 1.0 < x )
    pdf = 0.0;
  else
    pdf = x^( a - 1.0 ) * ( 1.0 - x )^( b - 1.0 ) / beta ( a, b );
  end

  return
end
