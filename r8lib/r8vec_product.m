function value = r8vec_product ( n, a )

%*****************************************************************************80
%
%% R8VEC_PRODUCT returns the product of the entries of an R8VEC.
%
%  Discussion:
%
%    In FORTRAN90, this facility is offered by the built in
%    PRODUCT function:
%
%      VEC_PRODUCT ( N, A ) = PRODUCT ( A(1:N) )
%
%    In MATLAB, this facility is offered by the built in
%    PROD function:
%
%      VEC_PRODUCT ( N, A ) = PROD ( A(1:N) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 May 2005
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
%    Output, real VALUE, the product of the entries.
%
  value = prod ( a(1:n) );

  return
end
