function value = lietzke_condition ( n )

%*****************************************************************************80
%
%% LIETZKE_CONDITION returns the L1 condition of the LIETZKE matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real VALUE, the L1 condition.
%
  s = 0;
  k = n;
  for i = 1 : n
    s = s + k;
    if ( mod ( i, 2 ) == 1 )
      k = k - 1;
    end
  end
  a_norm = s;
  if ( n == 1 )
    b_norm = 0.25;
  elseif ( n == 2 )
    b_norm = 5.0 / 6.0;
  else
    b_norm = 2.0;
  end
  value = a_norm * b_norm;
    
  return
end