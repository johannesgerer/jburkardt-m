function check = cauchy_check ( a, b )

%*****************************************************************************80
%
%% CAUCHY_CHECK checks the parameters of the Cauchy CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 < B.
%
%    Output, logical CHECK, is TRUE if the parameters are legal.
%
  if ( b <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CAUCHY_CHECK - Fatal error!\n' );
    fprintf ( 1, '  B <= 0.\n' );
    check = 0;
    return
  end

  check = 1;

  return
end
