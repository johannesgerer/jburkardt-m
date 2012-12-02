function value = r4_ranf ( sw )

%*****************************************************************************80
%
%% R4_RANF is a driver for R4_RANDOM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2011
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Carter Bays, Stephen Durham,
%    Improving a Poor Random Number Generator,
%    ACM Transactions on Mathematical Software,
%    Volume 2, Number 1, March 1976, pages 59-64.
%
%  Parameters:
%
%    Input, real SW, chooses the action.
%    0.0 <= SW, compute and return the next random number.
%    0.0 > SW, print the internal table, and return the current (old)
%    random number.
%
%    Output, real VALUE, the random value.
%
  persistent ranold
  persistent t

  if ( isempty ( t ) )
    t = zeros ( 33, 1 );
  end

  if ( 0.0 <= sw || isempty ( ranold ) )

    value = r4_random ( t, 32 );
    ranold = value;

  end

  if ( sw < 0.0 )

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Current random number table:\n' );
    fprintf ( 1, '\n' );
    for i = 1 : 33
      fprintf ( 1, '  %2d  %15.10f\n', i, t(i) );
    end

    value = ranold;

  end

  return
end
