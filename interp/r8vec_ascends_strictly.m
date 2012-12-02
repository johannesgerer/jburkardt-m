function value = r8vec_ascends_strictly ( n, x )

%*****************************************************************************80
%
%% R8VEC_ASCENDS_STRICTLY determines if an R8VEC is strictly ascending.
%
%  Discussion:
%
%    An R8VEC is a vector of R8's.
%
%    Notice the effect of entry number 6 in the following results:
%
%      X = ( -8.1, 1.3, 2.2, 3.4, 7.5, 7.4, 9.8 )
%      Y = ( -8.1, 1.3, 2.2, 3.4, 7.5, 7.5, 9.8 )
%      Z = ( -8.1, 1.3, 2.2, 3.4, 7.5, 7.6, 9.8 )
%
%      R8VEC_ASCENDS_STRICTLY ( X ) = FALSE
%      R8VEC_ASCENDS_STRICTLY ( Y ) = FALSE
%      R8VEC_ASCENDS_STRICTLY ( Z ) = TRUE
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the size of the array.
%
%    Input, real X(N), the array to be examined.
%
%    Output, logical R8VEC_ASCENDS_STRICTLY, is TRUE if the
%    entries of X strictly ascend.
%
  for i = 1 : n - 1
    if ( x(i+1) <= x(i) )
      value = 0;
      return
    end
  end

  value = 1;

  return
end
