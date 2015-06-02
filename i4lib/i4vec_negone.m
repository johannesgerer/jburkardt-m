function a = i4vec_negone ( n )

%*****************************************************************************80
%
%% I4VEC_NEGONE returns an I4VEC of -1's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 October 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the size of the input array.
%
%    Output, integer A(N,1), an array of -1's.
%
  a(1:n,1) = -1;

  return
end
