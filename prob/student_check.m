function check = student_check ( a, b, c )

%*****************************************************************************80
%
%% STUDENT_CHECK checks the parameter of the central Student T CDF.
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
%    Output, logical CHECK, is true if the parameters are legal.
%
  if ( b == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'STUDENT_CHECK - Fatal error!\n' );
    fprintf ( 1, '  B must be nonzero.\n' );
    check = 0;
    return
  end

  if ( c <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'STUDENT_CHECK - Fatal error!\n' );
    fprintf ( 1, '  C must be greater than 0.\n' );
    check = 0;
    return
  end

  check = 1;

  return
end
