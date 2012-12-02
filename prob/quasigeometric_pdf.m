function pdf = quasigeometric_pdf ( x, a, b )

%*****************************************************************************80
%
%% QUASIGEOMETRIC_PDF evaluates the Quasigeometric PDF.
%
%  Discussion:
%
%    PDF(A,B;X) =    A                     if 0  = X;
%               = (1-A) * (1-B) * B^(X-1)  if 1 <= X.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Darren Glass, Philip Lowry,
%    Quasiquasigeometric Distributions and Extra Inning Baseball Games,
%    Mathematics Magazine,
%    Volume 81, Number 2, April 2008, pages 127-137.
%
%    Paul Nahin,
%    Digital Dice: Computational Solutions to Practical Probability Problems,
%    Princeton University Press, 2008,
%    ISBN13: 978-0-691-12698-2,
%    LC: QA273.25.N34.
%
%  Parameters:
%
%    Input, integer X, the independent variable.
%    0 <= X
%
%    Input, real A, the probability of 0 successes.
%    0.0 <= A <= 1.0.
%
%    Input, real B, the depreciation constant.
%    0.0 <= B < 1.0.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x < 0 )

    pdf = 0.0;

  elseif ( x == 0 )

    pdf = a;

  elseif ( b == 0.0 )

    if ( x == 1 )
      pdf = 1.0;
    else
      pdf = 0.0;
    end

  else

    pdf = ( 1.0 - a ) * ( 1.0 - b ) * b^( x - 1 );

  end

  return
end
