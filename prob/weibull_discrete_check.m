function check = weibull_discrete_check ( a, b )

%*****************************************************************************80
%
%% WEIBULL_DISCRETE_CHECK checks the parameters of the discrete Weibull CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 <= A <= 1.0,
%    0.0 < B.
%
%    Output, logical CHECK, is true if the parameters are legal.
%
  if ( a < 0.0 | 1.0 < a )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'WEIBULL_DISCRETE_CHECK - Fatal error!\n' );
    fprintf ( 1, '  A < 0 or 1 < A.\n' );
    check = 0;
    return
  end

  if ( b <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'WEIBULL_DISCRETE_CHECK - Fatal error!\n' );
    fprintf ( 1, '  B <= 0.\n' );
    check = 0;
    return
  end

  check = 1;

  return
end
