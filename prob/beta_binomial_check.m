function check = beta_binomial_check ( a, b, c )

%*****************************************************************************80
%
%% BETA_BINOMIAL_CHECK checks the parameters of the Beta Binomial PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, parameters of the PDF.
%    0.0D+00 < A,
%    0.0D+00 < B.
%
%    Input, integer C, a parameter of the PDF.
%    0 <= C.
%
%    Output, logical CHECK, is TRUE if the parameters are OK.
%
  if ( a <= 0.0D+00 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BETA_BINOMIAL_CHECK - Fatal error!\n' );
    fprintf ( 1, '  A <= 0.\n' );
    check = 0;
    error ( 'BETA_BINOMIAL_CHECK - Fatal error!' );
  end

  if ( b <= 0.0D+00 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BETA_BINOMIAL_CHECK - Fatal error!\n' );
    fprintf ( 1, '  B <= 0.\n' );
    check = 0;
    error ( 'BETA_BINOMIAL_CHECK - Fatal error!' );
  end

  if ( c < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BETA_BINOMIAL_CHECK - Fatal error!\n' );
    fprintf ( 1, '  C < 0.\n' );
    check = 0;
    error ( 'BETA_BINOMIAL_CHECK - Fatal error!' );
  end

  check = 1;

  return
end
