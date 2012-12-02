function [ amin, amax ] = r8vec_range_2 ( n, a, amin, amax )

%*****************************************************************************80
%
%% R8VEC_RANGE_2 updates a range to include a new array.
%
%  Discussion:
%
%    Given a range AMIN to AMAX, and an array A, the routine will
%    decrease AMIN if necessary, or increase AMAX if necessary, so that
%    every entry of A is between AMIN and AMAX.
%
%    However, AMIN will not be increased, nor AMAX decreased.
%
%    This routine may be used to compute the maximum and minimum of a
%    collection of arrays one at a time.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the array.
%
%    Input, real A(N), the array.
%
%    Input, real AMIN, AMAX, the current legal range of values for A.
%
%    Output, real AMIN, AMAX, unchanged, or else "widened" so that all entries
%    of A are within the range.
%
  amax = max ( amax, max ( a(1:n) ) );
  amin = min ( amin, min ( a(1:n) ) );

  return
end
