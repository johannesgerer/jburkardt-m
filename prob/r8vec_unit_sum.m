function a = r8vec_unit_sum ( n, a )

%*****************************************************************************80
%
%% R8VEC_UNIT_SUM normalizes an R8VEC to have unit sum.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, real A(N), the vector to be normalized.
%
%    Output, real A(N), the entries of A should have unit sum.  However, 
%    if the input vector has zero sum, the routine halts.
%
  a_sum = sum ( a(1:n) );

  if ( a_sum == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8VEC_UNIT_SUM - Fatal error!\n' );
    fprintf ( 1, '  The vector entries sum to 0.\n' );
    error ( 'R8VEC_UNIT_SUM - Fatal error!' );
  end

  a(1:n) = a(1:n) / a_sum;

  return
end

