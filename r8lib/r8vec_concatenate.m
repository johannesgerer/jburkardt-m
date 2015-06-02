function c = r8vec_concatenate ( n1, a, n2, b )

%*****************************************************************************80
%
%% R8VEC_CONCATENATE concatenates two R8VEC's.
%
%  Discussion:
%
%    An R8VEC is a vector of R8 values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N1, the number of entries in the first vector.
%
%    Input, real A(N1), the first vector.
%
%    Input, integer N2, the number of entries in the second vector.
%
%    Input, real B(N2), the second vector.
%
%    Output, real C(N1+N2), the concatenation of A and B.
%
  c(   1:n1)    = a(1:n1);
  c(n1+1:n1+n2) = b(1:n2);

  return
end
