function lattice_print ( dim_num, m, z, title )

%*****************************************************************************80
%
%% LATTICE_PRINT prints the points in a lattice rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 November 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Ian Sloan, Stephen Joe,
%    Lattice Methods for Multiple Integration,
%    Oxford, 1994,
%    ISBN: 0198534728,
%    LC: QA311.S56
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer M, the number of points to use.
%
%    Input, integer Z(DIM_NUM), the generator vector.
%
%    Input, string TITLE, an optional title.
%
  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

  fprintf ( 1, '\n' );

  for i = 0 : m - 1
    y(1:dim_num) = mod ( i * z(1:dim_num), m );
    fprintf ( 1, '%4d    ', i + 1 );
    for dim = 1 : dim_num
      fprintf ( 1, '%4d', y(dim) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
