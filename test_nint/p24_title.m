function p24_title ( )

%*****************************************************************************80
%
% P24_TITLE prints a title for problem 24.
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
  fprintf ( 1, 'Problem 24\n' );
  fprintf ( 1, '  Name:       (|4X-2|+C)/(1+C)\n' );
  fprintf ( 1, '  Region:     0 <= X(i) <= 1\n' );
  fprintf ( 1, '  Integrand:  F(X) = prod ( (|4*X(i)-2|+C(i)) / (1+C(i)) )\n' );
  fprintf ( 1, '  Parameters:\n' ); 
  fprintf ( 1, '              C(1:DIM_NUM) defaults to 0.0\n' );

  return
end
