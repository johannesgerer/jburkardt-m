function value = boothroyd_condition ( n )

%*****************************************************************************80
%
%% BOOTHROYD_CONDITION returns the L1 condition of the BOOTHROYD matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real VALUE, the L1 condition.
%
  a_norm = 0.0;
  for j = 1 : n
    s = 0.0;
    for i = 1 : n

      s = s + r8_choose ( n + i - 1, i - 1 ) * r8_choose ( n - 1, n - j ) ...
        * n / ( i + j - 1 );

    end
    a_norm = max ( a_norm, s );
  end

  b_norm = a_norm;

  value = a_norm * b_norm;

  return
end
