function check = reciprocal_check ( a, b )

%*****************************************************************************80
%
%% RECIPROCAL_CHECK checks the parameters of the Reciprocal CDF.
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
%    Input, real A, B, the parameters of the PDF.
%    0.0 < A <= B.
%
%    Output, logical CHECK, is true if the parameters are legal.
%
  if ( a <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'RECIPROCAL_CHECK - Fatal error!\n' );
    fprintf ( 1, '  A <= 0.0\n' );
    check = 0;
    return
  end

  if ( b < a ) then
    fprintf ( 1, '\n' );
    fprintf ( 1, 'RECIPROCAL_CHECK - Fatal error!\n' );
    fprintf ( 1, '  B < A\n' );
    check = 0;
    return
  end

  check = 1;

  return
end
