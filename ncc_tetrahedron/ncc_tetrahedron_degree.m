function degree = ncc_tetrahedron_degree ( rule )

%*****************************************************************************80
%
%% NCC_TETRAHEDRON_DEGREE returns the degree of an NCC rule for the tetrahedron.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Peter Silvester,
%    Symmetric Quadrature Formulae for Simplexes,
%    Mathematics of Computation,
%    Volume 24, Number 109, January 1970, pages 95-100.
%
%  Parameters:
%
%    Input, integer RULE, the index of the rule.
%
%    Output, integer DEGREE, the polynomial degree of exactness of
%    the rule.
%
  if ( 1 <= rule & rule <= 7 )
    degree = rule - 1;
  else

    degree = -1;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NCC_TETRAHEDRON_DEGREE - Fatal error!\n' );
    fprintf ( 1, '  Illegal RULE = %d\n', rule );
    error ( 'NCC_TETRAHEDRON_DEGREE - Fatal error!' )

  end

  return
end
