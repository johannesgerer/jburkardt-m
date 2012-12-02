function pdf = discrete_pdf ( x, a, b )

%*****************************************************************************80
%
%% DISCRETE_PDF evaluates the Discrete PDF.
%
%  Discussion:
%
%    PDF(X)(A,B) = B(X) if 1 <= X <= A
%                = 0    otherwise
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X, the item whose probability is desired.
%
%    Input, integer A, the number of probabilities assigned.
%
%    Input, real B(A), the relative probabilities of
%    outcomes 1 through A.  Each entry must be nonnegative.
%
%    Output, real PDF, the value of the PDF.
%
  b_sum = sum ( b(1:a) );

  if ( 1 <= x & x <= a )
    pdf = b(x) / b_sum;
  else
    pdf = 0.0;
  end

  return
end
