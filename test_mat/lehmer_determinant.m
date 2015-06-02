function value = lehmer_determinant ( n )

%*****************************************************************************80
%
%% LEHMER_DETERMINANT returns the determinant of the LEHMER matrix.
%
%  Formula:
%
%    determinant = (2n)! / 2^n / (n!)^3
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Emrah Kilic, Pantelimon Stanica,
%    The Lehmer matrix and its recursive analogue,
%    Journal of Combinatorial Mathematics and Combinatorial Computing,
%    Volume 74, August 2010, pages 193-205.
%
%  Parameters:
%
%    Input, integer M, N, the order of the matrix.
%
%    Output, real VALUE, the determinant.
%
  value = 1.0;
  for i = 1 : n
    value = value * ( n + i ) / ( 2 * i * i );
  end

  return
end
