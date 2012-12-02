function value = lcm_12n ( n )

%*****************************************************************************80
%
%% LCM_12N computes the least common multiple of the integers 1 through N.
%
%  Example:
%
%    N    LCM_12N
%
%    1          1
%    2          2
%    3          3
%    4         12
%    5         60
%    6         60
%    7        420
%    8        840
%    9       2520
%   10       2520
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the value of N.
%
%    Output, integer VALUE, the least common multiple of the integers 1 to N.
%
  value = 1;

  for i = 2 : n

    imult = i;

    for j = 1 : i-1

      if ( mod ( imult, (i-j) ) == 0 )
        imult = floor ( imult / ( i - j ) );
      end

    end

    value = value * imult;

  end

  return
end
