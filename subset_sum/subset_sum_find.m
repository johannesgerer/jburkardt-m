function [ c, index ] = subset_sum_find ( w, t, r )

%*****************************************************************************80
%
%% SUBSET_SUM_FIND seeks a subset of a set that has a given sum.
%
%  Discussion:
%
%    This function tries to compute a target value as the sum of
%    a selected subset of a given set of weights.
%
%    This function works by brute force, that is, it tries every
%    possible subset to see if it sums to the desired value.
%
%    Given N weights, every possible selection can be described by
%    one of the N-digit binary numbers from 0 to 2^N-1.
%
%    This function includes a range, which allows the user to
%    control which subsets are to be checked.  Thus, if there are
%    N weights, specifying a range of [ 0, 2^N-1] indicates that
%    all subsets should be checked.  On the other hand, this full
%    range could be broken down into smaller subranges, each of
%    which could be checked independently.
%
%    It is possible that, in the given range, there may be multiple
%    solutions of the problem.  This function will only return
%    one such solution, if found.  However, the function may be called
%    again, with an appropriate restriction of the range, to continue
%    the search for other solutions.
%
%  Example:
%
%    w = [ 1, 2, 4, 8, 16, 32 ];
%    t = 22;
%    r = [ 0, 2^6 - 1 ];
%
%    [ c, index ] = subset_sum ( w, t, r )
%
%    c = [ 2, 3, 5 ]
%    index = 22
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 December 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer W(N), a set of weights.  The length of this
%    array must be no more than 31.
%
%    Input, integer T, the target value.
%
%    Input, integer R(2), the lower and upper limits to be searched.
%    If this argument is omitted, the entire range, [0, 2^N-1 ] will
%    be searched.
%
%    Output, integer C(*), the indices of the weights used to
%    make the combination.  This array is empty if no solution was found.
%    Otherwise, the list of weights used to form the sum is
%    W(C).
%
%    Output, integer INDEX, the index, between [ R(1), R(2) ], of the solution
%    that was found, or an empty value if no solution was found.
%    If a solution was found, you might call again for further solutions
%    in the unchecked portion of the range, using the range
%    [ INDEX+1, R(2) ].
%
  c = [];
  index = [];
%
%  Using a single integer to track the subsets only works if the number
%  of objects is small enough.  MATLAB can pack no more than 31 bits of
%  information into a nonnegative integer.
%
  if ( nargin < 1 )
    w = input ( 1, '  Enter the vector of weights [ w(1), w(2), ..., w(n)]: ' );
  end

  n = length ( w );

  if ( 31 < n )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SUBSET_SUM_FIND - Fatal error!\n' );
    fprintf ( 1, '  This function is restricted to N <= 31.\n' );
    error ( 'SUBSET_SUM_FIND - Fatal error!' );
  end

  if ( nargin < 2 )
    t = input ( '  Enter the target value T: ' );
  end
%
%  Make sure the range is reasonable.
%
  if ( nargin < 3 )
    r(1) = 0;
    r(2) = 2^n - 1;
  else
    r(1) = max ( r(1), 0 );
    r(2) = min ( r(2), 2^n - 1 );
  end

  fprintf ( 1, '\n' )
  fprintf ( 1, '  Searching indices %d through %d\n', r(1), r(2) );
%
%  Run through the range.
%
  for index = r(1) : r(2)
%
%  Convert INDEX into vector of indices in W.
%
    c = find ( bitget ( index, 1:n ) );
%
%  If the sum of those weights matches the target, return combination.
%
    if ( sum ( w(c) ) == t )
      return
    end

  end

  index = [];

  return
end
