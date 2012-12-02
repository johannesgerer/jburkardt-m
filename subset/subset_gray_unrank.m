function a = subset_gray_unrank ( rank, n )

%*****************************************************************************80
%
%% SUBSET_GRAY_UNRANK produces a subset of an N set of the given Gray code rank.
%
%  Example:
%
%    N = 4
%
%     Rank     A    
%    -----  -------
%
%        1  0 0 0 0
%        2  1 0 0 0
%        3  1 1 0 0
%        4  0 1 0 0
%        5  0 1 1 0
%        6  1 1 1 0
%        7  1 0 1 0
%        8  0 0 1 0
%        9  0 0 1 1
%       10  1 0 1 1
%       11  1 1 1 1
%       12  0 1 1 1
%       13  0 1 0 1
%       14  1 1 0 1
%       15  1 0 0 1
%       16  0 0 0 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    30 November 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer RANK, the rank of the subset in the Gray code ordering.
%
%    Input, integer N, the order of the total set from which
%    subsets will be drawn.
%
%    Output, integer A(N); A(I) is 1 if element I is in the set,
%    and 0 otherwise.
%
  gray = gray_unrank2 ( rank-1 );

  a = ui4_to_ubvec ( gray, n );

  return
end
