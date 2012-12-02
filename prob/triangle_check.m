function check = triangle_check ( a, b, c )

%*****************************************************************************80
%
%% TRIANGLE_CHECK checks the parameters of the Triangle CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, C, the parameters of the PDF.
%    A <= B <= C and A < C.
%
%    Output, logical TRIANGLE_CHECK, is true if the parameters are legal.
%
  if ( b < a )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGLE_CHECK - Fatal error!\n' );
    fprintf ( 1, '  B < A.\n' );
    check = 0;
    return
  end

  if ( c < b )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGLE_CHECK - Fatal error!\n' );
    fprintf ( 1, '  C < B.\n' );
    check = 0;
    return
  end

  if ( a == c )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGLE_CHECK - Fatal error!\n' );
    fprintf ( 1, '  A == C.\n' );
    check = 0;
    return
  end

  check = 1;

  return
end
