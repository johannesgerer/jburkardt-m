function u = unicycle_index_to_sequence ( n, u_index )

%*****************************************************************************80
%
%% UNICYCLE_INDEX_TO_SEQUENCE converts a unicycle from index to sequence form.
%
%  Example:
%
%    N = 4
%
%    U_INDEX = 3 1 4 2
%    U       = 1 3 4 2
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
%    Input, integer N, the order of the unicycles.
%
%    Output, integer U_INDEX(N), the unicycle index vector.
%
%    Input, integer U(N), the unicycle sequence vector.
%
  u(1) = 1;
  i = 1;

  for j = 2 : n

    i = u_index(i);
    u(j) = i;

    if ( i == 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'UNICYCLE_INDEX_TO_SEQUENCE - Fatal error!\n' );
      fprintf ( 1, '  The index vector does not represent a unicycle.\n' );
      fprintf ( 1, '  On step %d, u_index(%d) = 1.\n', j, i );
      error ( 'UNICYCLE_INDEX_TO_SEQUENCE - Fatal error!' );
    end

  end

  return
end
