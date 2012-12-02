function num = unicycle_enum ( n )

%*****************************************************************************80
%
%% UNICYCLE_ENUM enumerates the unicycles.
%
%  Discussion:
%
%    Each standard sequence corresponds to a unique unicycle.  Since the
%    first element of a standard sequence is always 1, the number of standard
%    sequences, and hence the number of unicycles, is (n-1)%.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the unicyle.
%
%    Output, integer NUM, the number of unicycles.
%
  num = i4_factorial ( n - 1 );

  return
end
