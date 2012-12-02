function check = exponential_check ( a, b )

%*****************************************************************************80
%
%% EXPONENTIAL_CHECK checks the parameters of the Exponential CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 September 2004
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
  if ( b <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'EXPONENTIAL_CHECK - Fatal error!\n' );
    fprintf ( 1, '  B <= 0.0\n' );
    check = 0;
    return
  end

  check = 1;

  return
end
