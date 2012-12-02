function value = fibonacci ( k )

%*****************************************************************************80
%
%% FIBONACCI returns the Fibonacci number of given index.
%
%  Example:
%
%    K   Fibonacci
%
%    0   0
%    1   1
%    2   1
%    3   2
%    4   3
%    5   5
%    6   8
%    7  13
%    8  21
%    9  34
%   10  55
%   11  89
%   12 144
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 November 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer K, the index of the Fibonacci number to be used.
%    K must be at least 1.
%
%    Output, integer VALUE, the value of the K-th Fibonacci number.
%
  if ( k < 0 )
    vallue = - i4_huge ( );
    return
  elseif ( k == 0 )
    value = 0;
    return
  elseif ( k == 1 )
    value = 1;
    return
  end

  c = 0;
  b = 0;
  a = 1;

  for kk = 2 : k

    c = b;
    b = a;
    a = c + b;

  end

  value = a;

  return
end
