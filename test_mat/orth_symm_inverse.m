function a = orth_symm_inverse ( n )

%*****************************************************************************80
%
%% ORTH_SYMM_INVERSE returns the inverse of the ORTH_SYMM matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a = orth_symm ( n );

  return
end
