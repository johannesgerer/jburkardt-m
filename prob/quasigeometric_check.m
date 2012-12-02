function check = quasigeometric_check ( a, b )

%*****************************************************************************80
%
%% QUASIGEOMETRIC_CHECK checks the parameters of the Quasigeometric CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, the probability of 0 successes.
%    0.0 <= A <= 1.0.
%
%    Input, real B, the depreciation constant.
%    0.0 <= B < 1.0.
%
%    Output, logical QUASIGEOMETRIC_CHECK, is true if the parameters are legal.
%
  if ( a < 0.0 | 1.0 < a )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'QUASIGEOMETRIC_CHECK - Fatal error!\n' );
    fprintf ( 1, '  A < 0 or 1 < A.\n' );
    quasigeometric_check = 0;
    error ( 'QUASIGEOMETRIC_CHECK - Fatal error!' );
  end

  if ( b < 0.0 | 1.0 <= b )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'QUASIGEOMETRIC_CHECK - Fatal error!\n' );
    fprintf ( 1, '  B < 0 or 1 <= B.\n' );
    quasigeometric_check = 0;
    error ( 'QUASIGEOMETRIC_CHECK - Fatal error!' );
  end

  check = 1;

  return
end
