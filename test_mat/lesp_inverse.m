function a = lesp_inverse ( n )

%*****************************************************************************80
%
%% LESP_INVERSE returns the inverse of the LESP matrix.
%
%  Discussion:
%
%    This computation is an application of the TRIV_INVERSE function.
%
%  Example:
%
%    N = 5
%   -0.2060   -0.0598   -0.0201   -0.0074   -0.0028
%   -0.0150   -0.1495   -0.0504   -0.0184   -0.0071
%   -0.0006   -0.0056   -0.1141   -0.0418   -0.0161
%   -0.0000   -0.0001   -0.0026   -0.0925   -0.0356
%   -0.0000   -0.0000   -0.0000   -0.0014   -0.0775
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    CM daFonseca, J Petronilho,
%    Explicit Inverses of Some Tridiagonal Matrices,
%    Linear Algebra and Its Applications,
%    Volume 325, 2001, pages 7-21.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real A(N,N), the inverse of the matrix.
%
  x = zeros ( n - 1, 1 );
  for i = 1 : n - 1
    x(i) = 1.0 / ( i + 1 );
  end

  y = zeros ( n, 1 );
  for i = 1 : n
    y(i) = ( - 2 * i - 3 );
  end

  z = zeros ( n - 1, 1 );
  for i = 1 : n - 1
    z(i) = ( i + 1 );
  end

  a = triv_inverse ( n, x, y, z );

  return
end
