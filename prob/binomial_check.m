function check = binomial_check ( a, b )

%*****************************************************************************80
%
%% BINOMIAL_CHECK checks the parameter of the Binomial PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer A, the number of trials.
%    1 <= A.
%
%    Input, real B, the probability of success on one trial.
%    0.0 <= B <= 1.0.
%
%    Output, logical CHECK, is TRUE if the parameters are legal.
%
  if ( a < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BINOMIAL_CHECK - Fatal error!\n' );
    fprintf ( 1, '  A < 1.\n' );
    check = 0;
    return
  end

  if ( b < 0.0 | 1.0 < b )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BINOMIAL_CHECK - Fatal error!\n' );
    fprintf ( 1, '  B < 0 or 1 < B.\n' );
    check = 0;
    return
  end

  check = 1;

  return
end
