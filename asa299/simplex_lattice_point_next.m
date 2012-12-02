function [ more, x ] = simplex_lattice_point_next ( n, t, more, x )

%*****************************************************************************80
%
%% SIMPLEX_LATTICE_POINT_NEXT generates lattice points in a simplex.
%
%  Discussion:
%
%    The simplex is defined by N-dimensional points X such that:
%
%        0 <= X(1:N)
%
%    and
%
%      sum ( X(1:N) ) <= T
%
%    where T is an integer.
%
%    Lattice points are points X which satisfy the simplex conditions and
%    for which all the components are integers.
%
%    This routine generates all the lattice points in a given simplex, one at
%    a time, in a reverse lexicographic order.
%
%    To use the routine, initialize by setting N and T to appropriate values,
%    and MORE to FALSE.  Initialize X to the empty vector, [].
%
%    Call the routine. On return, X will contain the first lattice point in
%    the simplex.  If MORE is TRUE, then the routine may be called again to
%    get the next point.  In fact, as long as the output value of MORE is
%    TRUE, there is at least one more lattice point that can be found by
%    making another call.  When MORE is returned as FALSE, then there are no
%    more lattice points; the value of X returned at that time is the
%    "last" such point.
%
%    During the computation of a sequence of lattice points, the user should
%    not change the values of N, T, MORE or X.
%
%    The output for N = 3, T = 4 would be:
%
%       1    4  0  0
%       2    3  1  0
%       3    3  0  1
%       4    2  2  0
%       5    2  1  1
%       6    2  0  2
%       7    1  3  0
%       8    1  2  1
%       9    1  1  2
%      10    1  0  3
%      11    0  4  0
%      12    0  3  1
%      13    0  2  2
%      14    0  1  3
%      15    0  0  4
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Scott Chasalow, Richard Brand,
%    Algorithm AS 299:
%    Generation of Simplex Lattice Points,
%    Applied Statistics,
%    Volume 44, Number 4, 1995, pages 534-545.
%
%    Albert Nijenhuis, Herbert Wilf,
%    Combinatorial Algorithms for Computers and Calculators,
%    Second Edition,
%    Academic Press, 1978,
%    ISBN: 0-12-519260-6,
%    LC: QA164.N54.
%
%  Parameters:
%
%    Input, integer N, the spatial dimension.
%    N must be positive.
%
%    Input, integer T, the characteristic of the simplex.
%    T must be nonnegative.
%
%    Input, logical MORE, initialized to FALSE by the user to
%    begin a sequence of calculations.  Thereafter, the input value
%    should be the output value from the previous call.
%
%    Input, integer X(N), should be initialized to [] on the very first
%    call.  Thereafter, the input value should be the output value
%    from the previous call.
%
%    Output, logical MORE, returned by the routine as TRUE,
%    if there are more values of X that can be calculated, or FALSE
%    if the accompanying value of X is the last one for this sequence.
%
%    Output, integer X(N), the next point in the sequence.
%
  if ( ~more )

    if ( n < 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SIMPLEX_LATTICE_POINT_NEXT - Fatal error!\n' );
      fprintf ( 1, '  N < 1.\n' );
      error ( 'SIMPLEX_LATTICE_POINT_NEXT - Fatal error!' );
    end

    if ( t < 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SIMPLEX_LATTICE_POINT_NEXT - Fatal error!\n' );
      fprintf ( 1, '  T < 0.\n' );
      error ( 'SIMPLEX_LATTICE_POINT_NEXT - Fatal error!' );
    end

    more = 1;
    j = 1;

    x(1) = t;
    x(2:n) = 0;
%
%  The first point can actually also be the last!
%
    if ( n == 1 )
      more = 0;
    end

  else
%
%  Search X(N-1 down to 1) for the first nonzero element.
%  If none, then terminate.  (This should not happen!)
%  Otherwise, set J to this index.
%  Decrement X(J) by 1.
%  Set X(J+1:N) to (T-X(1:J),0,0,...0).
%
    j = n;

    for i = n - 1 : -1 : 1

      if ( 0 < x(i) )
        j = i;
        break
      end

    end

    if ( j == n )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SIMPLEX_LATTICE_POINT_NEXT - Fatal error!\n' );
      fprintf ( 1, '  The input X vector is nonpositive in all entries\n' );
      fprintf ( 1, '  except possibly the last one.\n' );
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Perhaps the user has miscalled the routine\n' );
      fprintf ( 1, '  or altered data between calls.\n' );
      fprintf ( 1, '\n' );
      fprintf ( 1, 'ABNORMAL TERMINATION.\n' );
      error ( 'SIMPLEX_LATTICE_POINT_NEXT - Fatal error!' );
    end

    x(j) = x(j) - 1;
    x(j+1) = t - sum ( x(1:j) );
    x(j+2:n) = 0;
%
%  Is this the last point?
%
    if ( x(n) == t )
      more = 0;
    end

  end

  return
end

