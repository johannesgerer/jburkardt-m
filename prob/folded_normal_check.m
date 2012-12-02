function check = folded_normal_check ( a, b )

%*****************************************************************************80
%
%% FOLDED_NORMAL_CHECK checks the parameters of the Folded Normal CDF.
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
%    Input, real A, B, the parameters of the PDF.
%    0.0 <= A,
%    0.0 < B.
%
%    Output, logical CHECK, is true if the parameters are legal.
%
  if ( a < 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FOLDED_NORMAL_CHECK - Fatal error!\n' );
    fprintf ( 1, '  A < 0.\n' );
    check = 0;
    return
  end

  if ( b <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FOLDED_NORMAL_CHECK - Fatal error!\n' );
    fprintf ( 1, '  B <= 0.\n' );
    check = 0;
    return
  end

  check = 1;

  return
end
