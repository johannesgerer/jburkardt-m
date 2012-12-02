function [ x, seed ] = student_sample ( a, b, c, seed )

%*****************************************************************************80
%
%% STUDENT_SAMPLE samples the central Student T PDF.
%
%  Discussion:
%
%    For the sampling algorithm, it is necessary that 2 < C.
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
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X, a sample of the PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  if ( c <= 2.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'STUDENT_SAMPLE - Fatal error!\n' );
    fprintf ( 1, '  Sampling fails for C <= 2.\n' )
    error ( 'STUDENT_SAMPLE - Fatal error!' );
  end

  a2 = 0.0;
  b2 = c / ( c - 2.0 );

  [ x2, seed ] = normal_sample ( a2, b2, seed );

  a3 = c;
  [ x3, seed ] = chi_square_sample ( a3, seed );
  x3 = x3 * c / ( c - 2.0 );

  x = a + b * x2 * sqrt ( c ) / x3;

  return
end
