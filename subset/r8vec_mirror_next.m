function [ a, done ] = r8vec_mirror_next ( n, a )

%*****************************************************************************80
%
%% R8VEC_MIRROR_NEXT steps through all sign variations of an R8VEC.
%
%  Discussion:
%
%    In normal use, the user would set every element of A to be positive.
%    The routine will take the input value of A, and output a copy in
%    which the signs of one or more entries have been changed.  Repeatedly
%    calling the routine with the output from the previous call will generate
%    every distinct "variation" of A; that is, all possible sign variations.
%
%    When the output variable DONE is TRUE (or equal to 1), then the
%    output value of A is the last in the series.
%
%    Note that A may have some zero values.  The routine will essentially
%    ignore such entries; more exactly, it will not stupidly assume that -0
%    is a proper "variation" of 0!
%
%    Also, it is possible to call this routine with the signs of A set
%    in any way you like.  The routine will operate properly, but it
%    will nonethess terminate when it reaches the value of A in which
%    every nonzero entry has negative sign.
%
%    More efficient algorithms using the Gray code seem to require internal
%    memory in the routine, which is not one of MATLAB's strong points,
%    or the passing back and forth of a "memory array", or the use of
%    global variables, or unnatural demands on the user.  This form of
%    the routine is about as clean as I can make it.
%
%  Example:
%
%      Input         Output
%    ---------    --------------
%    A            A         DONE
%    ---------    --------  ----
%     1  2  3     -1  2  3  false
%    -1  2  3      1 -2  3  false
%     1 -2  3     -1 -2  3  false
%    -1 -2  3      1  2 -3  false
%     1  2 -3     -1  2 -3  false
%    -1  2 -3      1 -2 -3  false
%     1 -2 -3     -1 -2 -3  false
%    -1 -2 -3      1  2  3  true
%
%     1  0  3     -1  0  3  false
%    -1  0  3      1  0 -3  false
%     1  0 -3     -1  0 -3  false
%    -1  0 -3      1  0  3  true
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    19 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    A Nijenhuis and H Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, real A(N), a vector of real numbers.
%
%    Output, real A(N), some signs have been changed.
%
%    Output, logical DONE, is TRUE if the input vector A was the last element
%    in the series (every entry was nonpositive); the output vector is reset 
%    so that all entries are nonnegative, but presumably the ride is over!
%

%
%  Seek the first strictly positive entry of A.
%
  positive = 0;
  for i = 1 : n
    if ( 0.0 < a(i) )
      positive = i;
      break
    end
  end
%
%  If there is no strictly positive entry of A, there is no successor.
%
  if ( positive == 0 )
    a(1:n) = -a(1:n);
    done = 1;
    return
  end
%
%  Otherwise, negate A up to the positive entry.
%
  a(1:positive) = -a(1:positive);
  done = 0;

  return
end
