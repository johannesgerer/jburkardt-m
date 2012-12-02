function p14_title ( )

%*****************************************************************************80
%
%% P14_TITLE prints a title for problem 14.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    None
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Problem 14\n' );
  fprintf ( 1, '  Name:       BFN04\n' );
  fprintf ( 1, '              Bratley, Fox, Niederreiter, #4\n' );
  fprintf ( 1, '  Region:     0 <= X(i) <= 1\n' );
  fprintf ( 1, '  Integrand:  F(X) = sum ( -1^I * product(X(1:I)) )\n' );

  return
end
