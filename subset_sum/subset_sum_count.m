function count = subset_sum_count ( w, t, r )

%*****************************************************************************80
%
%% SUBSET_SUM_COUNT counts the solutions to the subset sum problem in a given range.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 May 2012
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
%    Output, integer COUNT, the number of solutions found in this range.
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
  count = 0;

  for index = r(1) : r(2)
%
%  Convert INDEX into vector of indices in W.
%
    c = find ( bitget ( index, 1:n ) );
%
%  If the sum of those weights matches the target, increment the count.
%
    if ( sum ( w(c) ) == t )
      count = count + 1;
    end

  end

  index = [];

  return
end
