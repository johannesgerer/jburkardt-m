function pdf = planck_pdf ( x, a, b )

%*****************************************************************************80
%
%% PLANCK_PDF evaluates the Planck PDF.
%
%  Discussion:
%
%    The Planck PDF has the form
%
%      PDF(A,B;X) = A**(B+1) * X**B / ( exp ( A * X ) - 1 ) / K
%
%    where K is the normalization constant, and has the value
%
%      K = Gamma ( B + 1 ) * Zeta ( B + 1 ).
%
%    The original Planck distribution governed the frequencies in
%    blackbody radiation at a given temperature T, and has the form
%
%      PDF(A;X) = K * X**3 / ( exp ( A * X ) - 1 )
%
%    where 
%
%      K = 15 / PI**4.
%
%    Thus, in terms of the Planck PDF, the original Planck distribution
%    has A = 1, B = 3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 August 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%    0.0 <= X
%
%    Input, double A, B, the parameters of the PDF.
%    0.0 < A,
%    0.0 < B.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x < 0.0 ) 
    pdf = 0.0;
  else
    k = gamma ( b + 1.0 ) * zeta ( b + 1.0 );
    pdf = a^( b + 1.0 ) * x^b / ( exp ( a * x ) - 1.0 ) / k;
  end

  return
end
