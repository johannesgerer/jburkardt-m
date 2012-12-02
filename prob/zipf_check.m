function check = zipf_check ( a )

%*****************************************************************************80
%
%% ZIPF_CHECK checks the parameter of the Zipf PDF.
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
%    Input, real A, the parameter of the PDF.
%    1.0 < A.
%
%    Output, logical CHECK, is true if the parameters are legal.
%
  if ( a <= 1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ZIPF_CHECK - Fatal error!\n' );
    fprintf ( 1, '  A <= 1.\n' );
    check = 0;
    return
  end

  check = 1;

  return
end
