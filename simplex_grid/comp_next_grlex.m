function xc = comp_next_grlex ( kc, xc )

%*****************************************************************************80
%
%% COMP_NEXT_GRLEX returns the next composition in grlex order.
%
%  Discussion:
%
%    Example:
%
%    D = 3
%
%    #   XC(1) XC(2) XC(3)  Degree
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
%    11 December 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer KC, the number of parts of the composition.
%
%    Input, integer XC(KC), the current composition.
%    The lowest order composition is XC = [ 0, 0, ..., 0, 0 ].
%
%    Output, integer XC(KC), the next composition.
%

%
%  Ensure that 1 <= KC.
%
  if ( kc < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'COMP_NEXT_GRLEX - Fatal error!' );
    fprintf ( 1, '  KC < 1\n' );
    error ( 'COMP_NEXT_GRLEX - Fatal error!' );
  end
%
%  Ensure that 0 <= XC(I).
%
  for i = 1 : kc
    if ( xc(i) < 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'COMP_NEXT_GRLEX - Fatal error!' );
      fprintf ( 1, '  XC(I) < 0\n' );
      error ( 'COMP_NEXT_GRLEX - Fatal error!' );
    end
  end
%
%  Find I, the index of the rightmost nonzero entry of XC.
%
  i = 0;
  for j = kc : -1 : 1
    if ( 0 < xc(j) )
      i = j;
      break
    end
  end    
%
%  set T = XC(I)
%  set XC(I) to zero,
%  increase XC(I-1) by 1,
%  increment XC(KC) by T-1.
%
  if ( i == 0 )
    xc(kc) = 1;
    return
  elseif ( i == 1 )
    t = xc(1) + 1;
    im1 = kc;
  elseif ( 1 < i )
    t = xc(i);
    im1 = i - 1;
  end

  xc(i) = 0;
  xc(im1) = xc(im1) + 1;
  xc(kc) = xc(kc) + t - 1;

  return
end
