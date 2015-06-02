function quad_rule_print ( m, n, x, w, title )

%*****************************************************************************80
%
%% QUAD_RULE_PRINT prints a multidimensional quadrature rule.
%
%  Discussion:
%
%    I'm not trying to be difficult, but I feel that the proper format for
%    an array of multidimensional points requires that "M" indicate the spatial
%    dimension, "N" the number of points, and that the array be formatted
%    as X(M,N).  This may require transposing the input data before the call.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real X(M,N), the abscissas.
%
%    Input, real W(N), the weights.
%
%    Input, string TITLE, a title for the rule.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );

  for j = 1 : n
    fprintf ( 1, '  %2d:  %g * f(', j, w(j) );
    for i = 1 : m
      fprintf ( 1, '%g', x(i,j) );
      if ( i < m )
        fprintf ( 1, ',' );
      else
        fprintf ( 1, ')\n');
      end
    end
  end

  return
end
