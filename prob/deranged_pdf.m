function pdf = deranged_pdf ( x, a )

%*****************************************************************************80
%
%% DERANGED_PDF evaluates the Deranged PDF.
%
%  Discussion:
%
%    PDF(X)(A) is the probability that exactly X items will occur in
%    their proper place after a random permutation of A items.
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
%    Input, integer X, the number of items in their correct places.
%    0 <= X <= A.
%
%    Input, integer A, the total number of items.
%    1 <= A.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x < 0 | a < x )
    pdf = 0.0;
  else
    cnk = binomial_coef ( a, x );
    dnmk = deranged_enum ( a-x );
    nfact = i4_factorial ( a );
    pdf = cnk * dnmk / nfact;
  end

  return
end
