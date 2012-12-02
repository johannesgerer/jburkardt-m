function check = sech_check ( a, b )

%*****************************************************************************80
%
%% SECH_CHECK checks the parameters of the Hyperbolic Secant CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the parameter of the PDF.
%    0.0 < B.
%
%    Output, logical CHECK, is true if the parameters are legal.
%
  if ( b <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SECH_CHECK - Fatal error!\n' );
    fprintf ( 1, '  B <= 0.0\n' );
    check = 0;
    return
  end

  check = 1;

  return
end
