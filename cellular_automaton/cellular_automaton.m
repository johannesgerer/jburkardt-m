function cellular_automaton ( n, step_num )

%*****************************************************************************80
%
%% CELLULAR_AUTOMATON demonstrates a cellular automaton based on rule #30.
%
%  Discussion:
%
%    This program carries out iterations of the 1D cellular automaton
%    known as rule 30.
%
%    Given an initial linear array of 0's and 1's, rule 30 produces a new
%    array using the rules:
%
%      111  110  101  100  011  010  001  000
%       V    V    V    V    V    V    V    V
%       0    0    0    1    1    1    1    0     
%
%    Note that there are 256 = 2^8 possible ways to fill in this output
%    chart, and that rule 30 gets its index by the fact that
%    (0,0,0,1,1,1,1,0) can be interpreted as the binary representation of 30.
%
%    For instance, if the current values of X(4), X(5) and X(6) are
%    0, 1 and 1, respectively, then the new value of X(5) will be 1.
%
%    The first and last entries of the array must be treated specially, since
%    they don't have a left or right neighbor.  One simple treatment is 
%    to assume that there are phantom neighbors whose values are both 0.
%    Another is to enforce periodic boundary conditions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Stephen Wolfram,
%    A New Kind of Science,
%    Wolfram Media, 2002,
%    ISBN13: 978-1579550080,
%    LC: QA267.5.C45.W67.
%
%  Parameters:
%
%    Input, integer N, the number of cells.  Default is 80.
%
%    Input, integer STEP_NUM, the number of steps.  Default is 80.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CELLULAR_AUTOMATON:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Given a cellular automaton of N cells, take S steps.\n' );

  if ( nargin < 1 )
    n = 80;
  end

  if ( nargin < 2 )
    step_num = 80;
  end

  x = blanks ( n + 2 );
  x_old = blanks ( n + 2 );

  x(41) = '*';
  fprintf ( 1, '%s\n', x(2:n-1) );

  for j = 1 : step_num

    x_old(1:n+2) = x(1:n+2);

    for i = 2 : n + 1
%
%  The transformation rules are:
%
%  111  110  101  100  011  010  001  000
%   |    |    |    |    |    |    |    |
%   0    0    0    1    1    1    1    0
%
%  which means this rule has binary code 00011110 = 16 + 8 + 4 + 2 = 30
%
      if ( ( x_old(i-1) == ' ' &&   ...
             x_old(i)   == ' ' &&   ...
             x_old(i+1) == '*' ) || ...
           ( x_old(i-1) == ' ' &&   ...
             x_old(i)   == '*' &&   ...
             x_old(i+1) == ' ' ) || ...
           ( x_old(i-1) == ' ' &&   ...
             x_old(i)   == '*' &&   ...
             x_old(i+1) == '*' ) || ...
           ( x_old(i-1) == '*' &&   ...
             x_old(i)   == ' ' &&   ...
             x_old(i+1) == ' ' ) )
        x(i) = '*';
      else
        x(i) = ' ';
      end

    end
%
%  Enforce periodic boundary conditions.
%
    x(1) = x(n+1);
    x(n+2) = x(2);

    fprintf ( 1, '%s\n', x(2:n-1) );

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CELLULAR_AUTOMATON:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( )

  return
end

