function ytb_num = ytb_enum ( n )

%*****************************************************************************80
%
%% YTB_ENUM enumerates the Young tableaus of size N.
%
%  Discussion:
%
%    If A(N) is the number of Young tableau of size N, then A(1) = 1,
%    A(2) = 2, and
%
%    A(N) = A(N-1) + (N-1) * A(N-2).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the integer which is to be partitioned.
%
%    Output, integer YTB_NUM, the number of Young tableaus of N.
%
  if ( n <= 0 )
    ytb_num = 0;
  elseif ( n == 1 )
    ytb_num = 1;
  elseif ( n == 2 )
    ytb_num = 2;
  else
    a2 = 1;
    a3 = 2;
    for i = 3 : n
      a1 = a2;
      a2 = a3;
      a3 = a2 + ( i - 1 ) * a1;
    end
    ytb_num = a3;
  end

  return
end
