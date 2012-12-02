function check = bernoulli_check ( a )

%*****************************************************************************80
%
%% BERNOULLI_CHECK checks the parameter of the Bernoulli CDF.
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
%    Input, real A, the parameter of the PDF.
%    0.0D+00 <= A <= 1.0.
%
%    Output, logical CHECK, is TRUE if the parameters are OK.
%
  if ( a < 0.0 | 1.0 < a )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BERNOULLI_CHECK - Fatal error!\n' );
    fprintf ( 1, '  A < 0 or 1 < A.\n' );
    check = 0;
  else
    check = 1;
  end

  return
end
