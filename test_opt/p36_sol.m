function [ know, x ] = p36_sol ( know, n, x )

%*****************************************************************************80
%
%% P36_SOL returns the solution for problem 36.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the problem.  This value
%    is only needed for those problems with variable N.
%
%    Output, integer KNOW.
%    If KNOW is 0, then the solution is not known.
%    If KNOW is positive, then the solution is known, and is returned in X.
%
%    Output, real X(N), the solution, if known.
%
  know = 1;

  [ b, m1, m2, r11, r12, r21, r22, seed ] = p36_p_get ( );

  if ( m2 < m1 )
    x = [ r11, r21 ]';
  else
    x = [ r12, r22 ]';
  end

  return
end
