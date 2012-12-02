function check = arcsin_check ( a )

%*****************************************************************************80
%
%% ARCSIN_CHECK checks the parameter of the Arcsin CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, the parameter of the PDF.
%    0.0 < A.
%
%    Output, logical CHECK, is TRUE if the parameters are OK.
%
  if ( a <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ARCSIN_CHECK - Fatal error!\n' );
    fprintf ( 1, '  A <= 0.\n' );
    check = 0;
  else
    check = 1;
  end

  return
end
