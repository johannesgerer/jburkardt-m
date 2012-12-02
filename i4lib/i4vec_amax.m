function aamax = ivec_amax ( n, a )

%*****************************************************************************80
%
%% IVEC_AMAX returns the largest magnitude in an I4VEC.
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
%    Input, integer N, the number of entries in the vector.
%
%    Input, integer A(N), the vector to be searched.
%
%    Output, integer AAMAX, the value of the entry of largest magnitude.
%
  aamax = max ( abs ( a(1:n) ) );

  return
end
