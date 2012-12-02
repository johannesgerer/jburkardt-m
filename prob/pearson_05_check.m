function check = pearson_05_check ( a, b, c )

%*****************************************************************************80
%
%% PEARSON_05_CHECK checks the parameters of the Pearson 5 PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, C, the parameters of the PDF.
%    0.0 < A, 0.0 < B.
%
%    Output, logical CHECK, is true if the parameters are legal.
%
  if ( a <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PEARSON_05_CHECK - Fatal error!\n' );
    fprintf ( 1, '  A <= 0.\n' );
    check = 0;
    return
  end

  if ( b <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PEARSON_05_CHECK - Fatal error!\n' );
    fprintf ( 1, '  B <= 0.\n' );
    check = 0;
    return
  end

  check = 1;

  return
end
