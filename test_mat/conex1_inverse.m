function a = conex1_inverse ( alpha )

%*****************************************************************************80
%
%% CONEX1_INVERSE returns the inverse of the CONEX1 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the scalar defining A.  
%    A common value is 100.0.
%
%    Output, real A(4,4), the matrix.
%
  a = zeros ( 4, 4 );

  a(1,1) =  1.0;
  a(1,2) =  1.0 - alpha;
  a(1,3) =        alpha;
  a(1,4) =  2.0;

  a(2,1) =  0.0;
  a(2,2) =  1.0 + alpha;
  a(2,3) =      - alpha;
  a(2,4) =  0.0;

  a(3,1) =  0.0;
  a(3,2) = -1.0;
  a(3,3) =  1.0;
  a(3,4) =  1.0 / alpha;

  a(4,1) = 0.0;
  a(4,2) = 0.0;
  a(4,3) = 0.0;
  a(4,4) = 1.0 / alpha;

  return
end
