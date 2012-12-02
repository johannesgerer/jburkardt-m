function variance = student_variance ( a, b, c )

%*****************************************************************************80
%
%% STUDENT_VARIANCE returns the variance of the central Student T PDF.
%
%  Discussion:
%
%    For the variance to exist, it is necessary that 2 < C.
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
%    Output, real VARIANCE, the variance of the PDF.
%
  if ( c <= 2.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'STUDENT_VARIANCE - Fatal error!\n' );
    fprintf ( 1, '  Variance not defined for C <= 2.\n' );
    error ( 'STUDENT_VARIANCE - Fatal error!' );
  end

  variance = b * b * c / ( c - 2.0 );

  return
end
