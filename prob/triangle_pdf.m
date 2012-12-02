function pdf = triangle_pdf ( x, a, b, c )

%*****************************************************************************80
%
%% TRIANGLE_PDF evaluates the Triangle PDF.
%
%  Discussion:
%
%    Given points A <= B <= C, the probability is 0 to the left of A,
%    rises linearly to a maximum of 2/(C-A) at B, drops linearly to zero
%    at C, and is zero for all values greater than C.
%
%  Formula:
%
%    PDF(A,B,C;X)
%      = 2 * ( X - A ) / ( B - A ) / ( C - A ) for A <= X <= B
%      = 2 * ( C - X ) / ( C - B ) / ( C - A ) for B <= X <= C.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%
%    Input, real A, B, C, the parameters of the PDF.
%    A <= B <= C and A < C.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x <= a )

    pdf = 0.0;

  elseif ( x <= b )

    if ( a == b )
      pdf = 0.0;
    else
      pdf = 2.0 * ( x - a ) / ( b - a ) / ( c - a );
    end

  elseif ( x <= c )

    if ( b == c )
      pdf = 0.0;
    else
      pdf = 2.0 * ( c - x ) / ( c - b ) / ( c - a );
    end

  else
    pdf = 0.0;
  end

  return
end
