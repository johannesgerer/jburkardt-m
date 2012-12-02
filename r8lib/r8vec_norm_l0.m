function value = r8vec_norm_l0 ( n, a )

%*****************************************************************************80
%
%% R8VEC_NORM_L0 returns the l0 "norm" of an R8VEC.
%
%  Discussion:
%
%    An R8VEC is a vector of R8's.
%
%    The l0 "norm" simply counts the number of nonzero entries in the vector.
%    It is not a true norm, but has some similarities to one.  It is useful
%    in the study of compressive sensing.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, real A(N), the vector.
%
%    Output, integer R8VEC_NORM_L0, the value of the norm.
%
  value = sum ( a(1:n) ~= 0.0 );

  return
end
