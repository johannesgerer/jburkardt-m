function polynomial_print ( m, o, c, e, title )

%*****************************************************************************80
%
%% POLYNOMIAL_PRINT prints a polynomial.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 September 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer O, the "order" of the polynomial, that is,
%    simply the number of terms.
%
%    Input, real C(O), the coefficients.
%
%    Input, integer E(O), the indices of the exponents.
%        
%    Input, string TITLE, a title.
%
  fprintf ( 1, '%s\n', title );

  if ( o == 0 ) then
    fprintf ( 1, '      0.\n' );
  else
    for j = 1 : o
      fprintf ( 1, '    ' );
      if ( c(j) < 0 )
        fprintf ( 1, '- ' )
      else
        fprintf ( 1, '+ ' )
      end
      fprintf ( 1, '%g * x^(', abs ( c(j) ) );
      f = mono_unrank_grlex ( m, e(j) );
      for i = 1 : m
        fprintf ( 1, '%d', f(i) )
        if ( i < m )
          fprintf ( 1, ',' )
        else
          fprintf ( 1, ')' );
        end
      end
      if ( j == o )
        fprintf ( 1, '.' );
      end
      fprintf ( 1, '\n' );
    end
  end

  return
end

