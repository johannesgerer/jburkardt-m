function check = gompertz_check ( a, b )

%*****************************************************************************80
%
%% GOMPERTZ_CHECK checks the parameters of the Gompertz PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Johnson, Kotz, and Balakrishnan,
%    Continuous Univariate Distributions, Volume 2, second edition,
%    Wiley, 1994, pages 25-26.
%
%  Parameters:
%
%    Input, real A, B, the parameters of the PDF.
%    1 < A, 0 < B.
%
%    Output, logical CHECK, is true if the parameters are legal.
%
  if ( a <= 1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GOMPERTZ_CHECK - Fatal error!\n' );
    fprintf ( 1, '  A <= 1.0!\n' );
    check = 0;
    return
  end

  if ( b <= 0.0D+00 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GOMPERTZ_CHECK - Fatal error!\n' );
    fprintf ( 1, '  B <= 0.0!\n' );
    check = 0;
    return
  end

  check = 1;

  return
end
