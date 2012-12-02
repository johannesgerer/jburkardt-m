function value = alnfac ( n )

%*****************************************************************************80
%
%% ALNFAC computes the logarithm of the factorial of N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the argument of the factorial.
%
%    Output, real VALUE, the logarithm of the factorial of N.
%
  value = alngam ( n + 1 );

  return
end
