function check = burr_check ( a, b, c, d )

%*****************************************************************************80
%
%% BURR_CHECK checks the parameters of the Burr CDF.
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
%    Input, real A, B, C, D, the parameters of the PDF.
%    0 < B,
%    0 < C.
%
%    Output, logical CHECK, is TRUE if the parameters are legal.
%
  if ( b <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BURR_CHECK - Fatal error!\n' );
    fprintf ( 1, '  B <= 0.\n' );
    check = 0;
    return
  end

  if ( c <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BURR_CHECK - Fatal error!\n' );
    fprintf ( 1, '  C <= 0.\n' );
    check = 0;
    return
  end

  check = 1;

  return
end
