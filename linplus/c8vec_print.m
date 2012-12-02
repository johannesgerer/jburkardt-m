function c8vec_print ( n, a, title )

%*****************************************************************************80
%
%% C8VEC_PRINT prints a complex vector.
%
%  Discussion:
%
%    As far as I can tell, MATLAB doesn't have an economical way
%    to print a complex number.  Perhaps this is because of forcing
%    it to use C syntax.  Nonetheless, if you want to print a complex
%    number, good luck trying to find an explanation or example!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the vector.
%
%    Input, complex A(N), the vector to be printed.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );
  for i = 1 : n
    if ( real ( a(i) ) == 0 & imag ( a(i) ) == 0 )
      fprintf ( 1, '%6d        0\n', i );
    elseif ( real ( a(i) ) == 0 )
      fprintf ( 1, '%6d                 %12g i\n', i, imag ( a(i) ) );
    elseif ( imag ( a(i) ) == 0 )
      fprintf ( 1, '%6d  %12g\n', i, real ( a(i) ) );
    else
      fprintf ( 1, '%6d  %12g + %12g i\n', i, real ( a(i) ), imag ( a(i) ) );
    end
  end

  return
end
