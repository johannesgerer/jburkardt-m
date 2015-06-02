function n = tetrahedron_arbq_size ( degree )

%*****************************************************************************80
%
%% TETRAHEDRON_ARBQ_SIZE returns the size of quadrature rule for a tetrahedron.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 July 2014
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
%    1 <= DEGREE <= 15.
%
%    Output, integer TETRAHEDRON_ARBQ_SIZE, the number of points 
%    in the corresponding rule.
%
  n_save = [ ...
      1,   4,   6,  11,  14, ...
     23,  31,  44,  57,  74, ...
     95, 122, 146, 177, 214 ];

  if ( degree < 1 || 15 < degree )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TETRAHEDRON_ARBQ_SIZE - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of DEGREE.\n' );
    error ( 'TETRAHEDRON_ARBQ_SIZE - Fatal error!' );
  end

  n = n_save ( degree );

  return
end

