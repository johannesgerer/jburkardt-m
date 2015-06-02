function x = mono_next_grlex ( d, x )

%*****************************************************************************80
%
%% MONO_NEXT_GRLEX: grlex next monomial.
%
%  Discussion:
%
%    Example:
%
%    D = 3
%
%    #  X(1)  X(2)  X(3)  Degree
%      +------------------------
%    1 |  0     0     0        0
%      |
%    2 |  0     0     1        1
%    3 |  0     1     0        1
%    4 |  1     0     0        1
%      |
%    5 |  0     0     2        2
%    6 |  0     1     1        2
%    7 |  0     2     0        2
%    8 |  1     0     1        2
%    9 |  1     1     0        2
%   10 |  2     0     0        2
%      |
%   11 |  0     0     3        3
%   12 |  0     1     2        3
%   13 |  0     2     1        3
%   14 |  0     3     0        3
%   15 |  1     0     2        3
%   16 |  1     1     1        3
%   17 |  1     2     0        3
%   18 |  2     0     1        3
%   19 |  2     1     0        3
%   20 |  3     0     0        3
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 December 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer D, the spatial dimension.
%
%    Input, integer X(D), the current monomial.
%    The first item is X = [ 0, 0, ..., 0, 0 ].
%
%    Output, integer X(D), the next monomial.
%

%
%  Ensure that 1 <= D.
%
  if ( d < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MONO_NEXT_GRLEX - Fatal error!' );
    fprintf ( 1, '  D < 1\n' );
    error ( 'MONO_NEXT_GRLEX - Fatal error!' );
  end
%
%  Ensure that 0 <= XC(I).
%
  for i = 1 : d
    if ( x(i) < 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'MONO_NEXT_GRLEX - Fatal error!' );
      fprintf ( 1, '  X(I) < 0\n' );
      error ( 'MONO_NEXT_GRLEX - Fatal error!' );
    end
  end
%
%  Find I, the index of the rightmost nonzero entry of X.
%
  i = 0;
  for j = d : -1 : 1
    if ( 0 < x(j) )
      i = j;
      break
    end
  end    
%
%  set T = X(I)
%  set X(I) to zero,
%  increase X(I-1) by 1,
%  increment X(D) by T-1.
%
  if ( i == 0 )
    x(d) = 1;
    return
  elseif ( i == 1 )
    t = x(1) + 1;
    im1 = d;
  elseif ( 1 < i )
    t = x(i);
    im1 = i - 1;
  end

  x(i) = 0;
  x(im1) = x(im1) + 1;
  x(d) = x(d) + t - 1;

  return
end
