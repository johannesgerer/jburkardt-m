function value = summer ( alpha, beta )

%*****************************************************************************80
%
%% SUMMER computes the sum of arguments ALPHA and BETA.
%
%  Discussion:
%
%    This function is simply used to illustrate that, if a function is
%    written properly, it can handle being called in several different
%    ways.
%
%    We can call with commandline arguments:
%      value = summer
%      or
%      value = summer 2
%      or
%      value = summer 2 4
%    or with functional arguments:
%      value = summer ( )
%      or
%      value = summer ( 2 )
%      or
%      value = summer ( 2, 4 )
%    as long as the arguments are processed correctly.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 April 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, BETA, two values to be added.
%
%    Output, real VALUE, the sum.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'value = summer ( alpha, beta )\n' )
  fprintf ( 1, 'is a function which adds two arguments.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  summer() has been called with %d arguments\n', nargin );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ALPHA (input argument):\n' );
  fprintf ( 1, '\n' );
  if ( nargin < 1 )
    fprintf ( 1, '  ALPHA was not supplied as input.\n' );
    alpha = input ( '  Please enter the value of the alpha argument: ' );
  elseif ( ischar ( alpha ) )
    fprintf ( 1, '  ALPHA was supplied as commandline input.\n' );
    fprintf ( 1, '  It had to be converted from string to number.\n' );
    alpha = str2num ( alpha );
  else
    fprintf ( 1, '  ALPHA was supplied as a functional input.\n' );
    fprintf ( 1, '  No conversion was necessary.\n' );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The value of ALPHA is %g\n', alpha );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BETA (input argument):\n' );
  fprintf ( 1, '\n' );
  if ( nargin < 2 )
    fprintf ( 1, '  BETA was not supplied as input.\n' );
    beta = input ( '  Please enter the value of the beta argument: ' );
  elseif ( ischar ( beta ) )
    fprintf ( 1, '  BETA was supplied as commandline input.\n' );
    fprintf ( 1, '  It had to be converted from string to number.\n' );
    beta = str2num ( beta );
  else
    fprintf ( 1, '  BETA was supplied as a functional input.\n' );
    fprintf ( 1, '  No conversion was necessary.\n' );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The value of BETA is %g\n', beta );

  value = alpha + beta;

  return
end
