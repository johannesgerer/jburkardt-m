function a = r8vec_indicator0 ( n )

%*****************************************************************************80
%
%% R8VEC_INDICATOR0 sets an R8VEC to the indicator vector (0,1,2,...).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Output, real A(N), the vector.
%
  a = ( 0 : n - 1 );

  return
end

