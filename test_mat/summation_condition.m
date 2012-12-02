function cond = summation_condition ( n )

%*****************************************************************************80
%
%% SUMMATION_CONDITION returns the L1 condition of the SUMMATION matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real COND, the L1 condition number.
%
  if ( n == 1 )
    cond = 1.0;
  else
    cond = 2.0 * n;
  end

  return
end
