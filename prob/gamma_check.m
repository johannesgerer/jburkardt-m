function check = gamma_check ( a, b, c )

%*****************************************************************************80
%
%% GAMMA_CHECK checks the parameters of the Gamma PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, C, the parameters of the PDF.
%    0.0 < B,
%    0.0 < C.
%
%    Output, logical CHECK, is true if the parameters are legal.
%
  if ( b <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GAMMA_CHECK - Fatal error!\n' );
    fprintf ( 1, '  B <= 0.\n' );
    fprintf ( 1, '  B = %f\n', b );
    check = 0;
    return
  end

  if ( c <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GAMMA_CHECK - Fatal error!\n' );
    fprintf ( 1, '  C <= 0.\n' );
    fprintf ( 1, '  C = %f\n', c );
    check = 0;
    return
  end

  check = 1;

  return
end
