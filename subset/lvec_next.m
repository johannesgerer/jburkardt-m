function lvec = lvec_next ( n, lvec )

%*****************************************************************************80
%
%% LVEC_NEXT generates the next logical vector.
%
%  Discussion:
%
%    In the following discussion, we will let '0' stand for FALSE and
%    '1' for TRUE.
%
%    The vectors have the order
%
%      (0,0,...,0),
%      (0,0,...,1),
%      ...
%      (1,1,...,1)
%
%    and the "next" vector after (1,1,...,1) is (0,0,...,0).  That is,
%    we allow wrap around.
%
%    Since MATLAB does not support a LOGICAL type, we end up actually
%    simply manipulating integers.
%
%  Example:
%
%    N = 3
%
%    Input      Output
%    -----      ------
%    0 0 0  =>  0 0 1
%    0 0 1  =>  0 1 0
%    0 1 0  =>  0 1 1
%    0 1 1  =>  1 0 0
%    1 0 0  =>  1 0 1
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
%    31 May 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the vectors.
%
%    Input, logical LVEC(N), the vector whose successor is desired.
%
%    Output, logical LVEC(N), the successor to the input vector.
%
  for i = n : -1 : 1

    if ( lvec(i) == 0 )
      lvec(i) = 1;
      return
    end

    lvec(i) = 0;

  end

  return
end

