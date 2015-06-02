function n = square_arbq_size ( degree )

%*****************************************************************************80
%
%% SQUARE_ARBQ_SIZE: size of quadrature rule for the symmetric square.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 July 2014
%
%  Author:
%
%    John Burkardt.
%
%  Reference:
%
%    Hong Xiao, Zydrunas Gimbutas,
%    A numerical algorithm for the construction of efficient quadrature
%    rules in two and higher dimensions,
%    Computers and Mathematics with Applications,
%    Volume 59, 2010, pages 663-676.
%
%  Parameters:
%
%    Input, integer DEGREE, the desired degree of exactness.
%    1 <= DEGREE <= 30.
%
%    Output, integer N, the number of points in the
%    corresponding rule.
%
  n_save = [ ...
      1,   3,   4,   6,   7, ...
     10,  12,  16,  17,  22, ...
     24,  31,  33,  41,  44, ...
     52,  55,  64,  68,  78, ...
     82,  93,  98, 109, 115, ...
    127, 132, 147, 152, 167 ];

  if ( degree < 1 | 30 < degree )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SQUARE_ARBQ_SIZE - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of DEGREE.\n' );
    error ( 'SQUARE_ARBQ_SIZE - Fatal error!' );
  end

  n = n_save ( degree );

  return
end
