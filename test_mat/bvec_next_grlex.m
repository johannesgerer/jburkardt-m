function bvec = bvec_next_grlex ( n, bvec )

%*****************************************************************************80
%
%% BVEC_NEXT_GRLEX generates the next binary vector in GRLEX order.
%
%  Discussion:
%
%    N = 3
%
%    Input      Output
%    -----      ------
%    0 0 0  =>  0 0 1
%    0 0 1  =>  0 1 0
%    0 1 0  =>  1 0 0
%    1 0 0  =>  0 1 1
%    0 1 1  =>  1 0 1
%    1 0 1  =>  1 1 0
%    1 1 0  =>  1 1 1
%    1 1 1  =>  0 0 0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension.
%
%    Input, integer BVEC(N), the binary vector whose successor is desired.
%
%    Output, integer BVEC(N), the successor to the input vector.
%

%
%  Initialize locations of 0 and 1.
%
  if ( bvec(1) == 0 )
    z = 1;
    o = 0;
  else
    z = 0;
    o = 1;
  end
%
%  Moving from right to left, search for a "1", preceded by a "0".
%
  for i = n : -1 : 2
    if ( bvec(i) == 1 )
      o = i;
      if ( bvec(i-1) == 0 )
        z = i - 1;
        break
      end
    end
  end
%
%  BVEC = 0
%
  if ( o == 0 )
    bvec(n) = 1;
%
%  01 never occurs.  So for sure, B(1) = 1.
%
  elseif ( z == 0 )
    s = sum ( bvec(1:n) );
    if ( s == n )
      bvec(1:n) = 0;
    else
      bvec(1:n-s-1) = 0;
      bvec(n-s:n) = 1;
    end
%
%  Found the rightmost "01" string.
%  Replace it by "10", and shift following 1's to end.
%
  else
    bvec(z) = 1;
    bvec(o) = 0;
    s = sum ( bvec(o+1:n) );
    bvec(o+1:n-s) = 0;
    bvec(n+1-s:n) = 1;
  end

  return
end

