function polynomial_print ( d, o, c, e, title )

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
%    21 November 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer D, the spatial dimension.
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
      f = mono_unrank_grlex ( d, e(j) );
      for i = 1 : d
        fprintf ( 1, '%d', f(i) )
        if ( i < d )
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

