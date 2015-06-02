function mono_print ( m, f, title )

%*****************************************************************************80
%
%% MONO_PRINT prints a monomial.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 September 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer F(M), the exponents.
%        
%    Input, string TITLE, a title.
%
  fprintf ( 1, '%s', title );
  fprintf ( 1, 'x^(' );
  for i = 1 : m
    fprintf ( 1, '%d', f(i) )
    if ( i < m )
      fprintf ( 1, ',' )
    else
      fprintf ( 1, ').\n' );
    end
  end

  return
end

