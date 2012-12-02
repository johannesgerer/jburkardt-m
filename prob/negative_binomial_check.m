function check = negative_binomial_check ( a, b )

%*****************************************************************************80
%
%% NEGATIVE_BINOMIAL_CHECK checks the parameters of the Negative Binomial PDF.
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
%    Input, integer A, a parameter of the PDF.
%    0 <= A.
%
%    Input, real B, a parameter of the PDF.
%    0 < B <= 1.
%
%    Output, logical CHECK, is true if the parameters are legal.
%
  if ( a < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NEGATIVE_BINOMIAL_CHECK - Fatal error!\n' );
    fprintf ( 1, '  A < 0.\n' );
    check = 0;
    return
  end

  if ( b <= 0.0 | 1.0 < b )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NEGATIVE_BINOMIAL_CHECK - Fatal error!\n' );
    fprintf ( 1, '  B <= 0 or 1 < B.\n' );
    check = 0;
    return
  end

  check = 1;

  return
end
