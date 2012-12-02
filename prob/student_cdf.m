function cdf = student_cdf ( x, a, b, c )

%*****************************************************************************80
%
%% STUDENT_CDF evaluates the central Student T CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the CDF.
%
%    Input, real A, B, shape parameters of the PDF,
%    used to transform the argument X to a shifted and scaled 
%    value Y = ( X - A ) / B.  It is required that B be nonzero.
%    For the standard distribution, A = 0 and B = 1.
%
%    Input, real C, is usually called the number of 
%    degrees of freedom of the distribution.  C is typically an 
%    integer, but that is not essential.  It is required that
%    C be strictly positive.
%
%    Output, real CDF, the value of the CDF.
%
  y = ( x - a ) / b;

  a2 = 0.5 * c;
  b2 = 0.5;
  c2 = c / ( c + y * y );

  if ( y <= 0.0 )
    cdf = 0.5 * beta_inc ( a2, b2, c2 );
  else
    cdf = 1.0 - 0.5 * beta_inc ( a2, b2, c2 );
  end

  return
end
