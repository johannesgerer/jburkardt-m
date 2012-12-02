function a = upshift_inverse ( n )

%*****************************************************************************80
%
%% UPSHIFT_INVERSE returns the inverse of the UPSHIFT matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real A(N,N), the matrix.
%
  a = downshift ( n );

  return
end
