function bvec = bvec_next ( n, bvec )

%*****************************************************************************80
%
%% BVEC_NEXT generates the next binary vector.
%
%  Discussion:
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
%    03 May 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the vectors.
%
%    Input, integer BVEC(N), the vector whose successor is desired.
%
%    Output, integer BVEC(N), the successor to the input vector.
%
  for i = n : -1 : 1

    if ( bvec(i) == 0 )
      bvec(i) = 1;
      return
    end

    bvec(i) = 0;

  end

  return
end

