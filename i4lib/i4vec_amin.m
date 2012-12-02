function aamin = ivec_amin ( n, a )

%*****************************************************************************80
%
%% IVEC_AMIN returns the smallest magnitude in an I4VEC.
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
%    Input, integer N, the number of entries to be checked.
%
%    Input, integer A(N), the vector to be checked.
%
%    Output, integer AAMIN, the value of the smallest magnitude.
%
  aamin = min ( abs ( a(1:n) ) );

  return
end
